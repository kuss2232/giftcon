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
import share.conn.Paging.AdminQNAPaging;


@Controller
public class AdminMemberController {
	@Resource(name = "adminMemberService")
	private AdminMemberService adminMemberService;
	
	private int totalCount;
	private int searchNum;
	

	// 페이징
	private String SearchKeyword;
	private int currentPage = 1;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private AdminQNAPaging page;
	
	

	// 전체 회원 목록
	@RequestMapping(value = "/member/adminMemberList.conn")
	public ModelAndView adminMemberList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> memberList = null;
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		
		SearchKeyword = request.getParameter("SearchKeyword");

		if (SearchKeyword != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			SearchKeyword = request.getParameter("SearchKeyword");
			

			if (searchNum == 0) { // 아이디
				commandMap.put("SearchKeyword", SearchKeyword);
				memberList = adminMemberService.searchMemberId(commandMap.getMap());
				totalCount = memberList.size();
			} else if (searchNum == 1) { // 이름
				memberList = adminMemberService.searchMemberName(commandMap.getMap());
				totalCount = memberList.size();
			} else if (searchNum == 2) { // 전화번호
				memberList = adminMemberService.searchMemberPhone(commandMap.getMap());
				totalCount = memberList.size();
			} else if (searchNum == 3) { // 이메일
				memberList = adminMemberService.searchMemberEmail(commandMap.getMap());
				totalCount = memberList.size();
			} else if (searchNum == 4) { //상태
				memberList = adminMemberService.searchMemberState(commandMap.getMap());
				totalCount = memberList.size();
			}

			page = new AdminQNAPaging(currentPage, totalCount, blockCount, blockPage, "adminMemberList.conn", searchNum, SearchKeyword);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			memberList = memberList.subList(page.getStartCount(), lastCount);
			
			mv.addObject("SearchKeyword", SearchKeyword);
			mv.addObject("searchNum", searchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("memberList", memberList);
			mv.setViewName("/admin/Member/admin_memberList");

			return mv;

		} else {
			memberList = adminMemberService.memberList(commandMap.getMap());
			totalCount = memberList.size();

			page = new AdminQNAPaging(currentPage, totalCount, blockCount, blockPage, "adminMemberList.conn");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			memberList = memberList.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);

			mv.addObject("memberList", memberList);
			mv.setViewName("/admin/Member/admin_memberList");

		
			return mv;
		}
	}

	// 회원 상세정보에서 한번에 수정가능
	@RequestMapping(value = "/member/adminMemberDetail.conn")
	public ModelAndView adminMemberDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		Map<String, Object> member = adminMemberService.memberDetail(commandMap.getMap());

		mv.addObject("member", member);
		mv.setViewName("/admin/Member/admin_memberModify");

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
