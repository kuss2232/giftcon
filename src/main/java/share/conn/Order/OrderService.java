package share.conn.Order;

import java.util.List;
import java.util.Map;

public interface OrderService {

	public Map<String, Object> memberInfo(Map<String, Object> map) throws Exception;

	public int goodsAmount(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> goodsInfo(Map<String, Object> map)throws Exception;

	public void insertOrder(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> cartOrderList(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> orderList(Map<String, Object> map)throws Exception;
	
	public List<Map<String, Object>> findmemberOrderList(Map<String, Object> map) throws Exception;
	
	
	public List<Map<String,Object>> orderMailSub(Map<String, Object> map) throws Exception;
}
