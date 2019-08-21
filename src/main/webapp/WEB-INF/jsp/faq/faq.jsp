<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head><style>
div.paginate > div > a.disabled:hover {border: 1px solid #ddd;}
</style>

<title>title</title>


<!-- jQuery -->
<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/giftcon/css/common.js"></script>
<script type="text/javascript" src="/giftcon/css/jquery/swiper.min.js"></script>
<script type="text/javascript" src="/giftcon/css/gnb.js"></script>
<script>
function refreshFAQ(){
	location.href="/giftcon/faq.conn";
}
</script>
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
	<li><a href="/giftcon/notice.conn"><span class="icoNotice"></span><em>공지사항</em></a></li>
	<li><a href="/giftcon/faq.conn" class="on"><span class="icoFaq"></span><em>FAQ</em></a></li>
	<%if(session.getAttribute("MEMBER_ID") != null){ %>
	<li><a href="/giftcon/mypage/qna/insertform.conn" class=""><span class="icoOneAsk"></span><em>1:1문의</em></a></li>
	<%}else{ %>
	<li><a href="/giftcon/loginForm.conn"><span class="icoOneAsk"></span><em>1:1문의</em></a></li>
	<%} %>
</ul>
					<!-- /end:csTab -->
					
					<form id="bbsFrm" name="bbsFrm" action="/giftcon/faq.conn" method="GET">
						<input type="hidden" id="currentPage" name="currentPage">
					<!-- start:askCategory -->
					<c:url var="viewURL1" value="faq.conn"><c:param name="category" value="1" /></c:url>
					<c:url var="viewURL2" value="faq.conn"><c:param name="category" value="2" /></c:url>
					<c:url var="viewURL3" value="faq.conn"><c:param name="category" value="3" /></c:url>
					<c:url var="viewURL4" value="faq.conn"><c:param name="category" value="4" /></c:url>
					<c:url var="viewURL5" value="faq.conn"><c:param name="category" value="5" /></c:url>
					<div class="askCategory">
						<a href="#" onClick="refreshFAQ()">전체</a>
						<a href="${viewURL1}" id="FAQ_CATEGORY1">회원</a>
						<a href="${viewURL2}" id="FAQ_CATEGORY2">상품</a>
						<a href="${viewURL3}" id="FAQ_CATEGORY3">주문</a>
						<a href="${viewURL4}" id="FAQ_CATEGORY4">환불</a>
						<a href="${viewURL5}" id="FAQ_CATEGORY5">기타</a>
					</div>
					<div class="subTit">
						<div class="noticeSearch" align="right">
							<input class="ipt4 w220" type="text" name="SearchKeyword" id="SearchKeyword" />
							<input class="ipt3" type="submit" value="검색" />
						</div>
					</div>
					</form>
				
					<!-- /end:askCategory -->
					<!-- start:ask_list -->
					<div class="askList">
						<p>조회내역 총 ${totalCount}건</p>			
					</div>
					<div class="askList">
						<ul class="myAskList">
							<c:forEach items="${faqlist}" var="row">
							<li class="list_0">
								<input type="hidden" id="FAQ_NUM" name="FAQ_NUM" value="${row.FAQ_NUM}">
								<input type="hidden" id="FAQ_CATEGORY" value="${row.FAQ_CATEGORY}">
								<a class="faqTit">
									<span class="icoQuestion"></span>
									<span class="faqTit">${row.FAQ_TITLE}</span>
									<span class="icoView"><em>상세내용보기</em></span>
								</a>
								<div id="view_0" class="faqView" style="display: none;">
									<span class="icoAnswer">답변</span>
									<p>${row.FAQ_CNT}</p>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>
					<!-- /end:ask_list -->
					<div>
					</div>
					
					<div class="paginate" align="center"><ul class="numList">${pagingHtml}</ul></div>
				</div>
			</div>
			<!-- /end:contents -->
		</div>
	</div>
	<!-- /end:container -->
</div>
<!--/end:wrap -->
<script type="text/javascript">
$(".askList .myAskList .faqTit").click(function(){
	$(".askList .myAskList .faqView").slideUp(200);
	if ($(this).next().css("display")=="block") return;
	$(this).next().slideDown(200);
});
</script>
</body>
</html>
<%@include file="../module/footer.jsp"%>