package share.conn.Main;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> GoodsBestList() {
		// TODO Auto-generated method stub
		return selectList("memberGoods.goodsBestList");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> GoodsSaleList1() {
		// TODO Auto-generated method stub
		return selectList("memberGoods.goodsSaleList1");
	}
	
	public List<Map<String, Object>> eventList() {
		// TODO Auto-generated method stub
		return selectList("event.adEventList");
	}

	public List<Map<String, Object>> endEventList() {
		// TODO Auto-generated method stub
		return selectList("event.adEndEventList");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> eventDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>)selectOne("event.adEventDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsbudget(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("memberGoods.goodsBudget", map);
	}
}
