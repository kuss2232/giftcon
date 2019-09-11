package share.conn.Order;

import java.util.List;
import java.util.Map;

public interface OrderService {
	//멤버정보
	public Map<String, Object> memberInfo(Map<String, Object> map) throws Exception;
	//상품수량
	public int goodsAmount(Map<String, Object> map) throws Exception;
	//상품정보
	public Map<String, Object> goodsInfo(Map<String, Object> map)throws Exception;
	//주문추가
	public void insertOrder(Map<String, Object> map) throws Exception;
	//장바구니 리스트
	public List<Map<String, Object>> cartOrderList(Map<String, Object> map) throws Exception;
	//주문 리스트
	public List<Map<String, Object>> orderList(Map<String, Object> map)throws Exception;
	
	public List<Map<String, Object>> findmemberOrderList(Map<String, Object> map) throws Exception;
	
	
	public List<Map<String,Object>> orderMailSub(Map<String, Object> map) throws Exception;
	
	public int lastOrderNum() throws Exception;
}
