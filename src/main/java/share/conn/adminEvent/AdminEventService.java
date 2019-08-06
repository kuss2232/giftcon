package share.conn.adminEvent;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminEventService {
	
	//EVENT 리스트(진행 중)
	List<Map<String, Object>> eventList(Map<String, Object> map) throws Exception;
		
	//EVENT 리스트(종료)
	List<Map<String, Object>> endEventList(Map<String, Object> map) throws Exception;
	
	// EVENT 등록
	void eventInsert(Map<String, Object> map, HttpServletRequest request) throws Exception;

	// EVENT 상세보기
	Map<String, Object> eventDetail(Map<String, Object> map) throws Exception;

	// EVENT 수정
	void eventModify(Map<String, Object> map, HttpServletRequest request) throws Exception;

	// EVENT 삭제
	void eventDelete(Map<String, Object> map) throws Exception;
	
	// 파일첨부1
	public void eventImage(Map<String, Object> map) throws Exception; 
	
	
	}

