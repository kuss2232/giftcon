package share.conn.adminEvent;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import share.conn.giftcon.GoodsImageUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service("AdminEventService")
public class AdminEventServiceImpl implements AdminEventService {

	@Resource(name = "adminEventDAO")
	private AdminEventDAO adminEventDAO;

	@Resource(name = "goodsImageUtils")
	private GoodsImageUtils goodsImageUtils;

	// 이벤트 리스트(진행 중)
	@Override
	public List<Map<String, Object>> eventList(Map<String, Object> map) throws Exception {
		return adminEventDAO.eventList(map);
	}

	// 이벤트 리스트(종료)
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

		List<Map<String, Object>> list = goodsImageUtils.InsertEventImage(map, request);
		/*
		 * MultipartHttpServletRequest multipartHttpServletRequest =
		 * (MultipartHttpServletRequest)request; Iterator<String> iterator =
		 * multipartHttpServletRequest.getFileNames(); MultipartFile multipartFile =
		 * null; while(iterator.hasNext()){ multipartFile =
		 * multipartHttpServletRequest.getFile(iterator.next()); }
		 */
		
		for(int i=0,  size=list.size();  i<size;  i++) {
			/*
			 * System.out.println(" CommandMap값 확인  +++++++++++" +
			 * (list.get(i)).get("EVENT_TITLE"));
			 * System.out.println(" CommandMap값 확인  +++++++++++" +
			 * (list.get(i)).get("EVENT_START"));
			 * System.out.println(" CommandMap값 확인  +++++++++++" +
			 * (list.get(i)).get("EVENT_END"));
			 */
			adminEventDAO.eventInsert((Map<String, Object>)list.get(i));
		}
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

	// 파일첨부1
	@Override
	public void eventImage(Map<String, Object> map) throws Exception {
		adminEventDAO.eventImage(map);
	}

}
