package share.conn.Notice;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO{
	
	
	// 공지사항 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("notice.selectList", map); 
	}
	
	// 공지사항 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> noticeDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("notice.selectDetail", map);
	}
	
	// 조회수 증가
	public void updateHitCount(Map<String, Object> map) throws Exception {
		update("notice.updateHitcount", map);
	}
	
	// 공지사항 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> noticeSearch(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("notice.searchList", map);
	}
		
}
