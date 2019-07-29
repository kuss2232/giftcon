package share.conn.Review;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

@Repository("reviewDAO")
public class ReviewDAO extends AbstractDAO{

	public void insertReview(Map<String,Object> map) throws Exception{
		insert("review.insertReview", map);
	}
}
