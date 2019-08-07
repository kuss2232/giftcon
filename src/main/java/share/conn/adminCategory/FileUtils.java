package share.conn.adminCategory;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "D:\\giftcon\\giftcon\\src\\main\\webapp\\images\\category\\";

	public Map<String, Object> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		//파일이름들 받아서 저장		
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		//클라이언트에서 전송된 파일정보 담아 반환
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
//		String boardIdx = (String) map.get("CATEGORY_NUM");
		File file = new File(filePath);
		
		//파일 없으면 생성
		if (file.exists() == false) {
			file.mkdirs();
		}
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
//				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				
//				listMap.put("BOARD_IDX", boardIdx);
				listMap.put("CATEGORY_IMG", storedFileName);
				listMap.put("BIG_CATEGORY", map.get("BIG_CATEGORY"));
				listMap.put("SMALL_CATEGORY", map.get("SMALL_CATEGORY"));
//				listMap.put("STORED_FILE_NAME", storedFileName);
//				listMap.put("FILE_SIZE", multipartFile.getSize());
//				list.add(listMap);
				
			}
		}
		return listMap;
	}
}
