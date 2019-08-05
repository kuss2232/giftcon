<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="subWrap">
				<div class="subLayout">
				
				
					
					<!-- start:csTab -->
					



<ul class="subTab">
	<li><a href="/mypage/userPwdCheck.do">회원정보수정</a></li>
	<li><a href="/mypage/userPwdMod.do">비밀번호변경</a></li>
	<li><a href="/giftcon/myQnalist.conn" class="on">나의 문의 이력</a></li>
	<li><a href="/mypage/sendPhoneAuth.do">발신번호사전등록</a></li>
	<li><a href="/mypage/addrGroupList.do">주소록 관리</a></li>
</ul>
					<!-- /end:csTab -->
				
				
				
					
					<form id="qnaFrm" name="qnaFrm" action="/mypage/qnaList.do" method="GET">
						<input type="hidden" name="pageNo">
						<input type="hidden" name="searchPeriod" value="1M">
					<!-- start:searchBox -->
					<div class="mySearch">
						<div class="timeSet">
							<a href="#" onclick="javascript:goSearchPeriodList('1W');">1주일</a>
							<a href="#" onclick="javascript:goSearchPeriodList('1M');" class="on">1개월</a>
							<a href="#" onclick="javascript:goSearchPeriodList('3M');">3개월</a>
							<a href="#" onclick="javascript:goSearchPeriodList('6M');">6개월</a>
						</div>
						<div class="iptDate">
							<span><input type="text" id="searchStart" name="searchStart" class="ui-datepicker-trigger-qna hasDatepicker" placeholder="시작일자" value="2019-07-05" readonly=""></span>
							 ~ 
							<span><input type="text" id="searchEnd" name="searchEnd" class="ui-datepicker-trigger-qna hasDatepicker" placeholder="종료일자" value="2019-08-05" readonly=""></span>
							<a href="#" class="btnSearch" onclick="javascript:goSearch(); return false;">검색</a>
						</div>
						
						<span><a href="/mypage/qnaReg.do" class="btnMidBgBlue6 w100 ml7">신규문의 등록</a></span>
						
					</div>
					<!-- /end:searchBox -->
					<!-- start:ask_list -->
					<div class="askList">
						<p>조회내역 총 1건</p>
						
						
						<ul class="myAskList">
							
							<li id="list_0" class="">
								<a href="#" onclick="javascript:goDetail(0); return false;">
									<span class="txtCate">[기타]</span>
									<span class="tit">문의</span>
									<span class="txtState">
										답변완료
										<em>상세내용보기</em>
									</span>
								</a>
								<div id="view_0" class="view" style="display: none;">
									<p class="txtDate">[등록일] 2019.07.22</p>
									<p class="txtCont">
										문의 연습입니다.
										
									</p>
									
									<div class="answerBox">
										<span class="icoAnswer">답변</span>
										<p>
안녕하세요 비즈 모바일 도넛북입니다.

문의 사항이 있으신 경우 1:1게시판 또는 고객센터로 문의 부탁드립니다.

감사합니다.</p>
									</div>
									
								</div>
							</li>
							
						</ul>
						
						
						
					</div>
					<!-- /end:ask_list -->
					<div>
</div></form>
					
					<div class="paginate">
						<div class="first"><a class="disabled">처음페이지</a></div><div class="prev"><a class="disabled">이전페이지</a></div><ul class="numList"><li><a href="#" onclick="goList(1); return false;" class="on">1</a></li></ul><div class="next"><a class="disabled">다음페이지</a></div><div class="last"><a class="disabled">마지막페이지</a></div>
					</div>
				</div>
			</div>
			
<script type="text/javascript">
function goList(pageNo) {
	var form = document.qnaFrm;
	form.pageNo.value = pageNo;
	form.target = "_self";
	form.action = "/mypage/qnaList.do";
	form.submit();
}

function goSearch() {
	
	if(!isValidStdtToEndt($("#searchStart").val(), $("#searchEnd").val(), "-")) {
		alert("잘못된 조회 기간입니다.\n조회 시작 일자 종료 일자를 확인해 주세요.");
		return;
	}
	
	var form = document.qnaFrm;
	form.pageNo.value = 1;
	form.searchPeriod.value = '';
	form.target = "_self";
	form.action = "/mypage/qnaList.do";
	form.submit();
}

function goSearchPeriodList(period) {
	var form = document.qnaFrm;
	form.searchPeriod.value = period;
	form.pageNo.value = 1;
	form.target = "_self";
	form.action = "/mypage/qnaList.do";
	form.submit();
}

function goDetail(index) {
	var listId = "#list_"+index;
	var viewId = "#view_"+index;
	var objId = "#obj_"+index;
	
	if ($(listId).attr('class') == 'on') {
		$(listId).attr('class', '');
		$(viewId).hide();
	} else {
		$(listId).attr('class', 'on');
		$(viewId).show();
	}
}
</script>
</body>
</html>
<%@include file="../module/footer.jsp"%>