package share.conn.Order;

import java.util.Map;

public interface OrderService {

	public Map<String, Object> memberInfo(Map<String, Object> map) throws Exception;

	public Map<String, Object> goodsInfo(Map<String, Object> map)throws Exception;

}
