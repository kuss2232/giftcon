<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>title</title>
<style>
div.paging > div > a.disabled:hover {border: 1px solid #ddd;}
</style>
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/swiper.min.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">

</head>
<body>

<!-- start:wrap -->
<div id="wrap">
		
	<!-- start:container -->
	<div id="container">
		<div class="contents">

			<!-- start:contents -->
			<div class="subWrap">
				<div class="subLayout">
					<!-- start:csTab -->
<ul class="csTab mb70">
	<li><a href="/giftcon/notice.conn" class="on"><span class="icoNotice"></span><em>공지사항</em></a></li>
	<li><a href="/giftcon/FAQ.conn"><span class="icoFaq"></span><em>FAQ</em></a></li>
	<li><a href="/giftcon/mypage/qna/insertform.conn"><span class="icoOneAsk"></span><em>1:1문의</em></a></li>
</ul>
					<!-- /end:csTab -->
					<!-- start:sub_title -->
					<form id="bbsFrm" name="bbsFrm" action="/giftcon/notice.conn" method="GET">
						<input type="hidden" name="currentPage">
					<div class="subTit">[공지사항] 쉐어콘 서비스의 새로운 소식을 알려드립니다!
						<div class="noticeSearch" align="right">
								<select class="btn"name="SearchNum" id="SearchNum">
									<option value="1">제목</option>
									<option value="2">내용</option>
								</select>
							<input class="ipt4 w220" type="text" name="SearchKeyword" id="SearchKeyword" />
							<input class="ipt3" type="submit" value="검색" />
						</div>
					</div>
					<div>
</div></form>
					<!-- /end:sub_title -->
					<!-- start:contents -->
					
					<table summary="공지사항 리스트" class="tbI">
						<colgroup>
							<col width="10%">
							<col width="60%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<tbody>
							<tr>
								<th>NO</th>
								<th>제목</th>
								<th>작성일</th>
								<th class="last">조회수</th>
							</tr>
                 				<c:forEach items="${noticeList}" var="row">
                 				<c:url var="viewURL" value="noticeDetail.conn">
                       				<c:param name="NOTICE_NUM" value="${row.NOTICE_NUM}" />
                    			</c:url>
								<tr>
									<td>${row.NOTICE_NUM}</td>
									<td class="alignL">
										<a href="${viewURL}">${row.NOTICE_TITLE}</a>
									</td>
									<td><fmt:formatDate value="${row.NOTICE_REGDATE}" pattern="yyyy-MM-dd" /></td>
									<td class="last">
									${row.NOTICE_HITCOUNT}</td>
								</tr>
								</c:forEach>
						</tbody>
					</table>
					<!-- /end:contents -->
					<div class="paging"><div class="page"><a class="disabled">${pagingHtml}</a></div></div>
				</div>
			</div>
			<!-- /end:contents -->
		</div>
	</div>
	<!-- /end:container -->

</div>
<!--/end:wrap -->
<script type="text/javascript">
$(document).ready(function() {
	$("a[name='title']").on("click", function(e) { //상세보기
		e.preventDefault();
		fn_Detail($(this));
	});
});
function fn_Detail(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/noticedetail.conn' />");
	comSubmit.addParam("NOTICE_NUM", obj.parent().find("#NOTICE_NUM")
			.val());
	comSubmit.submit();
}
function goList(pageNum) {
	var form = document.bbsFrm;
	form.pageNum.value = pageNum;
	form.target = "_self";
	form.action = "/giftcon/notice.conn";
	form.submit();
}
</script>
</body>
</html>
<%@include file="../module/footer.jsp"%>