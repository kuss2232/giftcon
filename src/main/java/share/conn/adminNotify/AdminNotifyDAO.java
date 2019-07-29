package share.conn.adminNotify;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

@Repository("adminNotifyDAO")
public class AdminNotifyDAO extends AbstractDAO{
	
	// 공지사항 목록
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception {
			return (List<Map<String, Object>>) selectList("adminnotice.noticeList", map);
		}
		
		// 공지사항 상세보기
		@SuppressWarnings("unchecked")
		public Map<String, Object> notifyDetail(Map<String, Object> map) throws Exception {
			return (Map<String, Object>) selectOne("adminnotice.noticeDetail", map);
		}
		
		// 조회수 증가
		public void updateHitCount(Map<String, Object> map) throws Exception {
			update("adminnotice.updateHitcount", map);
		}
		
		// 공지사항 수정
		public void notifyModify(Map<String, Object> map) throws Exception {
			update("adminnotice.updateNotice", map);
		}
		
		// 공지사항 삭제
		public void notifyDelete(Map<String, Object> map) throws Exception {
			delete("adminnotice.deleteNotice", map);
		}
		
		// 공지사항 등록
		public void insertNotice(Map<String, Object> map, HttpServletRequest request) throws Exception {
			insert("adminnotice.insertNotice", map);
		}
		
		//  공지사항 검색 (제목과 내용으로 검색 포함)
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> notifySearch(Map<String, Object> map) throws Exception {
			return (List<Map<String, Object>>) selectList("adminnotice.searchNotice", map);
		}
	}
	
	


