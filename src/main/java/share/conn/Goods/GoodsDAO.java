package share.conn.Goods;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

@Repository("goodsDAO")
public class GoodsDAO extends AbstractDAO{
	
	//전체 상품 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsList() throws Exception{
		return selectList("memberGoods.goodsList");
	}
	
	//전체 상품 수
	int goodsCount() throws Exception{
		return (Integer) selectOne("memberGoods.goodsCount");
	}
	
	//상품 이름이나 브랜드로 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchGoods() throws Exception{
		return selectList("memberGoods.searchGoods");
	}
	
	//브랜드리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> smallCategoryList() throws Exception{
		return selectList("memberGoods.goodsCategoryList");
	}
		
	//큰 카테고리 별 상품 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> bigCategorygoodsList() throws Exception{
		return selectList("memberGoods.goodsBigCategoryList");
	}
		
	//작은 카테고리 별 상품 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> smallCategorygoodsList(String[] category) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("category",category);
		return selectList("memberGoods.goodsSmallCategoryList", map);
	}
	
	//카테고리별 많이 본 순
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> categoryGoodsBest(String[] category) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("category",category);
		return selectList("memberGoods.categoryGoodsBest", map);
	}
	
	//카테고리별 평점순
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> categoryGoodsGrade(String[] category) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("category",category);
		return selectList("memberGoods.categoryGoodsGrade", map);
	}
	
	//인기 상품 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsBestList() throws Exception{
		return selectList("memberGoods.goodsBestList");
	}
	
	//할인 상품 리스트(높은가격순)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsSaleList1() throws Exception{
		return selectList("memberGoods.goodsSaleList1");
	}
	
	//할인 상품 리스트(낮은가격순)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsSaleList2() throws Exception{
		return selectList("memberGoods.goodsSaleList2");
	}
	
	//평점순 상품
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsGrade() throws Exception{
		return selectList("memberGoods.goodsGrade");
	}
	
	//할인 상품 리스트 카테고리별(높은가격순)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsSaleCategoryList1(String[] category) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("category",category);
		return selectList("memberGoods.goodsSaleCategoryList1", map);
	}
		
	//할인 상품 리스트 카테고리별(낮은가격순)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsSaleCategoryList2(String[] category) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("category",category);
		return selectList("memberGoods.goodsSaleCategoryList2", map);
	}
	
		
	// 조회수 증가
	public void updateHitCount(Map<String, Object> map) throws Exception {
		update("memberGoods.goodsHitcount", map);
	}
	
	// 상품 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> goodsDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("memberGoods.goodsDetail", map);
	}

}
