package share.conn.Order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	
	@Resource(name="orderDAO")
	private OrderDAO orderDAO;

	@Override
	public Map<String, Object> memberInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return orderDAO.memberInfo(map);
	}
	
	@Override
	public Map<String, Object> goodsInfo(Map<String, Object> map)throws Exception{
		return orderDAO.goodsInfo(map);
	}
	
	@Override
	public void inserOrder(Map<String, Object> map) throws Exception{
		orderDAO.insertOrder(map);
	}
	
	
	public List<Map<String, Object>> cartOrderList(Map<String, Object> map) throws Exception{
		return orderDAO.cartOrderList(map);
	}
}
