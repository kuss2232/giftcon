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
	public int goodsAmount(Map<String, Object> map) throws Exception{
		return orderDAO.goodsAmount(map);
	}
	
	@Override
	public Map<String, Object> goodsInfo(Map<String, Object> map)throws Exception{
		return orderDAO.goodsInfo(map);
	}
	
	@Override
	public void insertOrder(Map<String, Object> map) throws Exception{
		orderDAO.insertOrder(map);
	}
	
	
	public List<Map<String, Object>> cartOrderList(Map<String, Object> map) throws Exception{
		return orderDAO.cartOrderList(map);
	}
	
	public List<Map<String, Object>> orderList(Map<String, Object> map)throws Exception{
		return orderDAO.orderList();
	}

	@Override
	public List<Map<String, Object>> findmemberOrderList(Map<String, Object> map) throws Exception {
		return orderDAO.findmemberOrderList(map);
	}

	@Override
	public List<Map<String, Object>> orderMailSub(Map<String, Object> map) throws Exception {
		return orderDAO.orderMailSub(map);
	}
	
	@Override
	public int lastOrderNum() throws Exception{
		return orderDAO.lastOrderNum();
	}
	
	
}
