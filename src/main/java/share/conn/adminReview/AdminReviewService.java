package share.conn.adminReview;

import java.util.List;
import java.util.Map;

public interface AdminReviewService {

	List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception;

	void reviewDelete(Map<String, Object> map) throws Exception;

	Map<String, Object> reviewCount(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> searchReviewList(Map<String, Object> map) throws Exception;

}
