package share.conn.Notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	
	
	@Resource(name="noticeDAO")
	private NoticeDAO noticeDAO;
	
	// 공지사항 목록
	@Override
	public List<Map<String, Object>> notice(Map<String, Object> map) throws Exception {
		return noticeDAO.noticeList(map);
	}

	// 공지사항 상세보기
	@Override
	public Map<String, Object> noticeDetail(Map<String, Object> map) throws Exception {
		noticeDAO.updateHitCount(map);
		Map<String, Object> noticeDetail = noticeDAO.noticeDetail(map);
		return noticeDetail;
	}
	
	// 내용으로 공지사항 검색
	@Override
	public List<Map<String, Object>> noticeSearch(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) noticeDAO.noticeSearch(map);
	}
	
}
