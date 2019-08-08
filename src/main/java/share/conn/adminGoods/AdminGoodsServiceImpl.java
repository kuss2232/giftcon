package share.conn.adminGoods;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import share.conn.giftcon.GoodsImageUtils;

@Service("adminGoodsService")
public class AdminGoodsServiceImpl implements AdminGoodsService {

   @Resource(name = "adminGoodsDAO")
   private AdminGoodsDAO adminGoodsDAO;

   @Resource(name = "goodsImageUtils")
   private GoodsImageUtils goodsImageUtils;

   // 상품 리스트
   @Override
   public List<Map<String, Object>> adGoodsList() throws Exception {
      return adminGoodsDAO.adGoodsList();
   }

   // 전체 상품 수
   @Override
   public Integer adAllGoodsNum() throws Exception {
      return new Integer(adminGoodsDAO.adAllGoodsNum());
   }
   
   //상품 상세
   @Override
   public List<Map<String, Object>> adGoodsDetail(Map<String, Object> map) throws Exception {
	   List<Map<String, Object>> adGoodsDetail = adminGoodsDAO.adGoodsDetail(map);
	   return adGoodsDetail;
   }
   
   // 상품 등록
   @Override
   public void adGoodsinsert(Map<String, Object> map, HttpServletRequest request) throws Exception {

      adminGoodsDAO.adGoodsinsert(map);
      
      List<Map<String, Object>> list = goodsImageUtils.goodsIMG(map, request);
      int num = adminGoodsDAO.selectGoodsNum(map);
      System.out.println("aaaaaa  "+num);
      //map.put("GOODS_NUM", num);
      
      for(int i=0, size=list.size(); i<size; i++) {
    	System.out.println(list.get(i));  
    	Map<String, Object> mapp = (Map<String, Object>)list.get(i);
    	mapp.put("GOODS_NUM", num);
    	adminGoodsDAO.insertGoodsIMG1(mapp);
      }
   }
   
   //카테고리 불러오기 (빅카테고리, 스몰카테고리로 카테고리넘 찾기)
   public Map<String,Object> adGoodsSelectCategory(Map<String, Object> map) throws Exception {
	      return adminGoodsDAO.adGoodsSelectCategory(map);
   }
   
   //수정 폼으로 이동
   @Override
   public List<Map<String, Object>> modifyGoodsForm(Map<String, Object> map) throws Exception {
      List<Map<String, Object>> goodsDetail = adminGoodsDAO.modifyGoodsForm(map);
      return goodsDetail;
   }

   // 수정 폼 이동할때 상품 이미지 같이 가져오기
   @Override
   public List<Map<String, Object>> modifyGoodsFormImage(Map<String, Object> map) throws Exception {
      List<Map<String, Object>> goodsImage = adminGoodsDAO.modifyGoodsFormImage(map);
      return goodsImage;
   }
   
   // 상품 수정
   @Override
   public void adGoodsModify(Map<String, Object> map, HttpServletRequest request) throws Exception {

      // 상품 기본정보 수정
      adminGoodsDAO.adGoodsModify(map);

      List<Map<String, Object>> list = goodsImageUtils.goodsIMG(map, request);
      int num = adminGoodsDAO.selectGoodsNum(map);
      System.out.println("aaaaaa  "+num);
      //map.put("GOODS_NUM", num);
      
      for(int i=0, size=list.size(); i<size; i++) {
    	System.out.println(list.get(i));  
    	Map<String, Object> mapp = (Map<String, Object>)list.get(i);
    	mapp.put("GOODS_NUM", num);
    	adminGoodsDAO.adGoodsImgModify(mapp);
      }
      
   }

   // 상품 삭제
   @Override
   public void adGoodsDelete(Map<String, Object> map) throws Exception {
      adminGoodsDAO.adGoodsDelete(map);
   }

   // 상품 검색(상품 번호)
   @Override
   public List<Map<String, Object>> adGoodsNumSearch(String isSearch) throws Exception {
      List<Map<String, Object>> adGoodsList = adminGoodsDAO.adGoodsNumSearch(isSearch);
      return adGoodsList;
   }

   // 상품 검색(상품명)
   @Override
   public List<Map<String, Object>> adGoodsNameSearch(String isSearch) throws Exception {
      List<Map<String, Object>> adGoodsList = adminGoodsDAO.adGoodsNameSearch(isSearch);
      return adGoodsList;
   }

   // 상품 검색(브랜드명)
   @Override
   public List<Map<String, Object>> adGoodsCategory2Search(String isSearch) throws Exception {
      List<Map<String, Object>> adGoodsList = adminGoodsDAO.adGoodsCategory2Search(isSearch);
      return adGoodsList;
   }
   
	/*
	 * public void adGoodsDc(Map<String, Object> map) throws Exception {
	 * adminGoodsDAO.adGoodsDc(map); }
	 * 
	 * public void adCategoryDc(Map<String, Object> map) throws Exception {
	 * adminGoodsDAO.adCategoryDc(map); }
	 * 
	 * public void adGoodsDcCancel(Map<String, Object> map) throws Exception {
	 * adminGoodsDAO.adGoodsDcCancel(map); }
	 * 
	 * public void adCategoryDcCancel(Map<String, Object> map) throws Exception {
	 * adminGoodsDAO.adCategoryDcCancel(map); }
	 * 
	 * public List<Map<String, Object>> adDcGoodsListPriceSort(Map<String, Object>
	 * map) throws Exception { List<Map<String, Object>> adGoodsList =
	 * adminGoodsDAO.adDcGoodsListPriceSort(map); return adGoodsList; }
	 * 
	 * public List<Map<String, Object>> adDcGoodsListAllCategory(Map<String, Object>
	 * map) throws Exception { List<Map<String, Object>> adGoodsList =
	 * adminGoodsDAO.adDcGoodsListAllCategory(map); return adGoodsList; }
	 */
}