package share.conn.Mypage;

import java.util.Map;

public interface MypageService {

	Map<String, Object> userCheckPw(Map<String, Object> map) throws Exception;

	Map<String, Object> userDetail(Map<String, Object> map) throws Exception;

	void userInfoUpdate(Map<String, Object> map) throws Exception;

	void userPwUpdate(Map<String, Object> map) throws Exception;
	
	void userSecession(Map<String, Object> map) throws Exception;
}
