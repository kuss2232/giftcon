package share.conn.Review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Resource(name="reviewDAO")
	private ReviewDAO reviewDAO;

	@Override
	public void insertReview(Map<String, Object> map) throws Exception {
		reviewDAO.insertReview(map);
	}

	@Override
	public List<Map<String, Object>> searchReview(Map<String, Object> map) throws Exception {
		return reviewDAO.searchReview(map);
	}

	@Override
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {
		return reviewDAO.reviewList(map);
	}

	@Override
	public void reviewDelete(Map<String, Object> map) throws Exception {
		reviewDAO.reviewDelete(map);
	}

}
