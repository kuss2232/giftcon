package share.conn.adminCategory;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import share.conn.adminCategory.AdminCategoryDAO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import share.conn.adminCategory.FileUtils;

@Service("adminCategoryService")
public class AdminCategoryServiceImpl implements AdminCategoryService{
	
	@Resource(name = "adminCategoryDAO")
	private AdminCategoryDAO adminCategoryDAO;
	
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	
	//카테고리 목록
	@Override
	public List<Map<String, Object>> categoryList(Map<String, Object> map) throws Exception{
		return adminCategoryDAO.categoryList(map);
	}
	
	//카테고리 추가
	@Override
	public void insertCategory(Map<String, Object> map, HttpServletRequest request) throws Exception{
//		adminCategoryDAO.insertCategory(map);
		Map<String,Object> listmap = fileUtils.parseInsertFileInfo(map, request);
//		System.out.println("big_category : " +listmap.get("BIG_CATEGORY"));
//		System.out.println("small_category : "+ listmap.get("SMALL_CATEGORY"));
//		System.out.println("img1 :" + listmap.get("CATEGORY_IMG"));
		adminCategoryDAO.insertCategory(listmap);
	}
	
	
	//카테고리 삭제
	@Override
	public void deleteCategory(Map<String, Object> map) throws Exception{
		adminCategoryDAO.deleteCategory(map);
	}
	
	//빅카테고리 정렬
	@Override
	public List<Map<String, Object>> bigCategoryList(Map<String, Object> map) throws Exception{
		return adminCategoryDAO.bigCategoryList(map);
	}
	
	//카테고리별 수량
	@Override
	public Map<String, Object> categoryCount(Map<String, Object> map) throws Exception{
		return adminCategoryDAO.categoryCount(map);
	}
	

}
