package share.conn.adminQna;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("adminQnaService")
public class AdminQnaServiceImpl implements AdminQnaService {
	
	@Resource(name = "adminQnaDAO")
	private AdminQnaDAO adminQnaDAO;
	
	//Q&A 목록
	@Override
	public List<Map<String,Object>> qnaList(Map<String, Object> map)throws Exception{
		return adminQnaDAO.qnaList(map);
	}
	
	// Q&A 상세보기
	@Override
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception {
		return adminQnaDAO.qnaDetail(map);
	}
	
	//Q&A 댓글달기
	@Override
	public void writeComment(Map<String, Object> map) throws Exception{
		 adminQnaDAO.writeComment(map);
	}
	
	//Q&A 댓글수정
	@Override
	public void updateReply(Map<String, Object> map) throws Exception {
		adminQnaDAO.updateReply(map);
		
	}
	//Q&A 댓글삭제
	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		adminQnaDAO.deleteReply(map);
		
	}
	//Q&A 제목으로검색
	@Override
	public List<Map<String, Object>> qnaTitleSearch(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminQnaDAO.qnaTitleSearch(map);
	}
	//Q&A 아이디로 검색
	@Override
	public List<Map<String, Object>> qnaIdSearch(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminQnaDAO.qnaIdSearch(map);
	}

}
