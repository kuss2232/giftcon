<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

	<style>
	.quick{position:absolute; right:100px; top:280px; width:90px;}
	.quicktop{}
	.quicktop span{display:inline-block; width:88px; height:21px; text-align:center; color:#999999; font-size:12px; border:solid 1px #d9d9d9; margin-bottom:1px; cursor:pointer; background:#fff;}
	.quicktop span.on{display:inline-block; width:88px; height:20px; margin-bottom:11px; text-align:center; color:#fff; background:#333333; font-weight:normal;}

	.quick_in{width:69px;overflow:hidden; border:solid 1px #d9d9d9;margin:0 auto; margin-bottom:10px; background: #fff;}
	.quick_in ul{}
	.quick_in ul li{border-bottom:solid 1px #d9d9d9;}
	.quick_in ul li:last-child, .quick_in ul li.last {border-bottom:none;}
	.quick_in ul li img{width:58px; height:auto; margin-left:5px; padding: 5px 0;}
	.quickbt{}
	.quickbt span{display:inline-block;}
	.quickbt span:first-child{margin-right:9px;}
	.quick_etcbt{display:block; width:88px; height:18px; text-align:center; border:solid 1px #d9d9d9; color:#999999; font-size:12px; padding:3px 0 0 0; margin-bottom:1px; }
	</style>
	
<style>
#floatdiv{z-index:9999;}
#floatdiv {
	position: absolute;
	width: 100px;
	height: 100px;
	left: 50px;
	top: 10px;	
}
</style>

<title>title</title>
<style>
div.paging > div > a.disabled:hover {border: 1px solid #ddd;}
</style>
<script type="text/javascript" src="/giftcon/css/jquery/swiper.min.js"></script>
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
	<li><a href="/giftcon/faq.conn"><span class="icoFaq"></span><em>FAQ</em></a></li>
	<%if(session.getAttribute("MEMBER_ID") != null){ %>
	<li><a href="/giftcon/mypage/qna/insertform.conn" class=""><span class="icoOneAsk"></span><em>1:1문의</em></a></li>
	<%}else{ %>
	<li><a href="/giftcon/loginForm.conn"><span class="icoOneAsk"></span><em>1:1문의</em></a></li>
	<%} %>
</ul>
					<!-- /end:csTab -->
					<!-- start:sub_title -->
					<form id="bbsFrm" name="bbsFrm" action="/giftcon/notice.conn" method="GET">
						<input type="hidden" id="currentPage" name="currentPage">
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
					<div>
					<div class="paginate" align="center"><ul class="numList">${pagingHtml}</ul></div>
					</div>
				</div>
			</div>
			<!-- /end:contents -->
		</div>
	</div>
	<!-- /end:container -->

</div>
<!--/end:wrap -->

<div class="quick" id="floatMenu" style="top: 280px;">

<a href="/giftcon/goods/list.conn" title="추천상품바로가기" style="display:block; margin-bottom:4px;">
	<img src="/giftcon/images/download.jpg" width="100" alt="추천상품보기" style="margin-left: 5px;"><br>
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"value="전체상품" style="font-size:14px; color:black;">
</a>
<a href="/giftcon/cart/cartlist.conn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"value="장바구니" style="font-size:14px; color:black;"></a>

</div>

</body>
</html>
<%@include file="../module/footer.jsp"%>