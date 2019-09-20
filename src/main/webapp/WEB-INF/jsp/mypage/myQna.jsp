<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
div.paginate>div>a.disabled:hover {
	border: 1px solid #ddd;
}
</style>

<title>title</title>
<body>

	<!-- start:contents -->
	<div class="subWrap">
		<div class="subLayout">
			<!-- start:csTab -->
			<ul class="subTab">
				<li><a href="/giftcon/mypage.conn">회원정보수정</a></li>
				<li><a href="/giftcon/userPwChgForm.conn">비밀번호변경</a></li>
				<li><a href="/giftcon/myQnalist.conn" class="on">나의 문의 이력</a></li>
				<li><a href="/giftcon/orderList.conn">주문 내역</a></li>
				
			</ul>
			<!-- /end:csTab -->
			<form id="qnaFrm" name="qnaFrm" action="/bbs/qnaList.do" method="GET">

				<!-- start:ask_list -->
				<div class="askList">
					<p>조회내역 총${totalCount} 건</p>


					<ul class="myAskList">
						<c:forEach items="${qnaList}" var="list">
							<li id="list_${list.QNA_NUM}"><a href="#"
								onclick="javascript:goDetail(${list.QNA_NUM}); return false;"> 
							<span class="txtCate">${list.QNA_CATEGORY}</span> 
								<span class="tit">${list.QNA_TITLE}</span>
									<span class="txtState"> 
							<c:if test="${list.QNA_CHECK.equals('Y')}">
                              	답변완료
                           </c:if> 
                           <c:if test="${list.QNA_CHECK.equals('N')}">
                              	답변대기중
                           </c:if> 
                           	<em>상세내용보기</em>
								</span>
							</a>
								<div id="view_${list.QNA_NUM}" class="view" style="display: none;">
									<p class="txtDate">[등록일] >${list.QNA_DATE}</p>
									<pre class="txtCont">${list.QNA_CNT}</pre>

									<div class="answerBox">
										<span class="icoAnswer">답변</span>
										<pre>[답변] : ${list.QNA_COMMENT}</pre>
									</div>

								</div></li>
						</c:forEach>

					</ul>



				</div>
				<!-- /end:ask_list -->
				<div></div>
			</form>

			<div class="paginate">
				<ul class="numList">${pagingHtml}</ul>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		/* $(".askList .myAskList .qnaTit").click(function(){
		 $(".askList .myAskList .View").slideUp(200);
		 if ($(this).next().css("display")=="block") return;
		 $(this).next().slideDown(200);
		
		 }); */

		function goDetail(index) {
			var listId = "#list_" + index;
			var viewId = "#view_" + index;
			var objId = "#obj_" + index;

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