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
		adminCategoryDAO.insertCategory(map);
		
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size= list.size(); i<size; i++) {
			adminCategoryDAO.insertCategory(list.get(i));

		}
	}
	
	
	//카테고리 삭제
	@Override
	public void deleteCategory(Map<String, Object> map) throws Exception{
		adminCategoryDAO.deleteCategory(map);
	}
	

}
