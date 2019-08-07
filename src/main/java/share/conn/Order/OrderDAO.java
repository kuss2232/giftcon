package share.conn.Order;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> memberInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>)selectOne("memberInfo.selectMember", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> goodsInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>)selectOne("memberGoods.goodsInfo", map);
	}

}
