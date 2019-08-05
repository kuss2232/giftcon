<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="toDay" class="java.util.Date" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head><style>
div.paginate > div > a.disabled:hover {border: 1px solid #ddd;}
</style>

<title>title</title>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>


<link href="/giftcon/css/jquery/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="/js/jquery/jq.datepicker.init.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/jquery/jquery-ui.min.js" charset="utf-8"></script>





<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
<script src="//rum.beusable.net/script/b180518e163409u824/b474a1029d" type="text/javascript"></script> 
</head>
<body>
<div id="container">
		<div class="contents">

			<!-- start:contents -->
			<div class="subWrap">
				<div class="subLayout">
					<!-- start:csTab -->
<ul class="csTab mb70">
	<li><a href="/giftcon/notice.conn"><span class="icoNotice"></span><em>공지사항</em></a></li>
	<li><a href="/giftcon/faq.conn"><span class="icoFaq"></span><em>FAQ</em></a></li>
	<%if(session.getAttribute("MEMBER_ID") != null){ %>
	<li><a href="/giftcon/mypage/qna/insertform.conn" class="on"><span class="icoOneAsk"></span><em>1:1문의</em></a></li>
	<%}else{ %>
	<li><a href="/giftcon/loginForm.conn"><span class="icoOneAsk"></span></a></li>
	<%} %>
</ul>
<ul class="subTab">
	<li><a href="/giftcon/mypage/qna/insertform.conn" class="on">문의등록</a></li>
	<li><a href="/giftcon/mypage/qnalist.conn">나의 문의 이력</a></li>
</ul>
					<!-- /end:csTab -->
					<form id="qnaFrm" name="qnaFrm" class="form-horizontal row" action="/giftcon/mypage/qna/insert.conn" method="post" enctype="multipart/form-data">
					<!-- start:ask_register -->
					<input type="hidden" name="MEMBER_NUM" value="${sessionScope.MEMBER_NUM}">
					<p class="careTxt">(*) 쿠폰관련 문의 시 수신번호 또는 쿠폰번호를 기재해주시기 바랍니다.</p>
					<table summary="일대일 문의 내용 등록" class="tbA">
					  <caption>문의내용 입력</caption>
					  	<colgroup>
					  		<col width="20%">
					  		<col width="30%">
					  		<col width="20%">
					  		<col width="30%">
					  	</colgroup>
					  	<tbody>
						<tr>
						  <th scope="row"><label for="ask_cate"><span class="mustTxt">*</span> 문의유형</label></th>
						  <td class="last" colspan="3">
						  	<select class="selectMail" name="QNA_CATEGORY" id="QNA_CATEGORY">
						  		<option value="">선택</option>
						  		<option value="회원">회원</option>
						  		<option value="주문/결제">주문/결제</option>
						  		<option value="상품">상품</option>
						  		<option value="기타">기타</option>
						  	</select>
						  </td>
						</tr>
						<tr>
						  <th scope="row">아이디</th>
						  <td class="last">${sessionScope.MEMBER_ID}</td>
						  <th scope="row">등록일자</th>
						  <td class="last"><fmt:formatDate value="${toDay}" pattern="yy-MM-dd" /></td>
						</tr>
						<tr>
						  <th scope="row"><label for="ask_tit"><span class="mustTxt">*</span> 제목</label></th>
						  <td class="last" colspan="3"><input type="text" name="QNA_TITLE" id="QNA_TITLE" class="ipt2 w840" maxlength="50"></td>
						</tr>
						<tr>
						  <th scope="row"><label for="text_contents"><span class="mustTxt">*</span> 내용</label></th>
						  <td class="last" colspan="3"><textarea name="QNA_CNT" id="QNA_CNT"></textarea></td>
						</tr>
						<tr>
						  <th scope="row">파일첨부</th>
						  <td class="last" colspan="3">
						  	<input type="file" name="QNA_FILE" id="QNA_FILE" style="display:none;">
						  	<input type="text" class="ipt2 w313" placeholder="jpg, jpeg, gif, png, pdf, bmp (10MB 제한)" name="fileName" id="fileName" readonly="">
						  	<a href="" class="btnSmlBgGray1 w108" id="btnFileSearch">찾아보기</a>
						  </td>
						</tr>
					  </tbody>
					</table>
					<!-- /end:ask_register -->
					<!-- start:agree -->
					<div class="personInfoAgree">
						<p class="tit">개인정보 수집 및 이용동의</p>
						<table summary="개인정보 수집 및 이용동의 리스트" class="tbA">
					  	<caption>개인정보 수집 및 이용동의 리스트</caption>
						  <colgroup>
							<col width="20%">
							<col width="20%">
							<col width="60%">
						   </colgroup>
						  <tbody>
							<tr>
							  <th class="alignC">이용목적</th>
							  <th class="alignC">항목</th>
							  <th class="alignC last">보유 및 이용기간</th>
							</tr>
							<tr>
							  <td class="alignC">1:1 문의내용 답변 알림</td>
							  <td class="alignC">이메일주소</td>
							  <td class="last">
								상담 종료 후 1개월 보유 후 지체 없이 복구 불가능한 방법으로 안전하게 파기합니다. 
								단, 볍령상 보관의무가 있는 경우에는 해당 법령이 정하는 기간 동안 안전하게 별도 보관 후 지체 없이 파기합니다.<br><br>
								<ul>
									<li>- 계약 또는 정약철회 등에 관한 기록 : 5년 (전자상거래법)</li>
									<li>- 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래법)</li>
									<li>- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래법)</li>
									<li></li>
								</ul>
								<br>동의 거부권 및 불이익 : 고객님께서는 동의를 거부하실 권리가 있습니다. 
								단, 필수항목에 대한 동의 거부 시에는 1:1문의 상담 결과의 회신을 받으실 수 없습니다.
								 선택항목은 동의를 거부하셔도 이용에 제한이 없습니다.
							  </td>
							</tr>
						  </tbody>
						</table>
						<p class="checkBox">
							<input type="checkbox" name="agree" id="agree"> 개인정보 수집 및 이용에 동의합니다. <em>(필수)</em>
						</p>
					</div>
					<!-- /end:agree -->
					<div>
