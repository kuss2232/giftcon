package share.conn.adminCategory;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import share.conn.giftcon.CommandMap;
import share.conn.adminCategory.AdminCategoryService;


@Controller
public class AdminCategoryController { 
	@Resource(name = "adminCategoryService")
	private AdminCategoryService adminCategoryService;
	
	//카테고리 목록
	@RequestMapping(value ="/adminCategory.conn")
	public ModelAndView adminCategoryList(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/Category/adminCategory");
		List<Map<String, Object>> list;
		Map<String, Object> count;
		if(commandMap.get("BIG_CATEGORY") == null || commandMap.get("BIG_CATEGORY").equals("전체")) {
			list = adminCategoryService.categoryList(commandMap.getMap());
			count = adminCategoryService.categoryCount(commandMap.getMap());
		}else {
			list = adminCategoryService.bigCategoryList(commandMap.getMap());
			count = adminCategoryService.categoryCount(commandMap.getMap());
		}
	    
	    mv.addObject("list", list);
	    mv.addObject("count", count);
	    return mv;
	
	}

	
	//카테고리 추가 화면
	@RequestMapping(value = "/admincategoryInsertForm.conn")
	public ModelAndView categoryInsert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/Category/adminCategoryInsert");
		return mv;
	}
	
	
	//카테고리 추가
	@RequestMapping(value ="/adminCategoryInsert.conn")
	public ModelAndView adminCategoryInsert(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		adminCategoryService.insertCategory(commandMap.getMap(), request);
		
		mv.setViewName("redirect:/adminCategory.conn");
		return mv;
	}
	
	//카테고리 삭제
	@RequestMapping(value = "/adminCategoryDelete.conn")
	public ModelAndView adminCategoryDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/Category/adminCategory.conn");
		adminCategoryService.deleteCategory(commandMap.getMap());
		return mv;
	}
	
	//카테고리별 수량
	

}
