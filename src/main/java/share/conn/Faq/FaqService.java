package share.conn.Faq;

import java.util.List;
import java.util.Map;

public interface FaqService {
	
	//FAQ 리스트
	public List<Map<String, Object>> faqList(Map<String, Object> map) throws Exception;
	
	// 글 제목 내용 동시 검색
	public List<Map<String, Object>> searchList(Map<String, Object> map) throws Exception;
	
	//FAQ 카테고리별 리스트
	public List<Map<String, Object>> faqCategoryList(String category) throws Exception;


}
