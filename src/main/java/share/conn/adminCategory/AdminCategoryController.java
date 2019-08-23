package share.conn.adminCategory;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import share.conn.giftcon.CommandMap;
import share.conn.Paging.AdminQNAPaging;
import share.conn.adminCategory.AdminCategoryService;


@Controller
public class AdminCategoryController { 
	@Resource(name = "adminCategoryService")
	private AdminCategoryService adminCategoryService;
	
	private int totalCount;
	private int searchNum;
	
	private String SearchKeyword;
	private int currentPage = 1;
	private int blockCount = 10;
	private int blockPage = 10;
	private String pagingHtml;
	private AdminQNAPaging page;
	
	
	//카테고리 목록
	@RequestMapping(value ="/adminCategory1.conn")
	public ModelAndView adminCategoryList(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> list1;
		if(commandMap.get("BIG_CATEGORY") == null || commandMap.get("BIG_CATEGORY").equals("전체")) {
			list1 = adminCategoryService.categoryList(commandMap.getMap());
		}else {
			list1 = adminCategoryService.bigCategoryList(commandMap.getMap());
		}
	    
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		totalCount = list1.size();
		SearchKeyword = request.getParameter("SearchKeyword");
		
	   
		
		if(SearchKeyword != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			SearchKeyword = request.getParameter("SearchKeyword");
			
			if(searchNum == 0) {
				commandMap.put("SearchKeyword", SearchKeyword);
				list1 = adminCategoryService.searchSmallCategory(commandMap.getMap());
				totalCount = list1.size();
			}else if(searchNum == 1) {
				commandMap.put("SearchKeyword", SearchKeyword);
				list1 = adminCategoryService.searchBigCategory(commandMap.getMap());
				totalCount = list1.size();
			}
			page = new AdminQNAPaging(currentPage, totalCount, blockCount, blockPage, "adminCategory1.conn", searchNum, SearchKeyword);
			pagingHtml = page.getPagingHtml().toString();
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() +1;
			
			list1 = list1.subList(page.getStartCount(), lastCount);
			mv.addObject("SearchKeyword",SearchKeyword);
			mv.addObject("totalCount",totalCount);
			mv.addObject("list",list1);
			mv.addObject("pagingHtml",pagingHtml);
			mv.setViewName("admin/Category/adminCategory1");
			 return mv;
			
		}else {
			totalCount = list1.size();
			
			page = new AdminQNAPaging(currentPage, totalCount, blockCount, blockPage, "adminCategory1.conn");
			pagingHtml = page.getPagingHtml().toString();
			int lastCount = totalCount;
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() +1;
			list1 = list1.subList(page.getStartCount(), lastCount);
			mv.addObject("list", list1);
			 mv.addObject("totalCount",totalCount);
			 mv.addObject("currentPage",currentPage);
			 mv.addObject("pagingHtml",pagingHtml);
			 mv.setViewName("admin/Category/adminCategory1");
			 return mv;
		}
	
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
		
		mv.setViewName("redirect:/adminCategory1.conn");
		return mv;
	}
	
	//카테고리 삭제
	@RequestMapping(value = "/adminCategoryDelete.conn")
	public ModelAndView adminCategoryDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/Category/adminCategory1.conn");
		adminCategoryService.deleteCategory(commandMap.getMap());
		return mv;
	}
	

	

}
