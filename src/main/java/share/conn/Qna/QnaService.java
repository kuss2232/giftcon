package share.conn.Qna;

import java.util.List;
import java.util.Map;

public interface QnaService {
	
	//QNA 작성
	void insertQna(Map<String, Object> map) throws Exception;
	
	//QNA 목록
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception;
	
	//QNA 상세보기
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception;
}
