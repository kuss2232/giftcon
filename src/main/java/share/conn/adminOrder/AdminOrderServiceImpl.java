package share.conn.adminOrder;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService{

	@Resource(name="adminOrderDAO")
	AdminOrderDAO adminOrderDAO;
	
	@Override
	public List<Map<String, Object>> allOrderList() throws Exception {
		return adminOrderDAO.allOrderList();
	}

	@Override
	public int allOrderNumList() throws Exception {
		return adminOrderDAO.allOrderNumList();
	}

	@Override
	public void orderDelete(Map<String, Object> map) throws Exception {
		adminOrderDAO.orderDelete(map);
	}

	@Override
	public List<Map<String, Object>> adminOrderSearchID(Map<String, Object> map) throws Exception {
		return adminOrderDAO.adminOrderSearchID(map);
	}

	@Override
	public List<Map<String, Object>> adminOrderSearchPay(Map<String, Object> map) throws Exception {
		return adminOrderDAO.adminOrderSearchPay(map);
	}

	@Override
	public void updateOrderPayment(Map<String, Object> map) throws Exception {
		adminOrderDAO.updateOrderPayment(map);
	}

	@Override
	public List<Map<String, Object>> orderDetail(Map<String, Object> map) throws Exception {
		return adminOrderDAO.orderDetail(map);
	}

	@Override
	public Map<String, Object> adCheckCancel(Map<String, Object> map) throws Exception {
		return adminOrderDAO.adCheckCancel(map);
	}

	@Override
	public List<Map<String, Object>> adCancelList() throws Exception {
		return adminOrderDAO.adCancelList();
	}

	@Override
	public Map<String, Object> adCancelSearch(Map<String, Object> map) throws Exception {
		return adminOrderDAO.adCancelSearch(map);
	}

	@Override
	public void adCancelDelete(Map<String, Object> map) throws Exception {
		adminOrderDAO.adCancelDelete(map);
	}

}
