package share.conn.Faq;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

@Repository("faqDAO")
public class FaqDAO extends AbstractDAO{
	
	//FAQ 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> faqList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.faqList", map);
	}
	
	//카테고리별 FAQ 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> faqCategoryList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.faqCategoryList", map);
	}
	
	//FAQ 조회수
	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("faq.faqHitcount", map);
	}
	
	//글 제목 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchTitleList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("faq.searchFaqTitle", map);
	}

}
