package share.conn.adminCategory;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import share.conn.giftcon.AbstractDAO;

@Repository("adminCategoryDAO")
public class AdminCategoryDAO extends AbstractDAO {
	
	//카테고리 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> categoryList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminCategory.categorySelect", map);
	}
	
	//카테고리 추가
	public void insertCategory(Map<String, Object> map) throws Exception{
		insert("adminCategory.categoryInsert", map);
	}
	
	//카테고리 삭제
	public void deleteCategory(Map<String, Object> map) throws Exception{
		delete("adminCategory.categoryDelete", map);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> bigCategoryList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("adminCategory.bigCategoryList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> categoryCount(Map<String, Object> map){
		return (Map<String, Object>)selectOne("adminCategory.categoryCount", map);
	}
	

}