<input type="hidden" name="_csrf" value="e0ef7837-d63b-4b18-972c-b1c3423cef88">
</div></form>

					<!-- start:btn -->
					<div class="paginate">
						<a href="/giftcon/mypage/qnalist.conn" class="btnBigBgGray1 w180 mr10">취소</a>
						<a href="#" onclick="javascript:goRegist(); return false;" class="btnBigBgBlue2 w180">등록</a>
					</div>
					<!-- /end:btn -->
				</div>
			</div>
			<!-- /end:contents -->
		</div>
	</div>
<script type="text/javascript">
$(document).ready(function() {
	"use strict";
	
	$('#btnFileSearch').click(function(event) {
		event.preventDefault();
		$('#qnaFileInfo').click();
	});
	
	$('#qnaFileInfo').change(function(event) {
		$('#fileName').val($(this).val());
	});
	
});
function goRegist(pageNo) {

	if( $('#QNA_CATEGORY').val() == '' ) {
		alert("문의유형을 선택해주세요.");
		$('#QNA_CATEGORY').focus();
		return;
	}
	
	if( $('#QNA_TITLE').val() == '' ) {
		alert("제목을 입력해주세요.");
		$('#QNA_TITLE').focus();
		return;
	}
	
	if( $('#question').val() == '' ) {
		alert("내용을 입력해주세요.");
		$('#question').focus();
		return;
	}
	
	if( !$("#agree").is(":checked") ) {
		alert("개인정보 수집 및 이용에 동의해 주세요.");
		$('#agree').focus();
		return;
	}
	
	if (confirm("1:1 문의를 등록하시겠습니까?")) {
		var formData = new FormData(document.getElementById('qnaFrm'));
	    $.ajax({
	        url: "/giftcon/mypage/qna/insert.conn",
	    	type: 'POST',
	        data:  formData,
			dataType : 'text',
	    	contentType: false,
	        processData:false,
		    success: function(resultCd) {
			alert('1:1 문의가 등록되었습니다.');
				location.href="/giftcon/mypage/qnalist.conn";
		    },
			error: function(data) {
				alert('1:1 문의 등록을 실패했습니다.\n다시 시도해주세요.');
				return false;
			}
		});
	}
}
</script>
</body>
</html>
<%@include file="../module/footer.jsp"%>