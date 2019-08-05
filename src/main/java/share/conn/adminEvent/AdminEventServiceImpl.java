package share.conn.adminEvent;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service("AdminEventService")
public class AdminEventServiceImpl implements AdminEventService{
	
	@Resource(name = "adminEventDAO")
	private AdminEventDAO adminEventDAO;
	
	//이벤트 리스트(진행 중)
	@Override
	public List<Map<String, Object>> nowEventList(Map<String, Object> map) throws Exception {
		return adminEventDAO.nowEventList(map);
	}
	
	//이벤트 리스트(종료) 
	@Override
	public List<Map<String, Object>> endEventList(Map<String, Object> map) throws Exception {
		return adminEventDAO.endEventList(map);
	}

		// 상세보기
		@Override
		public Map<String, Object> eventDetail(Map<String, Object> map) throws Exception {
			
			Map<String, Object> eventDetail = adminEventDAO.eventDetail(map);
			return eventDetail;
		}
		
		// 글쓰기 
		@Override
		public void eventInsert(Map<String, Object> map, HttpServletRequest request) throws Exception {
			adminEventDAO.eventInsert(map, request);  
			
		} 

		// 수정하기
		@Override
		public void eventModify(Map<String, Object> map, HttpServletRequest request) throws Exception {
			adminEventDAO.eventModify(map);
		}

		// 삭제하기
		@Override
		public void eventDelete(Map<String, Object> map) throws Exception {
			Map<String, Object> eventDelete = new HashMap<String, Object>();
			eventDelete = adminEventDAO.eventDetail(map);
			
			adminEventDAO.eventDelete(map);
		}
		
	

	}

