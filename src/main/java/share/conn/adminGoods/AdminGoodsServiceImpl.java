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
      
      goodsImageUtils.goodsIMG1(map, request);
      int num = adminGoodsDAO.selectGoodsNum(map);
      map.put("GOODS_NUM", num);
      adminGoodsDAO.insertGoodsIMG1(map);
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

      MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
      
      //이미지 1 수정
      if (multipartHttpServletRequest.getFile("GOODS_IMG1").getSize() > 0) {
          map = goodsImageUtils.parseUpdateIMG(map, request);
          adminGoodsDAO.insertGoodsIMG1(map);
      }
      
      // 상품 이미지 수정, 삭제
      System.out.println("이미지 : " + map.get("ORIGINAL_IMAGE"));

      if (map.get("ORIGINAL_IMAGE") != null) {
         List<Map<String, Object>> goodsImageList = goodsImageUtils.parseUpdateImages(map, request);

         if (goodsImageList.size() > 0) {
            for (int i = 0; i < goodsImageList.size(); i++) {
               adminGoodsDAO.adGoodsImgModify(goodsImageList.get(i));
            }
         }

      }

      // 새로 입력된 이미지 등록
      List<MultipartFile> IMAGES = multipartHttpServletRequest.getFiles("IMAGE");

      System.out.println("MAP이미지1 : " + multipartHttpServletRequest.getFile("IMAGE"));
      System.out.println("MAP이미지 : " + multipartHttpServletRequest.getFiles("IMAGE"));
      System.out.println("SIZE : " + IMAGES.size());

      if (IMAGES.size() > 0) {
         List<Map<String, Object>> goodsImageList = goodsImageUtils.parseInsertFileInfo(map, request);

         System.out.println("goodsImageList : " + goodsImageList);
         System.out.println("mapImage : " + map.get("IMAGE"));

         for (int i = 0; i < goodsImageList.size(); i++) {
            adminGoodsDAO.adinsertGoodsImg(goodsImageList.get(i));
         }
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
   
   public void adGoodsDc(Map<String, Object> map) throws Exception {
	   adminGoodsDAO.adGoodsDc(map);
   }
   
   public void adCategoryDc(Map<String, Object> map) throws Exception {
	   adminGoodsDAO.adCategoryDc(map);
   }
   
   public void adGoodsDcCancel(Map<String, Object> map) throws Exception {
	   adminGoodsDAO.adGoodsDcCancel(map);
   }
   
   public void adCategoryDcCancel(Map<String, Object> map) throws Exception {
	   adminGoodsDAO.adCategoryDcCancel(map);
   }
   
   public List<Map<String, Object>> adDcGoodsListPriceSort(Map<String, Object> map) throws Exception {
	   List<Map<String, Object>> adGoodsList = adminGoodsDAO.adDcGoodsListPriceSort(map);
	   return adGoodsList;
   }
   
   public List<Map<String, Object>> adDcGoodsListAllCategory(Map<String, Object> map) throws Exception {
	   List<Map<String, Object>> adGoodsList = adminGoodsDAO.adDcGoodsListAllCategory(map);
	   return adGoodsList;
   }
}