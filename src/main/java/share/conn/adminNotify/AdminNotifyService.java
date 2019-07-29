package share.conn.adminNotify;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminNotifyService {
	
	// 공지사항 목록
		public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception;
		
		// 공지사항 상세보기
		public Map<String, Object> notifyDetail(Map<String, Object> map) throws Exception;
		
		// 공지사항 등록
		public void insertNotice(Map<String, Object> map, HttpServletRequest request) throws Exception;
				
		// 공지사항 수정
		public void notifyModify(Map<String, Object> map, HttpServletRequest request) throws Exception;
		
		// 공지사항 삭제
		public void notifyDelete(Map<String, Object> map) throws Exception;
		
		//  공지사항 검색
		public List<Map<String, Object>> notifySearch(Map<String, Object> map) throws Exception;
		
		// 공지사항 조회수 증가
		public void updateHitCount(Map<String, Object> map) throws Exception;
		
		
	}


