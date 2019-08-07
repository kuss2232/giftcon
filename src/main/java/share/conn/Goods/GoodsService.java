package share.conn.Goods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface GoodsService {
	
	public List<Map<String, Object>> goodsList() throws Exception;
	int goodsCount() throws Exception;
	public List<Map<String, Object>> searchGoods() throws Exception;
	public List<Map<String, Object>> smallCategoryList() throws Exception;
	public List<Map<String, Object>> bigCategorygoodsList() throws Exception;
	public List<Map<String, Object>> smallCategorygoodsList(String[] category) throws Exception;
	public List<Map<String, Object>> categoryGoodsBest() throws Exception;
	public List<Map<String, Object>> categoryGoodsGrade() throws Exception;
	public List<Map<String, Object>> goodsBestList() throws Exception;
	public List<Map<String, Object>> goodsSaleList1() throws Exception;
	public List<Map<String, Object>> goodsSaleList2() throws Exception;
	public Map<String, Object> goodsDetail(Map<String, Object> map) throws Exception;
}
