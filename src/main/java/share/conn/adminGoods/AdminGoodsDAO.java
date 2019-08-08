package share.conn.adminGoods;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

@Repository("adminGoodsDAO")
public class AdminGoodsDAO extends AbstractDAO {

   // 상품 리스트
   public List<Map<String, Object>> adGoodsList() throws Exception {
      return selectList("adminGoods.adGoodsList");
   }

   // 전체 상품수
   public Integer adAllGoodsNum() throws Exception {
      return (Integer) selectOne("adminGoods.adAllGoodsNum");
   }
   
   //상품 상세
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> adGoodsDetail(Map<String, Object> map) throws Exception {
	   return (List<Map<String, Object>>) selectList("adminGoods.adGoodsDetail", map);
   }
   
   // 상품 등록
   public void adGoodsinsert(Map<String, Object> map) throws Exception {
      insert("adminGoods.adGoodsinsert", map);
   }
   
   
   //카테고리 불러오기 (빅카테고리, 스몰카테고리로 카테고리넘 찾기)
   public Map<String,Object> adGoodsSelectCategory(Map<String, Object> map) throws Exception{
	   return selectOne1("adminGoods.adGoodsSelectCategory", map);
   }
   
   //썸네일 등록
   public void insertGoodsIMG1(Map<String, Object> map) throws Exception {
	      update("adminGoods.insertGoodsIMG1", map);
   }
   
   // 상품 번호 찾기
   public int selectGoodsNum(Map<String,Object> map) throws Exception{
	   return (Integer) selectOne("adminGoods.selectGoodsNum",map);
   }
   
   // 이미지 등록
   public void adinsertGoodsImg(Map<String, Object> map) throws Exception {
      insert("adminGoods.adinsertGoodsImg", map);
   }
   
   // 상품 수정 폼으로 이동(데이터 들고감)
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> modifyGoodsForm(Map<String, Object> map) throws Exception {
      return (List<Map<String, Object>>) selectList("adminGoods.selectOneGoods", map);
   }

   // 상품 이미지 정보
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> modifyGoodsFormImage(Map<String, Object> map) throws Exception {
      return (List<Map<String, Object>>) selectList("adminGoods.selectOneGoodsImage", map);
   }
   
   // 상품 수정
   public void adGoodsModify(Map<String, Object> map) throws Exception {
      update("adminGoods.adGoodsModify", map);
   }

   // 상품 이미지 수정
   public void adGoodsImgModify(Map<String, Object> map) throws Exception {
      update("adminGoods.adGoodsImgModify", map);
   }

	/*
	 * // 주문취소시 상품 수량 복구 public void addAmount(Map<String, Object> map) throws
	 * Exception { update("adminGoods.addAmount", map); }
	 */


   // 상품 삭제
   public void adGoodsDelete(Map<String, Object> map) throws Exception {
      delete("adminGoods.adGoodsDelete", map);
   }

   // 상품 검색(상품 번호)
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> adGoodsNumSearch(String isSearch) throws Exception {
      return (List<Map<String, Object>>) selectList("adminGoods.adGoodsNumSearch", isSearch);
   }

   // 상품 검색(상품명)
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> adGoodsNameSearch(String isSearch) throws Exception {
      return (List<Map<String, Object>>) selectList("adminGoods.adGoodsNameSearch", isSearch);
   }

   // 상품 검색(브랜드명)
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> adGoodsCategory2Search(String isSearch) throws Exception {
      return (List<Map<String, Object>>) selectList("adminGoods.adGoodsCategory2Search", isSearch);
   }
   
	/*
	 * //상품 할인적용 (상품번호 1개만) public void adGoodsDc(Map<String, Object> map) throws
	 * Exception { update("adminGoods.adGoodsDc", map); }
	 * 
	 * //상품 할인적용 (카테고리) public void adCategoryDc(Map<String, Object> map) throws
	 * Exception { update("adminGoods.adCategoryDc", map); }
	 * 
	 * //상품 할인취소 (상품번호 1개만) public void adGoodsDcCancel(Map<String, Object> map)
	 * throws Exception { update("adminGoods.adGoodsDcCalcel", map); }
	 * 
	 * //상품 할인취소 (카테고리) public void adCategoryDcCancel(Map<String, Object> map)
	 * throws Exception { update("adminGoods.adCategoryDcCancel", map); }
	 * 
	 * //할인 중인 상품리스트 (가격순 정렬)
	 * 
	 * @SuppressWarnings("unchecked") public List<Map<String, Object>>
	 * adDcGoodsListPriceSort(Map<String, Object> map) throws Exception { return
	 * (List<Map<String, Object>>) selectList("adminGoods.adDcGoodsListPriceSort",
	 * map); }
	 * 
	 * //할인 중인 상품리스트 (카테고리 정렬)
	 * 
	 * @SuppressWarnings("unchecked") public List<Map<String, Object>>
	 * adDcGoodsListAllCategory(Map<String, Object> map) throws Exception { return
	 * (List<Map<String, Object>>) selectList("adminGoods.adDcGoodsListPriceSort",
	 * map); }
	 */
}