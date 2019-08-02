package share.conn.adminFaq;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminFaqService {

	// FAQ 리스트(Admin Page)
	List<Map<String, Object>> adminfaqList(Map<String, Object> map) throws Exception;

	// FAQ 등록
	void adminfaqWrite(Map<String, Object> map, HttpServletRequest request) throws Exception;

	// FAQ 상세보기
	Map<String, Object> faqDetail(Map<String, Object> map) throws Exception;

	// FAQ 수정
	void faqModify(Map<String, Object> map, HttpServletRequest request) throws Exception;

	// FAQ 삭제
	void faqDelete(Map<String, Object> map) throws Exception;
	
	//FAQ 카테고리별 리스트
	List<Map<String, Object>> faqCategoryList(Map<String, Object> map) throws Exception;
	
	//FAQ 검색
	List<Map<String, Object>> faqSearch(Map<String, Object> map) throws Exception;

	}


