package share.conn.adminFaq;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

@Repository("adminFaqDAO")
public class AdminFaqDAO  extends AbstractDAO {

	//전체 리스트(Admin Page)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminfaqList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.faqList", map);
	}
	
	//FAQ 등록
	public void adminfaqWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		insert("faq.faqWrite", map);
	}
	
	//FAQ 조회수
	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("faq.faqHitcount", map);
	}
	
	//FAQ 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> faqDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("faq.faqDetail", map);
	}
	
	//FAQ 수정
	public void faqModify(Map<String, Object> map) throws Exception {
		update("faq.faqModify", map);
	}
	
	//FAQ 삭제
	public void faqDelete(Map<String, Object> map) throws Exception {
		delete("faq.faqDelete", map);
	}
	
	//FAQ 검색
	@SuppressWarnings("unchecked")
	public  List<Map<String, Object>> faqSearch(Map<String, Object> map) {
		return (List<Map<String, Object>>) searchList("faq.searchFaq", map);
	}
	
	//카테고리별 FAQ 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> faqCategoryList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.faqCategoryList", map);
	}

}