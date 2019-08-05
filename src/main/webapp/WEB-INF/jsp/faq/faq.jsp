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
<script type="text/javascript" src="/giftcon/css/gnb.js"></script>
<script>
function refreshFAQ(){
	location.href="/giftcon/faq.conn";
}

function FAQCategory(num){ 
		
	var num = num;
	var faq_ca = null;

	if (num == 1) {
		faq_ca = $("#FAQ_CATEGORY1").val();
	} else if (num == 2) {
		faq_ca = $("#FAQ_CATEGORY2").val();
	} else if (num == 3) {
		faq_ca = $("#FAQ_CATEGORY3").val();
	} else if (num == 4) {
		faq_ca = $("#FAQ_CATEGORY4").val();
	} else if (num == 5) {
		faq_ca = $("#FAQ_CATEGORY5").val();
	}
	
	
	var data = {
        		"FAQ_CATEGORY" :  faq_ca	
        	}

        	jQuery.ajaxSettings.traditional = true;
        	
        	$.ajax({
        		type: "POST",
        		url: "<c:url value='/FAQCategory.conn'/>",
        		dateType:"json",
        		data : data,
        		contentType : "application/json;charset=UTF-8",
        		
        		success:function(data){
        			alert("성공");
        		},

        		error : function(jqXHR, textStatus, errorThrown) {
        			alert("오류가 발생하였습니다.");
        		}
        	});
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
	<li><a href="/giftcon/FAQ.conn" class="on"><span class="icoFaq"></span><em>FAQ</em></a></li>
	<%if(session.getAttribute("MEMBER_ID") != null){ %>
	<li><a href="/giftcon/mypage/qna/insertform.conn" class=""><span class="icoOneAsk"></span><em>1:1문의</em></a></li>
	<%}else{ %>
	<li><a href="/giftcon/loginForm.conn"><span class="icoOneAsk"></span><em>1:1문의</em></a></li>
	<%} %>
</ul>
					<!-- /end:csTab -->
					
					<form id="bbsFrm" name="bbsFrm" action="/giftcon/FAQ.conn" method="GET">
						<input type="hidden" name="pageNum">
						<input type="hidden" name="contentType" value="">
					<!-- start:askCategory -->
						<div class="askCategory">
							<a href="#" onClick="refreshFAQ()">전체</a>
							<a href="#" id="FAQ_CATEGORY1" onClick="FAQCategory(1)">회원</a>
							<a href="#" id="FAQ_CATEGORY2" onClick="FAQCategory(2)">상품</a>
							<a href="#" id="FAQ_CATEGORY3" onClick="FAQCategory(3)">주문</a>
							<a href="#" id="FAQ_CATEGORY4" onClick="FAQCategory(4)">환불</a>
							<a href="#" id="FAQ_CATEGORY5" onClick="FAQCategory(5)">기타</a>
						</div>
					<div class="faqSearch" align="right">
							<font size="4">제목 검색 &nbsp;</font>
							<input class="ipt4 w220" type="text" name="searchkeyword" id="searchkeyword" />
							<input class="ipt3" type="submit" value="검색" />
						</div>
					<!-- /end:askCategory -->
					<!-- start:ask_list -->
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
</div></form>
					
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