package share.conn.Main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("mainService")
public class MainServiceImpl implements MainService{
	
	@Resource(name="mainDAO")
	private MainDAO mainDAO;

	@Override
	public List<Map<String, Object>> GoodsBestList() throws Exception{
		// TODO Auto-generated method stub
		return mainDAO.GoodsBestList(); 
	}//베스트 상품

	@Override
	public List<Map<String, Object>> GoodsSaleList1() throws Exception{
		// TODO Auto-generated method stub
		return mainDAO.GoodsSaleList1();
	}//할인상품 (높은 가격순)
	
}
