package share.conn.Qna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("qnaService")
public class QnaServiceImpl implements QnaService{
	
	@Resource(name = "qnaDAO")
	private QnaDAO qnaDAO;

	//QNA 작성
	@Override
	public void insertQna(Map<String, Object> map) throws Exception {
		qnaDAO.insertQna(map);
	}
	//QNA 목록
	@Override
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {
		return qnaDAO.qnaList(map);
	}
	//QNA 상세보기
	@Override
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> qnaDetail = qnaDAO.qnaDetail(map);
		return qnaDetail;
	}

}
