package share.conn.adminFaq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service("AdminFaqService")
public class AdminFaqServiceImpl implements AdminFaqService {

	@Resource(name = "adminFaqDAO")
	private AdminFaqDAO adminfaqDAO;

	// 전체 리스트(Admin Page)
	@Override
	public List<Map<String, Object>> adminfaqList(Map<String, Object> map) throws Exception {
		return adminfaqDAO.adminfaqList(map);
	}

	// 상세보기
	@Override
	public Map<String, Object> faqDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> faqDetail = adminfaqDAO.faqDetail(map);
		return faqDetail;
	}
	
	// 글쓰기 
	@Override
	public void adminfaqWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminfaqDAO.adminfaqWrite(map, request); 
		
	}

	// 수정하기
	@Override
	public void faqModify(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminfaqDAO.faqModify(map);
	}

	// 삭제하기
	@Override
	public void faqDelete(Map<String, Object> map) throws Exception {
		Map<String, Object> faqDelete = new HashMap<String, Object>();
		faqDelete = adminfaqDAO.faqDetail(map);
		
		adminfaqDAO.faqDelete(map);
	}
	
	//카테고리 리스트
	@Override
	public List<Map<String, Object>> faqCategoryList(Map<String, Object> map) throws Exception {
		return adminfaqDAO.faqCategoryList(map);
	}
	
	// FAQ 검색
		@Override
		public List<Map<String, Object>> faqSearch(Map<String, Object> map) {
			return adminfaqDAO.faqSearch(map);
		}


}
