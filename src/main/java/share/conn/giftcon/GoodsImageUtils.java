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
   private static final String filePath = "D:\\giftcon\\giftcon\\src\\main\\webapp\\resources\\file\\goodsFile\\";
   //filePath2= 공지사항 파일 경로
   private static final String filePath2 = "D:\\giftcon\\giftcon\\src\\main\\webapp\\resources\\file\\noticeFile\\";
   //filePath3= 이벤트 파일 경로
   private static final String filePath3 = "D:\\giftcon\\giftcon\\src\\main\\webapp\\resources\\file\\event\\";
   
   
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

  
   // 공지사항 이미지 삭제
   public void notifyImageDelete(Map<String, Object> map) throws Exception {

      if (map.get("NOTIFY_IMAGE") != null) {
         File removeFile = new File(filePath2 + map.get("NOTIFY_IMAGE"));
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