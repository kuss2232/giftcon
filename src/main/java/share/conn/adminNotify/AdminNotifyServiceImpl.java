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
	

		// 공지사항 목록
		@Override
		public List<Map<String, Object>> notifyList(Map<String, Object> map) throws Exception {
			return AdminNotifyDAO.notifyList(map);
		}
		
		// 공지사항 상세보기
		@Override
		public Map<String, Object> notifyDetail(Map<String, Object> map) throws Exception {
			adminNotifyDAO.updateHitCnt(map);
			Map<String, Object> notifyDetail = adminNotifyDAO.notifyDetail(map);
			return notifyDetail;
		}
		
		// 공지사항 수정
		@Override
		public void notifyModify(Map<String, Object> map, HttpServletRequest request) throws Exception {
			adminNotifyDAO.notifyModify(map);
			
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
			
			if(multipartHttpServletRequest.getFile("NOTIFY_IMAGE").getSize() > 0) {
				map = goodsImageUtils.notifyModifyImage(map, request);
				adminNotifyDAO.insertNotifyImage(map);
			}
		}
		
		// 공지사항 삭제
		@Override
		public void notifyDelete(Map<String, Object> map) throws Exception {
			Map<String, Object> image = new HashMap<String, Object>();
			image = adminNotifyDAO.notifyDetail(map);
			goodsImageUtils.notifyImageDelete(image);
			
			adminNotifyDAO.notifyDelete(map);
		}
		
		// 공지사항 등록
		@Override
		public void notifyWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
			adminNotifyDAO.notifyWrite(map, request);
			
			List<Map<String, Object>> notifyImage = goodsImageUtils.notifyImage(map, request);
		   
			if(notifyImage.size() > 0) {
				for(int i = 0; i < notifyImage.size(); i++) {
					adminNotifyDAO.insertNotifyImage(notifyImage.get(i));
				}
			}
		}
		
		// 제목으로 공지사항 검색
		@Override
		public List<Map<String, Object>> notifyTitleSearch(Map<String, Object> map) throws Exception {
			return (List<Map<String, Object>>) adminNotifyDAO.notifyTitleSearch(map);
		}
		
		// 내용으로 공지사항 검색
		@Override
		public List<Map<String, Object>> notifyContentSearch(Map<String, Object> map) throws Exception {
			return (List<Map<String, Object>>) adminNotifyDAO.notifyContentSearch(map);
		}
		
		// 조회수 증가
		@Override
		public void updateHitCount(Map<String, Object> map) throws Exception {
			adminNotifyDAO.updateHitCnt(map);
		}
 
 