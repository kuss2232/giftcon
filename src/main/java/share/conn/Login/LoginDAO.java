package share.conn.Login;

import java.util.Map;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{
	
	//로그인 정보 불러오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String,Object> map)throws Exception{
		return (Map<String, Object>)selectOne("memberInfo.selectMember", map);
	}
	
	//아이디 찾기
	@SuppressWarnings("unchecked")
	public Map<String, Object> findId(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("memberInfo.findId", map);
	}
	
	//비밀번호 찾기
	@SuppressWarnings("unchecked")
	public Map<String, Object> findPwd(Map<String, Object> map)throws Exception{
		return (Map<String, Object>)selectOne("memberInfo.findPwd", map);
	}
	
	public void chgPw(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("memberInfo.chgPw", map);
	}
}
