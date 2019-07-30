package share.conn.adminQna;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import share.conn.giftcon.AbstractDAO;

@Repository("adminQnaDAO")
public class AdminQnaDAO extends AbstractDAO{
	
	//Q&A목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("adminQna.qnaList",map);
	}
	
	// Q&A 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("adminQna.qnaDetail", map);
	}
	
	//Q&A 댓글달기
	public void writeComment(Map<String, Object> map) throws Exception{
		update("adminQna.updateQnaComment",map);
	}
	
	//Q&A댓글수정
	public void updateReply(Map<String, Object> map) throws Exception{
		update("adminQna.updateQnaCommand",map);
	}
	
	//Q&A 댓글삭제
	public void deleteReply(Map<String, Object> map) throws Exception{
		update("adminQna.deleteQnaCommand",map);
	}
	
	//Q&A제목검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaTitleSearch(Map<String,Object> map) throws Exception{
		return (List<Map<String,Object>>) selectList("adminQna.searchQnaTitleList",map);
	}
	
	//사용자ID로 Q&A제목검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaIdSearch(Map<String,Object> map) throws Exception{
		return (List<Map<String,Object>>) selectList("adminQna.searchQnaMemberList",map);
	}
}
