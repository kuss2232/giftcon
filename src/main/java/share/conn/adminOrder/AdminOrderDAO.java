package share.conn.adminOrder;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import share.conn.giftcon.AbstractDAO;

@Repository("adminOrderDAO")
public class AdminOrderDAO extends AbstractDAO{
	//
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> allOrderList() throws Exception{
		return selectList("adminOrderlist.allOrderList");
	}
	
	public int allOrderNumList() throws Exception{
		return (Integer) selectOne("adminOrderlist.allOrderNumList");
	}
	
	public void orderNumDelete(Map<String,Object> map) throws Exception{
		delete("adminOrderlist.orderNumDelete", map);
	}
	
	public void orderDelete(Map<String,Object> map) throws Exception{
		delete("adminOrderlist.orderDelete", map);
	}
	
	//사용자 아이디로 주문검색
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> adminOrderSearchID(Map<String, Object> map) throws Exception{
		return selectList("adminOrderlist.adminOrderSearchID", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> adminOrderSearchPay(Map<String,Object> map) throws Exception{
		return selectList("adminOrderlist.adminOrderSearchPay", map);
	}
	
	public void updateOrderPayment(Map<String,Object> map) throws Exception{
		update("adminOrderlist.updateOrderPayment", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> orderDetail(Map<String,Object> map) throws Exception{
		return selectList("adminOrderlist.orderDetail",map);
	}
	
	public Map<String,Object> adCheckCancel(Map<String,Object> map) throws Exception{
		return selectOne1("adminOrderCancel.adCheckCancel",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> adCancelList() throws Exception{
		return selectList("adminOrderCancel.adCancel");
	}
	
	public Map<String,Object> adCancelSearch(Map<String,Object> map) throws Exception{
		return selectOne1("adminOrderCancel.adCancelSearch", map);
	}
	
	public void adCancelDelete(Map<String,Object> map) throws Exception{
		delete("adminOrderCancel.adCancelDelete", map);
	}
	
	//상품수량 조절
	public void changeAmount(Map<String,Object> map) throws Exception{
		update("adminOrderlist.changeAmount", map);
	}
	
	//주문 취소시 상품수량 복구
	public void restoreAmount(Map<String,Object> map) throws Exception{
		update("adminOrderlist.restoreAmount", map);
	}
}
