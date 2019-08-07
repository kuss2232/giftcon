package share.conn.Review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Resource(name="reviewDAO")
	private ReviewDAO reviewDAO;

	//리뷰등록
	@Override
	public void insertReview(Map<String, Object> map) throws Exception {
		reviewDAO.insertReview(map);
	}

	//리뷰 등록
	@Override
	public List<Map<String, Object>> searchReview(Map<String, Object> map) throws Exception {
		return reviewDAO.searchReview(map);
	}

	//리뷰 리스트
	@Override
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {
		return reviewDAO.reviewList(map);
	}

	//리뷰 삭제
	@Override
	public void reviewDelete(Map<String, Object> map) throws Exception {
		reviewDAO.reviewDelete(map);
	}

}
