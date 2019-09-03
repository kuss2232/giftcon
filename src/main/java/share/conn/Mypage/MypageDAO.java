package share.conn.Mypage;

import java.util.Map;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

@Repository("mypageDAO")
public class MypageDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> userCheckPw(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>)selectOne("memberInfo.userPwCheck",map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> userDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>)selectOne("memberInfo.selectMember", map);
	}

	public void userInfoUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("memberInfo.userInfoUpdate", map);
	}

	public void userPwUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("memberInfo.chgPw2", map);
	}

	public void userSecession(Map<String, Object> map) {
		update("memberInfo.deleteMember", map);
	}

}
