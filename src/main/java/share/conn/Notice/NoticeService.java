package share.conn.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	// 공지사항 목록
	public List<Map<String, Object>> notice(Map<String, Object> map) throws Exception;
	
	// 공지사항 상세보기
	public Map<String, Object> noticeDetail(Map<String, Object> map) throws Exception;
	
	// 공지사항 검색
	public List<Map<String, Object>> noticeSearch(Map<String, Object> map) throws Exception;

}
