package share.conn.adminNotify;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

 @Service("adminNotifyService")
public class AdminNotifyServiceImpl implements AdminNotifyService {
	 	
	 	@Resource(name = "AdminNotifyDAO")
	 	private AdminNotifyDAO adminNotifyDao;

		// 공지사항 목록
		@Override
		public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception {
			return adminNotifyDao.noticeList(map);
		}
		
		// 공지사항 상세보기
		@Override
		public Map<String, Object> notifyDetail(Map<String, Object> map) throws Exception {
			adminNotifyDao.updateHitCount(map);
			Map<String, Object> notifyDetail = adminNotifyDao.notifyDetail(map);
			return notifyDetail;
		}
		
		// 공지사항 수정
		@Override
		public void notifyModify(Map<String, Object> map, HttpServletRequest request) throws Exception {
			adminNotifyDao.notifyModify(map);
			
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
					
		}
		
		// 공지사항 삭제
		@Override
		public void notifyDelete(Map<String, Object> map) throws Exception {
			Map<String, Object> noticeDelete = new HashMap<String, Object>();
			noticeDelete = adminNotifyDao.notifyDetail(map);
			
			adminNotifyDao.notifyDelete(map);
		}
		
		// 공지사항 등록
		@Override
		public void insertNotice(Map<String, Object> map, HttpServletRequest request) throws Exception {
			adminNotifyDao.insertNotice(map, request);
			
		}
		
		//  공지사항 검색(제목, 내용)
		@Override
		public List<Map<String, Object>> notifySearch(Map<String, Object> map) throws Exception {
			return (List<Map<String, Object>>) adminNotifyDao.notifySearch(map);
		}
		
		// 조회수 증가
		@Override
		public void updateHitCount(Map<String, Object> map) throws Exception {
			adminNotifyDao.updateHitCount(map);
		}
 }
 