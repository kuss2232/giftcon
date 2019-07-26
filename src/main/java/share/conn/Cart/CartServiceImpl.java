package share.conn.Cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("CartService")
public class CartServiceImpl implements CartService{

	@Resource(name="CartDAO")
	private CartDAO cartDAO;
	
	@Override
	public int cartCheck(Map<String, Object> map) throws Exception {
		return cartDAO.cartCheck(map);
	}

	@Override
	public void addCart(Map<String, Object> map) throws Exception {
		cartDAO.addCart(map);
	}

	@Override
	public List<Map<String, Object>> cartList(Map<String, Object> map) throws Exception {
		return cartDAO.cartList(map);
	}

	@Override
	public void cartAmountModify(Map<String, Object> map) throws Exception {
		cartDAO.cartAmountModify(map);
	}

	@Override
	public void cartDeleteAll(int member_num) throws Exception {
		cartDAO.cartDeleteAll(member_num);
	}

	@Override
	public void cartDelete(Map<String, Object> map) throws Exception {
		cartDAO.cartDelete(map);
	}

	@Override
	public int cartCount() throws Exception {
		return cartDAO.cartCount();
	}

	@Override
	public void addOrderToCart() throws Exception {
		cartDAO.addOrderToCart();
	}

}
