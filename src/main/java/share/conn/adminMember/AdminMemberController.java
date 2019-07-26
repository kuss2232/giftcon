package share.conn.adminMember;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.giftcon.CommandMap;
import share.conn.Paging.Paging;

@Controller
public class AdminMemberController {
	private int searchNum;

	private String isSearch;

	// 페이징
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;

	@Resource(name = "adminMemberService")
	private AdminMemberService adminMemberService;

	// 전체 회원 목록
	@RequestMapping(value = "/member/adminMemberList.conn")
	public ModelAndView adminMemberList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> memberList = adminMemberService.memberList(commandMap.getMap());

		Map<String, Object> isSearchMap = new HashMap<String, Object>();
		
		isSearch = request.getParameter("isSearch");

		if (isSearch != null) {
			
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			isSearchMap.put("isSearch", isSearch);	

			if (searchNum == 0) { // 아이디
				memberList = adminMemberService.searchMemberId(isSearchMap);
			} else if (searchNum == 1) { // 이름
				memberList = adminMemberService.searchMemberName(isSearchMap);
			} else if (searchNum == 2) { // 전화번호
				memberList = adminMemberService.searchMemberPhone(isSearchMap);
			} else if (searchNum == 3) { // 이메일
				memberList = adminMemberService.searchMemberEmail(isSearchMap);
			} else if (searchNum == 4) { //상태
				memberList = adminMemberService.searchMemberState(isSearchMap);
			}

			totalCount = memberList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminMemberList", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			memberList = memberList.subList(page.getStartCount(), lastCount);
			
			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("memberList", memberList);
			mv.setViewName("memberList");

			return mv;

		} else {

			totalCount = memberList.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminMemberList");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			memberList = memberList.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);

			mv.addObject("memberList", memberList);
			mv.setViewName("memberList");

		
			return mv;
		}
	}

	// 회원 상세정보에서 한번에 수정가능
	@RequestMapping(value = "/member/adminMemberDetail.conn")
	public ModelAndView adminMemberDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		Map<String, Object> member = adminMemberService.memberDetail(commandMap.getMap());

		mv.addObject("member", member);
		mv.setViewName("updateMember");

		return mv;
	}

	// 회원 정보 수정
	@RequestMapping(value = "/member/adminModifyMember.conn")
	public ModelAndView adminUpdateMember(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		adminMemberService.updateMember(commandMap.getMap());
		mv.setViewName("redirect:/member/adminMemberList.conn");

		return mv;
	}

	// 회원 삭제
	@RequestMapping(value = "/member/adminDeleteMember.conn")
	public ModelAndView adminDeleteMember(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		adminMemberService.deleteMember(commandMap.getMap());
		mv.setViewName("redirect:/member/adminMemberList.conn");

		return mv;
	}
}
