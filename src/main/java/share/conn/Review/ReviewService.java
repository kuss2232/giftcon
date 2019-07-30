package share.conn.Review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	
	public void insertReview(Map<String,Object> map) throws Exception;
	
	public List<Map<String,Object>> searchReview(Map<String,Object> map) throws Exception;
	
	public List<Map<String,Object>> reviewList(Map<String,Object> map) throws Exception;

	public void reviewDelete(Map<String,Object> map) throws Exception;

}
