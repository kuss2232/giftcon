package share.conn.giftcon;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import share.conn.giftcon.CommonsUtils;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("goodsImageUtils")
public class GoodsImageUtils {
	//filePath=굿즈 파일 경로
   private static final String filePath = "C:\\프로젝트\\giftcon\\src\\main\\webapp\\resources\\file\\goodsFile\\";
   //filePath2= 공지사항 파일 경로
   private static final String filePath2 = "C:\\java\\maven-app\\MODA\\src\\main\\webapp\\file\\noticeFile\\";
   //filePath3= 이벤트 파일 경로
   private static final String filePath3 = "D:\\java\\giftcon2\\src\\main\\webapp\\resources\\file\\Eventfile\\";
   //filePath5= QNA 파일 경로
   private static final String filePath5 = "C:\\java\\maven-app\\MODA\\src\\main\\webapp\\file\\qnaFile\\";
   
   public List<Map<String, Object>> goodsIMG(Map<String, Object> map, HttpServletRequest request) throws Exception {
	      
	   MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
	   //받아온 이미지 파일 이름 iterator에 저장
	   Iterator<String> iterator =  multipartHttpServletRequest.getFileNames();

	   MultipartFile multipartFile = null;
	   String originalFileName = null;
	   String originalFileExtension = null;
	   String storedFileName = null;

	   List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	   Map<String, Object> listMap = null;

	   /* String EVENT_NUM = map.get("EVENT_NUM").toString(); */

	   File goodsfile = new File(filePath);
	   if (goodsfile.exists() == false) {
		   goodsfile.mkdirs(); // 폴더가 존재하지 않으면 폴더 생성
	   }         
	   while(iterator.hasNext()){ 
		   multipartFile = multipartHttpServletRequest.getFile(iterator.next());
		   if(multipartFile.isEmpty() == false){ 
			   //받아온 이미지 파일 이름을 originalFileName에 저장
			   originalFileName = multipartFile.getOriginalFilename(); 
			   originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); 
			   if(storedFileName == null)
			   {
				   storedFileName = CommonsUtils.getRandomString() + originalFileExtension; 
				   goodsfile = new File(filePath + storedFileName); 
			   }
			   else
			   {
				   String str = CommonsUtils.getRandomString() + originalFileExtension; 
				   storedFileName = storedFileName +","+ str;
				   goodsfile = new File(filePath + str); 
			   }

			   multipartFile.transferTo(goodsfile); 

		   } 
	   } 
	   listMap = new HashMap<String,Object>();
	   /* listMap.put("EVENT_NUM", EVENT_NUM); */
	   listMap.put("GOODS_IMG", storedFileName);
	   listMap.put("GOODS_NAME",map.get("GOODS_NAME"));
	   listMap.put("BIG_CATEGORY",map.get("BIG_CATEGORY"));
	   listMap.put("SMALL_CATEGORY",map.get("SMALL_CATEGORY"));
	   
