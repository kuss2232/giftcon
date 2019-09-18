package share.conn.admin;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	@Resource(name = "adminService")
	private AdminService adminService;
	
	@RequestMapping("/adminMain.conn")
	public ModelAndView adminMain() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/adminMain");
		return mv;
	}
	
	
	@RequestMapping("/adminOut.conn")
	public ModelAndView adminOut() throws Exception {
		List<Map<String, Object>> outData = adminService.outData();//List에 Map객체를 담아서 선언 map객체는 key value 로 이루어짐
		BufferedWriter bw = null;
		ModelAndView mv = new ModelAndView("/admin/adminMain");
		try {
			File ex = new File("C://data1");
			if(!ex.exists()) {//data1 파일이 존재하지않으면
				ex.mkdirs();//폴더생성
			}
			//파일을 지정된경로에 UTF-8형식으로 저장시킴
			bw = Files.newBufferedWriter(Paths.get("C://data1//data.csv"), Charset.forName("UTF-8"));
			bw.write("BC,GOODS_NAME,DAY_CHECK,GENDER,SC,AGE");
			bw.newLine();//줄바꿈
			int cnt =0; //컬럼변수선언
			for(Map<String, Object> data1 : outData) {//outData가 Map 객체로 만들어진 data1에 map객체 하나씩넣어서 보낸다
				for(Object value : data1.values()) {//map객체에 value 값만 넣어서 value에 보내준다
					bw.write(value+""); //value값을 ""로 감싸서 출력
					cnt++; // 하나씩증감
					if(cnt == 6) { // 컬럼이 6줄되면 다음칸으로 넘어감
					bw.newLine(); // 줄바꿈시켜줌
					cnt=0; // 줄바꾼뒤 초기화
					}else {
						bw.write(",");
					}
				}
			}
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(bw != null) {
					bw.close();
				}
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		return mv;
	}
	
	@RequestMapping("/graph.conn")
	public ModelAndView graph() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/graph");
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/graphing.conn")
	public @ResponseBody JSONObject graphing(HttpServletRequest request) throws Exception{
		String clientId = "kNWuCucXj4LQEsUcCt1O";//애플리케이션 클라이언트 아이디 값";
        String clientSecret = "QKzz1K2RBZ";//애플리케이션 클라이언트 시크릿 값";
        
        
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String category = request.getParameter("category");
        String ages = request.getParameter("ages");
        System.out.println("시작일"+startDate);
        
        String apiURL = "https://openapi.naver.com/v1/datalab/shopping/category/gender";
        
        String body =  "{\"startDate\":\""
//        		+ "\"2017-11-01\""
        		+ startDate
        		+ "\",\"endDate\":\""
        		+ endDate
//        		+ "\"2018-08-06\""
        		+ "\",\"timeUnit\":\"month\""
        		+ ",\"category\":\""
        		+ category
//        		+ "\"50001170\""
        		+ "\",\"device\":\"pc\""
        		+ ",\"ages\":[\""
        		+ ages
//        		+ "[\"40\"]"
        		+ "\"]}";
        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("X-Naver-Client-Id", clientId);
        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        con.setRequestProperty("Content-Type", "application/json");

        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(body);
        wr.flush();
        wr.close();

        int responseCode = con.getResponseCode();
        BufferedReader br;
        if(responseCode==200) { // 정상 호출
        	br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
        } else {  // 에러 발생
        	br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
        }

        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
        	response.append(inputLine);
        }
        br.close();
        System.out.println(response.toString());

        JSONParser jsonParse = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParse.parse(response.toString());
        JSONArray jsonArray = (JSONArray)jsonObj.get("results");

        List<Object> list1 = new ArrayList<Object>();

        for(int i=0; i<jsonArray.size(); i++) {
        	System.out.println("======jsonData :"+i+"========");
        	JSONObject qq = (JSONObject) jsonArray.get(i);
        	JSONArray data = (JSONArray) qq.get("data");

        	JSONArray arr1 = new JSONArray();
        	JSONArray arr2 = new JSONArray();

        	for(int j=0; j<data.size(); j++) { 
        		JSONObject data2 = (JSONObject)data.get(j);
        		if(j%2==0) {
        			list1.add(data2.get("period"));
        			list1.add(data2.get("ratio")); 
        		}else { 
        			list1.add(data2.get("ratio"));

        		} 
        	}
        }
        //-------------------------------------------------------------

        JSONObject jsonData = new JSONObject();// 보내줄 JSON 오브젝트

        JSONArray cols = new JSONArray();

        for(int i=0; i<3; i++) {
        	JSONObject inner = new JSONObject();
        	if(i == 0) {
        		inner.put("id", "");
        		inner.put("label", "month");
        		inner.put("type", "string");
        	}
        	if(i == 1) {
        		inner.put("id", "");
        		inner.put("label", "male");
        		inner.put("type", "number");
        	}else if(i ==2){
        		inner.put("id", "");
        		inner.put("label", "female");
        		inner.put("type", "number");
        	}
        	cols.add(inner);
        }
        jsonData.put("cols",cols);

        //            System.out.println("이거는 만든거"+jsonData);            

        JSONArray rows = new JSONArray();

        for(int i=0; i<list1.size(); i+=3) {
        	JSONObject jo1 = new JSONObject();
        	JSONObject jo2 = new JSONObject();
        	JSONObject jo3 = new JSONObject();

        	jo1.put("v", list1.get(i));
        	jo2.put("v", list1.get(i+1));
        	jo3.put("v", list1.get(i+2));

        	JSONArray arr3 = new JSONArray();
        	arr3.add(jo1);
        	arr3.add(jo2);
        	arr3.add(jo3);

        	JSONObject jo0 = new JSONObject();
        	jo0.put("c", arr3);
        	rows.add(jo0);
        }

        jsonData.put("rows", rows);
        System.out.println(jsonData);
        return jsonData;
	}


}
