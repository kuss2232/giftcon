package share.conn.Join;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
public interface JoinService {

	// 회원정보를 DB에 등록(회원가입)
	void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	//회원가입 id중복체크
	int checkId(String mem_id) throws Exception;
	
	// 이메일인증시, ID중복체크
	int checkMember(Map<String, Object> map) throws Exception;



		
	
}