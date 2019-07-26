package share.conn.Cart;

import java.util.List;
import java.util.Map;


public interface CartService {
	
	public int cartCheck(Map<String, Object> map) throws Exception;
	
	public void addCart(Map<String, Object> map) throws Exception;
	
	public List<Map<String,Object>> cartList(Map<String, Object> map) throws Exception;
	
	public void cartAmountModify(Map<String,Object> map) throws Exception;
	
	public void cartDeleteAll(int member_num) throws Exception;
	
	public void cartDelete(Map<String, Object> map) throws Exception;
	
	public int cartCount() throws Exception;
	
	public void addOrderToCart() throws Exception;
}
