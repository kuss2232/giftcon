package share.conn.Qna;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;


@Repository("qnaDAO")
public class QnaDAO extends AbstractDAO{
	
	//QNA 등록하기
	public void insertQna(Map<String, Object> map) throws Exception {	
		insert("memberInfo.insertQna", map);
	}
	//QNA 목록 보기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("memberInfo.findQnaList", map); 
	}
	
	// QNA 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("memberInfo.qnaDetail", map);
	}
}
