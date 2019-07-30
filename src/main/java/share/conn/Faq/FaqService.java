package share.conn.Faq;

import java.util.List;
import java.util.Map;

public interface FaqService {
	
	//FAQ 리스트
	List<Map<String, Object>> faqList(Map<String, Object> map) throws Exception;
	
	// 글 제목 검색
	List<Map<String, Object>> searchList(Map<String, Object> map, String isSearch) throws Exception;
	
	//FAQ 카테고리별 리스트
	List<Map<String, Object>> faqCategoryList(Map<String, Object> map) throws Exception;


}
