package share.conn.adminFaq;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import share.conn.adminFaq.AdminFaqService;
import share.conn.giftcon.CommandMap;
import share.conn.Paging.AdminQNAPaging;


@Controller
public class AdminFaqController {
	@Resource(name = "AdminFaqService")
	private AdminFaqService adminFaqService;
	
	private int searchNum;
	private int totalCount;
	
	
	//페이징 변수
	private String SearchKeyword;
	private int currentPage = 1;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private AdminQNAPaging page;


	

	/*
	 * @RequestMapping(value = "/admin/adminPage") public String list() { return
	 * "adminForm"; }
	 */

	//FAQ 전체 리스트
	@RequestMapping(value = "/faq/adminFaqList.conn")
	public ModelAndView faqList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> faqList = adminFaqService.adminfaqList(commandMap.getMap());
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		
		totalCount = faqList.size();
		
		SearchKeyword = request.getParameter("SearchKeyword");

		if (SearchKeyword != null) {
		
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			SearchKeyword = request.getParameter("SearchKeyword");

			if (searchNum == 0) { // 제목검색
				commandMap.put("SearchKeyword", SearchKeyword);
				faqList = adminFaqService.faqSearch(commandMap.getMap());
				totalCount = faqList.size();
			} else if (searchNum == 1) { // 내용검색
				commandMap.put("SearchKeyword", SearchKeyword);
				faqList = adminFaqService.faqSearch(commandMap.getMap());
				totalCount = faqList.size();
			}

			page = new AdminQNAPaging(currentPage, totalCount, blockCount, blockPage,"adminFaqList.conn",searchNum,SearchKeyword);
			pagingHtml = page.getPagingHtml().toString();

					int lastCount = totalCount;

					if (page.getEndCount() < totalCount)
						lastCount = page.getEndCount() + 1;

					faqList = faqList.subList(page.getStartCount(), lastCount);
					
					mv.addObject("SearchKeyword", SearchKeyword);
					mv.addObject("SearchNum", searchNum);
					mv.addObject("totalCount", totalCount);
					mv.addObject("pagingHtml",	pagingHtml); 
					mv.addObject("currentPage", currentPage);

					mv.addObject("faqList", faqList); 
					mv.setViewName("/admin/Faq/admin_faq");

				 return mv;
		
		
		} else {
			
		totalCount = faqList.size();

		page = new AdminQNAPaging(currentPage, totalCount, blockCount, blockPage,"adminFaqList.conn");
		pagingHtml = page.getPagingHtml().toString();

				int lastCount = totalCount;

				if (page.getEndCount() < totalCount)
					lastCount = page.getEndCount() + 1;

				faqList = faqList.subList(page.getStartCount(), lastCount);

				mv.addObject("totalCount", totalCount);
				mv.addObject("pagingHtml",	pagingHtml); 
				mv.addObject("currentPage", currentPage);

				mv.addObject("faqList", faqList); 
				mv.setViewName("/admin/Faq/admin_faq");

			 return mv;
		}
	}
	
	
	@RequestMapping(value = "/faq/adminFaqCategory.conn", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView FAQCatogory(@RequestBody CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		//String category = request.getParameter("FAQ_CATEGORY");
		//System.out.println(" 값 확인0 +++++++++++" + request.getParameter("FAQ_CATEGORY"));

		//commandMap.put("FAQ_CATEGORY", category);

		System.out.println(" CommandMap값 확인  +++++++++++" + commandMap.get("FAQ_CATEGORY"));
		
		List<Map<String, Object>> faqCategoryList = adminFaqService.faqCategoryList(commandMap.getMap());
		
		mv.addObject("faqCategoryList", faqCategoryList);
		mv.setViewName("jsonView");

		return mv;
	}
	 



	// FAQ 등록 폼
	@RequestMapping(value = "/faq/adminFaqForm.conn")
	public ModelAndView faqWriteForm() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/Faq/admin_Insertfaq");
		return mv;
	}
	
	// FAQ 등록
	@RequestMapping(value = "/faq/adminWriteFaq.conn")
	public ModelAndView faqWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/faq/adminFaqList.conn");
//System.out.println(" CommandMap값 확인  +++++++++++" + commandMap.get("FAQ_CATEGORY"));
		adminFaqService.adminfaqWrite(commandMap.getMap(), request);

		return mv;
	}
	
	//FAQ 상세보기
	@RequestMapping(value = "/faq/adminFaqDetail.conn")
	public ModelAndView faqDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> faqDetail = adminFaqService.faqDetail(commandMap.getMap());
		
		mv.addObject("faqDetail", faqDetail);
		mv.setViewName("/admin/Faq/admin_faqdetail");		
		
		return mv;
	}



	// FAQ 수정 폼 이동
	@RequestMapping(value = "/faq/adminFaqModifyForm.conn")
	public ModelAndView faqModifyForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		Map<String, Object> faqDetail = adminFaqService.faqDetail(commandMap.getMap());
		mv.addObject("faqDetail", faqDetail);
		mv.setViewName("/admin/Faq/admin_faqModifyForm");

		return mv;
	}

	// FAQ 수정
	@RequestMapping(value = "/faq/adminFaqModify.conn")
	public ModelAndView faqModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/faq/adminFaqList.conn");
		commandMap.put("FAQ_CATEGORY", request.getParameter("FAQ_CATEGORY"));
		adminFaqService.faqModify(commandMap.getMap(), request);

		mv.addObject("FAQ_NUM", commandMap.get("FAQ_NUM"));

		return mv;
	}

	// FAQ 삭제
	@RequestMapping(value = "/faq/adminDeleteFaq.conn")
	public ModelAndView faqDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/faq/adminFaqList.conn");

		//Map<String, Object> deleteFaq = adminFaqService.faqDetail(commandMap.getMap());

		adminFaqService.faqDelete(commandMap.getMap());

		return mv;
	}
}