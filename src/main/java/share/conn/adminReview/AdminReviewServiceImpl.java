package share.conn.adminReview;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminReviewService")
public class AdminReviewServiceImpl implements AdminReviewService{

	@Resource(name="adminReviewDAO")
	private AdminReviewDAO adminReviewDAO;
	
	@Override
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminReviewDAO.reviewList(map);
	}
	
	@Override
	public void reviewDelete(Map<String, Object> map) throws Exception{
		adminReviewDAO.reviewDelete(map);
	}
	
	@Override
	public Map<String, Object> reviewCount(Map<String, Object> map) throws Exception{
		return adminReviewDAO.reviewCount(map);
	}
	
	@Override
	public List<Map<String, Object>> searchReviewList(Map<String, Object> map) throws Exception{
		return adminReviewDAO.searchReviewList(map);
	}
}
