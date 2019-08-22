package share.conn.Cart;

import java.util.List;
import java.util.Map;


public interface CartService {
	
	public int cartCheck(Map<String, Object> map) throws Exception;
	
	public void cartCheckAmountModify(Map<String,Object> map) throws Exception;
	
	public void addCart(Map<String, Object> map) throws Exception;
	
	public List<Map<String,Object>> cartList(Map<String, Object> map) throws Exception;
	
	public void cartAmountModify(Map<String,Object> map) throws Exception;
	
	public void cartDeleteAll(Map<String, Object> map) throws Exception;
	
	public void cartDelete(Map<String, Object> map) throws Exception;
	
	public int cartCount() throws Exception;
	
	public void addOrderToCart(Map<String, Object> map) throws Exception;
}
