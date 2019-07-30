package share.conn.Login;

import java.util.Map;

public interface LoginService {

	Map<String, Object> loginGo(Map<String, Object> map) throws Exception;

	Map<String, Object> findId(Map<String, Object> map) throws Exception;

	Map<String, Object> findPwd(Map<String, Object> map) throws Exception;

	void chgPw(Map<String, Object> map) throws Exception;
	
	
}
