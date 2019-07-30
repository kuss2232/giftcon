package share.conn.Join;

import java.util.Map;
import org.springframework.stereotype.Repository;
import share.conn.giftcon.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO  extends AbstractDAO{
	
	//회원가입
		public void insertMember(Map<String, Object> map) throws Exception{
			insert("memberInfo.joinMember", map);
		}
		
		//아이디중복체크
		public int checkId(String mem_id) throws Exception{
			return (Integer)selectOne("memberInfo.memberCheck", mem_id);
		}
		
		public int checkMember(Map<String, Object> map) throws Exception{
			return selectMemberId("memberInfo.checkMember", map);
		}
	

}