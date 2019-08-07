package share.conn.Goods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	
	@Resource(name="goodsDAO")
	private GoodsDAO goodsDAO;
	
	//전체 상품 리스트
	@Override
	public List<Map<String, Object>> goodsList() throws Exception {
		return goodsDAO.goodsList();
	}
	
	//전체 상품 수
	@Override
	public int goodsCount() throws Exception {
		return goodsDAO.goodsCount();
	}
	
	//상품 이름이나 브랜드로 검색
	@Override
	public List<Map<String, Object>> searchGoods() throws Exception {
		return goodsDAO.searchGoods();
	}
	
	//브랜드 리스트
	@Override
	public List<Map<String, Object>> smallCategoryList() throws Exception {
		return goodsDAO.smallCategoryList();
	}
		
	//큰 카테고리 별 상품 리스트
	@Override
	public List<Map<String, Object>> bigCategorygoodsList() throws Exception {
		return goodsDAO.bigCategorygoodsList();
	}

	//작은 카테고리 별 상품 리스트
	@Override
	public List<Map<String, Object>> smallCategorygoodsList(String[] category) throws Exception {
		return goodsDAO.smallCategorygoodsList(category);
	}

	//카테고리별 많이 본 순
	@Override
	public List<Map<String, Object>> categoryGoodsBest() throws Exception {
		return goodsDAO.categoryGoodsBest();
	}
	//카테고리별 평점순
	@Override
	public List<Map<String, Object>> categoryGoodsGrade() throws Exception {
		return goodsDAO.categoryGoodsGrade();
	}
	//인기 상품 리스트
	@Override
	public List<Map<String, Object>> goodsBestList() throws Exception {
		return goodsDAO.goodsBestList();
	}
	//할인 상품 리스트(높은가격순)
	@Override
	public List<Map<String, Object>> goodsSaleList1() throws Exception {
		return goodsDAO.goodsSaleList1();
	}

	//할인 상품 리스트(카테고리 정렬)
	@Override
	public List<Map<String, Object>> goodsSaleList2() throws Exception {
		return goodsDAO.goodsSaleList2();
	}

	// 상품 상세보기
	@Override
	public Map<String, Object> goodsDetail(Map<String, Object> map) throws Exception {
		goodsDAO.updateHitCount(map);
		Map<String, Object> goodsDetail = goodsDAO.goodsDetail(map);
		return goodsDetail;
	}

}