	   list.add(listMap);
	   return list;
   }

   // 상품이미지 등록
   public List<Map<String, Object>> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request)
         throws Exception {

      MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

      List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
      Map<String, Object> listMap = null;

      if (multipartHttpServletRequest.getFiles("IMAGE") != null) {
         List<MultipartFile> imageFile = multipartHttpServletRequest.getFiles("IMAGE");

         String IMAGE = null;
         String IMAGEExtension = null;

         String GOODS_NUMBER = map.get("GOODS_NUMBER").toString();

         File file = new File(filePath);
         if (file.exists() == false) {
            file.mkdirs(); // 폴더가 존재하지 않으면 폴더 생성
         }

         for (MultipartFile multipartFile : imageFile) {

            if (multipartFile.isEmpty() == false) {
               IMAGEExtension = multipartFile.getOriginalFilename()
                     .substring(multipartFile.getOriginalFilename().lastIndexOf("."));
               IMAGE = "IMAGE_" + GOODS_NUMBER + "_" + System.currentTimeMillis() + IMAGEExtension;

               file = new File(filePath + IMAGE);
               multipartFile.transferTo(file);

               listMap = new HashMap<String, Object>();
               listMap.put("IMAGE", IMAGE);

               listMap.put("GOODS_NUM", map.get("GOODS_NUM"));
               list.add(listMap);
            }
         }
         return list;
      } else {
         return list;
      }
   }

   // 이미지 수정
   public List<Map<String, Object>> parseUpdateImages(Map<String, Object> map, HttpServletRequest request)
         throws Exception {

      MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
      String IMAGEExtension = null;

      List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
      Map<String, Object> listMap = null;
      MultipartFile multipartFile = null;

      File file = new File(filePath);
      if (file.exists() == false) {
         file.mkdirs(); // 폴더가 존재하지 않으면 폴더 생성
      }

      String[] orgImage = request.getParameterValues("ORIGINAL_IMAGE");
      // System.out.println("기존 이미지 배열 : " + orgImage);
      // 기존파일 수정 및 삭제
      for (String a : orgImage) { // 전송된 기존파일 정보가 있으면
         if (request.getParameter(a) != null) { //
            // 기존파일이 수정되었으면 밑의 if문으로들어가고, 아니면 그냥 지나감
            if (multipartHttpServletRequest.getFile("MODIFY_IMAGE_" + a).getSize() > 0) {
               multipartFile = multipartHttpServletRequest.getFile("MODIFY_IMAGE_" + a);

               File removeFile = new File(filePath + a);
               removeFile.delete();

               IMAGEExtension = multipartFile.getOriginalFilename()
                     .substring(multipartFile.getOriginalFilename().lastIndexOf("."));

               file = new File(filePath + a.substring(0, a.lastIndexOf(".")) + IMAGEExtension);
               multipartFile.transferTo(file);

               listMap = new HashMap<String, Object>();
               listMap.put("IMAGE", a.substring(0, a.lastIndexOf(".")) + IMAGEExtension);
               listMap.put("ORIGINAL_IMAGE", a);

               listMap.put("GOODS_NUMBER", map.get("GOODS_NUMBER"));
               list.add(listMap);
            }
         }
      }
      System.out.println(list.size());
      return list;
   }
   
   // 썸네일이미지 삭제
   public void parseDeleteThumbnail(Map<String, Object> map) throws Exception {

      if (map.get("GOODS_THUMBNAIL") != null) {
         File removeFile = new File(filePath + map.get("GOODS_THUMBNAIL"));
         removeFile.delete();
      }
   }

   // 이미지 삭제
   public void parseDeleteImages(Map<String, Object> map) throws Exception {

      if (map.get("IMAGE") != null) {
         File removeFile = new File(filePath + map.get("IMAGE"));
         removeFile.delete();
      }
   }

   // 공지사항 이미지 삭제
   public void notifyImageDelete(Map<String, Object> map) throws Exception {

      if (map.get("NOTIFY_IMAGE") != null) {
         File removeFile = new File(filePath2 + map.get("NOTIFY_IMAGE"));
         removeFile.delete();
      }
   }

   // 이벤트 이미지 삭제
   public void eventImageDelete(Map<String, Object> map) throws Exception {

      if (map.get("EVENT_IMAGE1") != null) {
         File removeFile = new File(filePath3 + map.get("EVENT_IMAGE1"));
         removeFile.delete();
      }
   }
    
   //QNA 이미지 삭제
   public void qnaImageDelete(Map<String, Object> map) throws Exception {
      if(map.get("QNA_IMAGE1") != null) {
         File removeFile = new File(filePath5 + map.get("QNA_IMAGE1"));
         removeFile.delete();
      }
   }

   // 공지사항 이미지 등록
   public List<Map<String, Object>> notifyImage(Map<String, Object> map, HttpServletRequest request)
         throws Exception {

      MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

      List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
      Map<String, Object> listMap = null;

      if (multipartHttpServletRequest.getFiles("NOTIFY_IMAGE") != null) {
         List<MultipartFile> imageFile = multipartHttpServletRequest.getFiles("NOTIFY_IMAGE");

         String IMAGE = null;
         String IMAGEExtension = null;

         String NOTIFY_NUMBER = map.get("NOTIFY_NUMBER").toString();

         File file = new File(filePath2);
         if (file.exists() == false) {
            file.mkdirs(); // 폴더가 존재하지 않으면 폴더 생성
         }

         for (MultipartFile multipartFile : imageFile) {

            if (multipartFile.isEmpty() == false) {
               IMAGEExtension = multipartFile.getOriginalFilename()
                     .substring(multipartFile.getOriginalFilename().lastIndexOf("."));
               IMAGE = "NOTIFY_" + NOTIFY_NUMBER + IMAGEExtension;

               file = new File(filePath2 + IMAGE);
               multipartFile.transferTo(file);

               listMap = new HashMap<String, Object>();
               listMap.put("NOTIFY_IMAGE", IMAGE);

               listMap.put("NOTIFY_NUMBER", map.get("NOTIFY_NUMBER"));
               list.add(listMap);
            }
         }
         return list;
      } else {
         return list;
      }
   }
   
   //Event 이미지 등록
      public List<Map<String, Object>> InsertEventImage(Map<String, Object> map, HttpServletRequest request)
            throws Exception {

         MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
         //받아온 이미지 파일 이름 iterator에 저장
         Iterator<String> iterator =  multipartHttpServletRequest.getFileNames();

         MultipartFile multipartFile = null;
         String originalFileName = null;
         String originalFileExtension = null;
         String storedFileName = null;
              
          List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
         Map<String, Object> listMap = null;
         
		/* String EVENT_NUM = map.get("EVENT_NUM").toString(); */
         
         File eventfile = new File(filePath3);
         if (eventfile.exists() == false) {
            eventfile.mkdirs(); // 폴더가 존재하지 않으면 폴더 생성
         }         
         while(iterator.hasNext()){ 
        	 multipartFile = multipartHttpServletRequest.getFile(iterator.next());
        	 if(multipartFile.isEmpty() == false){ 
        		 //받아온 이미지 파일 이름을 originalFileName에 저장
        		 originalFileName = multipartFile.getOriginalFilename(); 
        		 originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); 
        		 if(storedFileName == null)
        		 {
        			 storedFileName = CommonsUtils.getRandomString() + originalFileExtension; 
        			 eventfile = new File(filePath3 + storedFileName); 
        		 }
        		 else
        		 {
        			 String str = CommonsUtils.getRandomString() + originalFileExtension; 
        			 storedFileName = storedFileName +","+ str;
        			 eventfile = new File(filePath3 + str); 
        		 }
        		 
        		 multipartFile.transferTo(eventfile); 
        	 
        		   } 
        	 } 
         listMap = new HashMap<String,Object>();
			/* listMap.put("EVENT_NUM", EVENT_NUM); */
 		 listMap.put("EVENT_IMG", storedFileName);
 		 listMap.put("EVENT_TITLE",map.get("EVENT_TITLE"));
 		 listMap.put("EVENT_START",map.get("EVENT_START"));
 		 listMap.put("EVENT_END",map.get("EVENT_END"));
			
 		 list.add(listMap);
         return list;
         }

        

        

        
         

   // EVENT 이미지 수정
   public Map<String, Object> faqModifyImage(Map<String, Object> map, HttpServletRequest request) throws Exception {

      MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
      MultipartFile file = multipartHttpServletRequest.getFile("EVENT_IMG*");

      String fileName = "EVENT_IMG_" + map.get("EVENT_NUM").toString();
      String IMAGEExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

      File uploadFile = new File(filePath3 + fileName + IMAGEExtension);

      if (map.get("ORIGINAL_EVENT") != null) {
         String orgFileName = (String) map.get("ORIGINAL_EVENT");
         File removeFile = new File(filePath3 + orgFileName);
         removeFile.delete();
      }

      try {
         file.transferTo(uploadFile);
      } catch (Exception e) {

      }

      map.put("EVENT_IMG", fileName + IMAGEExtension);

      System.out.println("EVENT 이미지 수정완료");
      return map;
   }

   // 공지사항 이미지 수정
   public Map<String, Object> notifyModifyImage(Map<String, Object> map, HttpServletRequest request) throws Exception {

      MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
      MultipartFile file = multipartHttpServletRequest.getFile("NOTIFY_IMAGE");

      String fileName = "NOTIFY_" + map.get("NOTIFY_NUM").toString();
      String IMAGEExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

      File uploadFile = new File(filePath2 + fileName + IMAGEExtension);

      if (map.get("ORIIGINAL_NOTIFY") != null) {
         String orgFileName = (String) map.get("ORIGINAL_NOTIFY");
         File removeFile = new File(filePath2 + orgFileName);
         removeFile.delete();
      }

      try {
         file.transferTo(uploadFile);
      } catch (Exception e) {

      }

      map.put("NOTIFY_IMAGE", fileName + IMAGEExtension);

      System.out.println("공지사항 이미지 수정완료");
      return map;
   }

} 