package share.conn.adminOrder;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AdminOrderService {
	public List<Map<String,Object>> allOrderList() throws Exception;
	
	//전체 주문 수 보기
	public int allOrderNumList() throws Exception;
	
	//주문 해당번호 전체삭제
	public void orderNumDelete(Map<String,Object> map) throws Exception;
	
	//주문 삭제
	public void orderDelete(Map<String,Object> map) throws Exception;
	
	//관리자가 사용자 ID로 검색
	public List<Map<String,Object>> adminOrderSearchID(Map<String,Object> map) throws Exception;
	
	//결제상태에 따른 검색
	public List<Map<String,Object>> adminOrderSearchPay(Map<String,Object> map) throws Exception;
	
	//결제 상태 변경
	public void updateOrderPayment(Map<String,Object> map) throws Exception;
	
	//회원 주문 상세보기
	public List<Map<String,Object>> orderDetail(Map<String,Object> map) throws Exception;
	
	//주문번호로 캔슬유무 확인
	public Map<String,Object> adCheckCancel(Map<String,Object> map) throws Exception;
	
	//주문 취소 목록 조회
	public List<Map<String,Object>> adCancelList() throws Exception;
	
	//주문번호로 주문 취소 목록 검색		//상품, 아이디 등 실험해볼것(select태그로 A.어쩌구 B.어쩌구가 적용되는가) 
	public Map<String,Object> adCancelSearch(Map<String,Object> map) throws Exception;
	
	//주문 취소 삭제
	public void adCancelDelete(Map<String, Object> map) throws Exception;
	
	//상품 수량 조절
	public void changeAmount(Map<String, Object> map) throws Exception;
	
}
