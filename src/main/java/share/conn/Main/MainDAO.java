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

}
