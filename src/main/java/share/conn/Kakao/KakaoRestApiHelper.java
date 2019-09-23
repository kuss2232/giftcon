package share.conn.Kakao;

import javax.net.ssl.HttpsURLConnection;
import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
//import com.google.gson.Gson;

public class KakaoRestApiHelper {

	public enum HttpMethodType {
		POST, GET, DELETE
	}

	private static final String API_SERVER_HOST = "https://kapi.kakao.com";
	private static final String PAY_READY_PATH = "/v1/payment/ready";
	private static final String PAY_END_PATH = "/v1/payment/approve";

	private static final String USER_IDS_PATH = "/v1/user/ids";

	private static final String PUSH_REGISTER_PATH = "/v1/push/register";
	private static final String PUSH_TOKENS_PATH = "/v1/push/tokens";
	private static final String PUSH_DEREGISTER_PATH = "/v1/push/deregister";
	private static final String PUSH_SEND_PATH = "/v1/push/send";

	private static final ObjectMapper JACKSON_OBJECT_MAPPER = new ObjectMapper();
	// private static final Gson GSON = new Gson();
	// private static final String PROPERTIES_PARAM_NAME = "properties";

	private static final List<String> adminApiPaths = new ArrayList<String>();

	static {
		adminApiPaths.add(USER_IDS_PATH);
		adminApiPaths.add(PUSH_REGISTER_PATH);
		adminApiPaths.add(PUSH_TOKENS_PATH);
		adminApiPaths.add(PUSH_DEREGISTER_PATH);
		adminApiPaths.add(PUSH_SEND_PATH);
		adminApiPaths.add(PAY_READY_PATH);
		adminApiPaths.add(PAY_END_PATH);
	}

	private String accessToken = "a5cf51dd68a4248af8b8c19910539a19";
	private String adminKey = "0b02f095cf5f90b9bbe7eadcd70b9062";

	public String readyPay(final Map<String, String> params) {
		return request(HttpMethodType.POST, PAY_READY_PATH, mapToParams(params));// map 객체를 parameter 형식으로 변환
	}

	public String successPay(final Map<String, String> params) {
		return request(HttpMethodType.POST, PAY_END_PATH, mapToParams(params));
	}

	///////////////////////////////////////////////////////////////
	// Push Notification
	///////////////////////////////////////////////////////////////

	public String registerPush(final Map<String, String> params) {
		return request(HttpMethodType.POST, PUSH_REGISTER_PATH, mapToParams(params));
	}

	public String getPushTokens(final Map<String, String> params) {
		return request(HttpMethodType.GET, PUSH_TOKENS_PATH, mapToParams(params));
	}

	public String deregisterPush(final Map<String, String> params) {
		return request(HttpMethodType.POST, PUSH_DEREGISTER_PATH, mapToParams(params));
	}

	public String sendPush(final Map<String, String> params) {
		return request(HttpMethodType.POST, PUSH_SEND_PATH, mapToParams(params));
	}

	public String request(final String apiPath) {
		return request(HttpMethodType.GET, apiPath, null);
	}

	public String request(final HttpMethodType httpMethod, final String apiPath) {
		return request(httpMethod, apiPath, null);
	}

	public String request(HttpMethodType httpMethod, final String apiPath, final String params) {

		String requestUrl = API_SERVER_HOST + apiPath;
		if (httpMethod == null) {
			httpMethod = HttpMethodType.GET;
		}
		if (params != null && params.length() > 0
				&& (httpMethod == HttpMethodType.GET || httpMethod == HttpMethodType.DELETE)) {
			requestUrl += params;
		}

		HttpsURLConnection conn;
		OutputStreamWriter writer = null;
		BufferedReader reader = null;
		InputStreamReader isr = null;

		try {
			final URL url = new URL(requestUrl);
			conn = (HttpsURLConnection) url.openConnection();
			conn.setRequestMethod(httpMethod.toString());

			if (adminApiPaths.contains(apiPath)) {
				conn.setRequestProperty("Authorization", "KakaoAK " + this.adminKey);
			} else {
				conn.setRequestProperty("Authorization", "Bearer " + this.accessToken);
			}

			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			conn.setRequestProperty("charset", "utf-8");

			if (params != null && params.length() > 0 && httpMethod == HttpMethodType.POST) {
				conn.setDoOutput(true);
				writer = new OutputStreamWriter(conn.getOutputStream());
				writer.write(params);
				writer.flush();
			}

			final int responseCode = conn.getResponseCode();
			System.out.println(String.format("\nSending '%s' request to URL : %s", httpMethod, requestUrl));
			System.out.println("Response Code : " + responseCode);
			if (responseCode == 200)
				isr = new InputStreamReader(conn.getInputStream());
			else
				isr = new InputStreamReader(conn.getErrorStream());

			reader = new BufferedReader(isr);
			final StringBuffer buffer = new StringBuffer();
			String line;
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			System.out.println(buffer.toString());
			return buffer.toString();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (writer != null)
				try {
					writer.close();
				} catch (Exception ignore) {
				}
			if (reader != null)
				try {
					reader.close();
				} catch (Exception ignore) {
				}
			if (isr != null)
				try {
					isr.close();
				} catch (Exception ignore) {
				}
		}

		return null;
	}

	public String urlEncodeUTF8(String s) {
		try {
			return URLEncoder.encode(s, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new UnsupportedOperationException(e);
		}
	}

	public String mapToParams(Map<String, String> map) {
		StringBuilder paramBuilder = new StringBuilder();
		for (String key : map.keySet()) {
			paramBuilder.append(paramBuilder.length() > 0 ? "&" : "");
			paramBuilder.append(String.format("%s=%s", urlEncodeUTF8(key), urlEncodeUTF8(map.get(key).toString())));
		}
		return paramBuilder.toString();
	}

	public String mapToJsonStr(Map<String, String> map) throws JsonProcessingException {
		return JACKSON_OBJECT_MAPPER.writeValueAsString(map);
		// return GSON.toJson(map);
	}
}