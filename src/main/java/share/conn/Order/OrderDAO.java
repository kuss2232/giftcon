package share.conn.Order;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> memberInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>)selectOne("memberInfo.selectMember", map);
	}
	
	public Map<String, Object> goodsAmount(Map<String, Object> map){
		return selectOne1("memberGoods.goodsAmountCheck", map);
	}
	
	public Map<String, Object> goodsInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return selectOne1("memberGoods.goodsInfo", map);
	}

	public Object insertOrder(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return insert("memberGoods.createOrder", map);
	}

	public List<Map<String, Object>> cartOrderList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return selectList("cart.cartList", map);
	}


	public List<Map<String, Object>> orderList() {
		// TODO Auto-generated method stub
		return selectList("adminOrderlist.allOrderList");
	}
	
	public List<Map<String, Object>> findmemberOrderList(Map<String,Object> map){
		return selectList("memberInfo.findmemberOrderList", map);
	}
	
	public List<Map<String, Object>> orderMailSub(Map<String, Object> map){
		return selectList("adminOrderlist.orderMailSub", map);
	}
	
	public int lastOrderNum() {
		return Integer.parseInt(selectOne("memberGoods.lastOrderNum").toString());
	}

}
