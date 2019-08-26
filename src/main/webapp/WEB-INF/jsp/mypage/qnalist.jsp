<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
div.paginate > div > a.disabled:hover {border: 1px solid #ddd;}
</style>

<title>title</title>

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
	<li><a href="/giftcon/faq.conn"><span class="icoFaq"></span><em>FAQ</em></a></li>
	<li><a href="/giftcon/mypage/qna/insertform.conn" class="on"><span class="icoOneAsk"></span><em>1:1문의</em></a></li>
</ul>
<ul class="subTab">
	<li><a href="/giftcon/mypage/qna/insertform.conn">문의등록</a></li>
	<li><a href="/giftcon/mypage/qnalist.conn" class="on">나의 문의 이력</a></li>
</ul>
					<!-- /end:csTab -->

					<form id="qnaFrm" name="qnaFrm" action="/giftcon/mypage/qnalist.conn" method="GET">
						<input type="hidden" name="pageNum">
					<!-- start:ask_list -->
					<div class="askList">
						<ul class="myAskList">
							<c:forEach items="${qnaList}" var="list">
							<li id="list_0">
								<input type="hidden" id="QNA_NUM" name="QNA_NUM" value="${list.QNA_NUM}">
								<a class="qnaTit">
									<span class="txtCate">${list.QNA_CATEGORY}</span>
									<span class="tit">${list.QNA_TITLE} </span>
									<span class="txtState">
									<c:if test="${list.QNA_CHECK.equals('Y')}">
										답변완료
										<em>상세내용보기</em>
									</c:if>
									<c:if test="${list.QNA_CHECK.equals('N')}">
										답변대기중
										<em>상세내용보기</em>
									</c:if>
									</span>
								</a>
								<div id="view_0" class="view" style="display: none;">
									<p class="txtDate">등록 [${list.QNA_DATE}]</p>
									<p class="txtCont">${list.QNA_CNT}</p>
									<c:if test="${list.QNA_CHECK.equals('Y')}">
									<div class="answerBox">
										<span class="icoAnswer">답변 [${list.QNA_REDATE}]</span>
										<p>${list.QNA_COMMENT}</p>
									</div>
									</c:if>
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

$(".askList .myAskList .qnaTit").click(function(){
	$(".askList .myAskList .view").slideUp(200);
	if ($(this).next().css("display")=="block") return;
	$(this).next().slideDown(200);
});
</script>
</body>
</html>
<%@include file="../module/footer.jsp"%>