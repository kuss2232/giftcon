package share.conn.Cart;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

@Repository("cartDAO")
public class CartDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public Integer cartCheck(Map<String,Object> map) throws Exception{
		return (Integer)selectOne("cart.cartCheck", map);
	}
	
	public void addCart(Map<String,Object> map) throws Exception{
		insert("cart.addCart", map);
	}
	
	public List cartList(Map<String,Object> map) throws Exception{
		return selectList("cart.cartList", map);
	}
	
	public void cartAmountModify(Map<String,Object> map) throws Exception{
		update("cart.cartAmountModify", map);
	}
	
	public void cartDeleteAll(int member_num) throws Exception{
		delete("cart.cartDeleteAll", member_num);
	}
	
	public void cartDelete(Map<String,Object> map) throws Exception{
		delete("cart.cartDelete", map);
	}
	
	public Integer cartCount() throws Exception{
		return (Integer)selectOne("cart.cartCount");
	}
	
	public Object addOrderToCart() throws Exception{
		return insert("cart.addOrderToCart");
	}

}
