package share.conn.adminEvent;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

	@Repository("adminEventDAO")
	public class AdminEventDAO  extends AbstractDAO {

		//이벤트 리스트(진행중)
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> eventList(Map<String, Object> map) throws Exception {
			return (List<Map<String, Object>>) selectList("event.adEventList", map);
		}

		//이벤트 리스트(종료)
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> endEventList(Map<String, Object> map) throws Exception {
			return (List<Map<String, Object>>) selectList("event.adEndEventList", map);
				}
		
		//EVENT 등록
		public void eventInsert(Map<String, Object> map, HttpServletRequest request) throws Exception {
			insert("event.adEventinsert", map);
		}
		
		//EVENT 상세보기
		@SuppressWarnings("unchecked")
		public Map<String, Object> eventDetail(Map<String, Object> map) throws Exception {
			return (Map<String, Object>) selectOne("event.adEventDetail", map);
		}
		
		//EVENT 수정
		public void eventModify(Map<String, Object> map) throws Exception {
			update("event.adEventupdate", map);
		}
		
		//EVENT 삭제
		public void eventDelete(Map<String, Object> map) throws Exception {
			delete("event.adEventdelete", map);
		}
		
		// 이벤트 파일첨부
		public void eventImage(Map<String, Object> map) throws Exception {
			update("event.eventImage", map);
		}
		
		//이벤트 이미지 등록
		public void insertEventImage(Map<String, Object> map) throws Exception {
		   update("event.insertEventImage", map);
		}
		
		//파일리스트 삭제
		public void deleteEventFile(Map<String, Object> map) throws Exception {
			update("event.deleteEventFileList", map);
		}
		
		}
