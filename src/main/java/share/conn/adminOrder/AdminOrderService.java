package share.conn.adminOrder;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminOrderService {
	public List<Map<String,Object>> allOrderList() throws Exception;
	
	//전체 주문 수 보기
	public int allOrderNumList() throws Exception;
	
	//주문 삭제
	public void orderDelete(Map<String, Object> map) throws Exception;
	
	//관리자가 사용자 ID로 검색
	public List<Map<String,Object>> adminOrderSearchID(Map<String,Object> map) throws Exception;
}
