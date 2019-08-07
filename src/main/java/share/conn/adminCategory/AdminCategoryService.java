package share.conn.adminCategory;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface AdminCategoryService {
	
	//카테고리 목록
	public List<Map<String, Object>> categoryList(Map<String, Object> map) throws Exception;
	
	//카테고리 추가
	public void insertCategory(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	//카테고리 삭제
	public void deleteCategory(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> bigCategoryList(Map<String, Object> map) throws Exception;

}
