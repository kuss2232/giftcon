package share.conn.adminQna;
import java.util.List;
import java.util.Map;
public interface AdminQnaService {
	
	//Q&A목록
	public List<Map<String, Object>> qnaList(Map<String,Object> map) throws Exception;
	
	// Q&A 상세보기
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception;
	
	//Q&A 댓글달기
	public void writeComment(Map<String, Object> map)throws Exception;
	
	//Q&A댓글수정
	public void updateReply(Map<String, Object> map) throws Exception;
	
	//Q&A 댓글삭제
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	//Q&A제목검색
	public List<Map<String, Object>> qnaTitleSearch(Map<String,Object> map) throws Exception;
	
	//사용자ID로 Q&A제목검색
	public List<Map<String, Object>> qnaIdSearch(Map<String,Object> map) throws Exception;

}
