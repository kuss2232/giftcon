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
	@RequestMapping(value ="/category.conn")
	public ModelAndView adminCategoryList(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
	      List<Map<String, Object>> adminCategoryList = adminCategoryService.categoryList(commandMap.getMap());
	      mv.addObject("SMALL_CATEGORY", adminCategoryList);
	      mv.setViewName("goods/category");
	      return mv;
	}
	//카테고리 추가폼으로 이동
	@RequestMapping(value = "/adminCategoryInsert.conn")
	public ModelAndView categoryInsert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/Category/adminCategoryInsert");
		return mv;
	}
	
	
	//카테고리 추가
	@RequestMapping(value ="/adminCategory.conn")
	public ModelAndView adminCategoryInsert(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/goods/category.conn");
		adminCategoryService.insertCategory(commandMap.getMap(), request);
		return mv;
	}
	
	//카테고리 삭제
	@RequestMapping(value = "/adminCategoryDelete.conn")
	public ModelAndView adminCategoryDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/goods/category.conn");
		adminCategoryService.deleteCategory(commandMap.getMap());
		return mv;
	}
	
	
	
	

}
