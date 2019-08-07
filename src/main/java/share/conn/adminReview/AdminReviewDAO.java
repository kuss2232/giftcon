package share.conn.adminReview;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

@Repository("adminReviewDAO")
public class AdminReviewDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return selectList("adminReview.selectReviewList", map);
	}

	public void reviewDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("adminReview.deleteReview", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> reviewCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>)selectOne("adminReview.reviewCount", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchReviewList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		System.out.println("들어오는지 확인222:::::"+map.get("SearchKeyword"));
		System.out.println("서치넘 확인222:::::::::::"+ map.get("searchNum"));
		return selectList("adminReview.selectSearchList", map);
	}

}
