<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/swiper.min.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
</head>
<body>
<div id="container">
<div class="contents">
	<div class="subWrap">
		<div class="subLayout">
			<!-- start:sub_title -->
			<div class="subTit">상품상세</div>
			<!-- /end:sub_title -->
			<!-- start:product_info -->
			<div class="prodInfoArea">
				<div class="productImg">
					<p class="icoFlag">
					</p>
					<img src="/giftcon/images/email.png<%-- ${goodsDetail.GOODS_IMG2} --%>" alt="">
				</div>
				<div class="infoBox">
					<p class="prodName">[${goodsDetail.SMALL_CATEGORY}] ${goodsDetail.GOODS_NAME}</p>
					<div class="infoTxt">
						<span class="txtHalf"> <span class="tit">유효기간 : </span> <span
							class="alignRight">91일</span>
						</span> <span class="txtHalf"> <span class="tit">교환처 : </span> <span
							class="alignRight">${goodsDetail.SMALL_CATEGORY}</span>
						</span>
					</div>
					<div class="infoTxt">
						<span class="txtHalf"> <span class="tit">상품가격 : </span> <span
							class="alignRight">${goodsDetail.GOODS_PRICE}원</span>
						</span> <span class="txtHalf"> <span class="tit point7">구매가격
								: </span>
						<c:if test="${!empty goodsDetail.GOODS_DCPRICE}"><!-- 할인할 때 -->
						<span class="alignRight point7">${goodsDetail.GOODS_DCPRICE}원</span>
						</c:if>
						<c:if test="${empty goodsDetail.GOODS_DCPRICE}"><!-- 할인 X -->
						<span class="alignRight point7">${goodsDetail.GOODS_PRICE}원</span>
						</c:if>
						</span>
					</div>
				<div class="subInfoBox"></div>

					<p class="btnProd">

						<a href="javascript:insertCart(10091);"
							class="btnBigLineBlack2 w213 mr10"
							onmousedown="_AceTM.AddCart(1);">장바구니 담기</a> 
							<a href="/giftcon/orderForm.conn?GOODS_NUM=${goodsDetail.GOODS_NUM}" class="btnBigBgBlue8 w213"onmousedown="_AceTM.BuyNow(1);">주문하기</a>

					</p>
				</div>
			</div>
			<!-- /end:product_info -->

			<!-- start:product_detail -->
			<div class="expArea">

				<div class="expBox">
					<span class="tit">[상품명]</span>
					<p class="txt">${goodsDetail.GOODS_NAME}</p>
				</div>
				<div class="expBox mb40">
					<span class="tit">[상품설명]</span>
					<p class="txt">${goodsDetail.GOODS_DETAIL}</p>
					<c:if test="${!empty goodsDetail.GOODS_IMG3}">
					<img src="${goodsDetail.GOODS_IMG3}" alt="">
					</c:if>
				</div>
				<table class="tbG">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tbody>
						<tr>
							<th>발행자</th>
							<td>(주)다우기술</td>
						</tr>
						<tr>
							<th>유효기간</th>
							<td>물품제공형&amp;금액형 : (91일)</td>
						</tr>
						<tr>
							<th>이용조건 및 유의사항</th>
							<td>
								<ul>
									<li>[유의사항]<br>- 본 상품권은 매장 방문 시 사용 가능합니다.(딜리버리 불가)<br>-
										본 상품권에 기재된 메뉴로만 교환이 가능합니다.<br>- 본 상품권에 기재된 메뉴의 타 행사와 중복
										적용이 불가합니다. <br>- OK캐쉬백 적립 불가합니다.<br>- 현금영수증 요청 시 발행
										가능합니다.<br>- 본 상품권은 매장 운영 시간에 사용 가능합니다.<br>- 환불, 교환,
										승인 문의는 상품권구매처에 문의 부탁드립니다.(T.1599-6567)<br>- 다량의 상품권 사용 시
										사전에 사용 매장으로 문의 부탁 드립니다.<br>- 일부 매장은 행사에서 제외될 수 있습니다.
									</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th>환불조건 및 방법</th>
							<td>유효기간 이내에는 결제금액의 100%에 대해 구매취소 및 환불이 가능하며 최초 유효기간 만료시점
								이후에는 결제금액의 90%에 대해 환불요청이 가능합니다.<br>구매취소 및 환불신청은
								고객센터(1599-3785)로 문의 바랍니다.
							</td>
						</tr>
						<tr>
							<th>지급보증여부</th>
							<td>본 도넛북 모바일 교환권은 지급보증 및 피해보상보험 계약없이 ㈜다우기술의 신용으로 발행합니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- /end:product_detail -->
			<!-- start:tab_recommend -->
			<!-- <ul class="subTab">
				<li><a href="javascript:viewTab('priceTab');" id="priceOnOff"
					class="on">추천상품</a></li>
			</ul>
			/end:tab_recommend
			<div id="priceTab">
				<div class="todayprodArea">
					<div class="fixBox bestBox">
						<ul class="prodList mbNone">

							<li>
								<div class="prodBox">
									<p class="icoFlag">


										<span class="discountF">12%</span>

									</p>
									<span class="prodImg"><a
										href="/goods/goodsDetail.do?goodsNo=14317"><img
											src="/3N1DATA01/donutbook/goods/a8yx4qtoq0ky.jpg" alt=""></a></span>
									<span class="brand">[롯데리아]</span> <span class="prodName">한우불고기</span>
									<span class="price"> <span class="prodPrice">6,900원</span>
									</span>
									<ul class="sendList">
										<li><a href="/order/order.do?goodsNo=14317" class="first"><span
												class="nowSend"></span><span class="sendTxt">바로발송</span></a></li>
										<li><a href="javascript:insertCart(14317);"
											onmousedown="javascript:AEC_F_D('14317', 'i', 1);"><span
												class="cartPut"></span><span class="sendTxt">장바구니</span></a></li>
									</ul>
								</div>
							</li>

							<li>
								<div class="prodBox">
									<p class="icoFlag">


										<span class="discountF">12%</span>

									</p>
									<span class="prodImg"><a
										href="/goods/goodsDetail.do?goodsNo=14318"><img
											src="/3N1DATA01/donutbook/goods/1nubr6oo6b0o.jpg" alt=""></a></span>
									<span class="brand">[롯데리아]</span> <span class="prodName">한우불고기
										세트</span> <span class="price"> <span class="prodPrice">8,600원</span>
									</span>
									<ul class="sendList">
										<li><a href="/order/order.do?goodsNo=14318" class="first"><span
												class="nowSend"></span><span class="sendTxt">바로발송</span></a></li>
										<li><a href="javascript:insertCart(14318);"
											onmousedown="javascript:AEC_F_D('14318', 'i', 1);"><span
												class="cartPut"></span><span class="sendTxt">장바구니</span></a></li>
									</ul>
								</div>
							</li>

							<li>
								<div class="prodBox">
									<p class="icoFlag">


										<span class="discountF">12%</span>

									</p>
									<span class="prodImg"><a
										href="/goods/goodsDetail.do?goodsNo=14872"><img
											src="/3N1DATA01/donutbook/goods/ppf3gginnhcg.jpg" alt=""></a></span>
									<span class="brand">[파리바게뜨]</span> <span class="prodName">달달한디저트세트(치즈조각케이크+아다지오
										오리지널(아이스아메리카노)1잔)</span> <span class="price"> <span
										class="prodPrice">7,200원</span>
									</span>
									<ul class="sendList">
										<li><a href="/order/order.do?goodsNo=14872" class="first"><span
												class="nowSend"></span><span class="sendTxt">바로발송</span></a></li>
										<li><a href="javascript:insertCart(14872);"
											onmousedown="javascript:AEC_F_D('14872', 'i', 1);"><span
												class="cartPut"></span><span class="sendTxt">장바구니</span></a></li>
									</ul>
								</div>
							</li>

							<li class="last">
								<div class="prodBox">
									<p class="icoFlag">


										<span class="discountF">12%</span>

									</p>
									<span class="prodImg"><a
										href="/goods/goodsDetail.do?goodsNo=14357"><img
											src="/3N1DATA01/donutbook/goods/2jciws7ehfl8.jpg" alt=""></a></span>
									<span class="brand">[엔제리너스]</span> <span class="prodName">그린티
										스노우(R)</span> <span class="price"> <span class="prodPrice">6,900원</span>
									</span>
									<ul class="sendList">
										<li><a href="/order/order.do?goodsNo=14357" class="first"><span
												class="nowSend"></span><span class="sendTxt">바로발송</span></a></li>
										<li><a href="javascript:insertCart(14357);"
											onmousedown="javascript:AEC_F_D('14357', 'i', 1);"><span
												class="cartPut"></span><span class="sendTxt">장바구니</span></a></li>
									</ul>
								</div>
							</li>

						</ul>
					</div>
				</div>
			</div>
			<div id="categoryTab" style="display: none;">
				<div class="todayprodArea">
					<div class="fixBox bestBox">
						<ul class="prodList mbNone">

							<li>
								<div class="prodBox">
									<p class="icoFlag">


										<span class="discountF">12%</span>

									</p>
									<span class="prodImg"><a
										href="/goods/goodsDetail.do?goodsNo=11071"><img
											src="/3N1DATA01/donutbook/goods/xxn726b7a7nr.jpg" alt=""></a></span>
									<span class="brand">[페리카나치킨]</span> <span class="prodName">[페리카나]반반치킨+미니핫도그
										2개+음료</span> <span class="price"> <span class="prodPrice">19,000원</span>
									</span>
									<ul class="sendList">
										<li><a href="/order/order.do?goodsNo=11071" class="first"><span
												class="nowSend"></span><span class="sendTxt">바로발송</span></a></li>
										<li><a href="javascript:insertCart(11071);"><span
												class="cartPut"></span><span class="sendTxt">장바구니</span></a></li>
									</ul>
								</div>
							</li>

							<li>
								<div class="prodBox">
									<p class="icoFlag">


										<span class="discountF">12%</span>

									</p>
									<span class="prodImg"><a
										href="/goods/goodsDetail.do?goodsNo=14304"><img
											src="/3N1DATA01/donutbook/goods/ma6rimhkh648.jpg" alt=""></a></span>
									<span class="brand">[롯데리아]</span> <span class="prodName">아메리카노</span>
									<span class="price"> <span class="prodPrice">2,000원</span>
									</span>
									<ul class="sendList">
										<li><a href="/order/order.do?goodsNo=14304" class="first"><span
												class="nowSend"></span><span class="sendTxt">바로발송</span></a></li>
										<li><a href="javascript:insertCart(14304);"><span
												class="cartPut"></span><span class="sendTxt">장바구니</span></a></li>
									</ul>
								</div>
							</li>

							<li>
								<div class="prodBox">
									<p class="icoFlag">


										<span class="discountF">12%</span>

									</p>
									<span class="prodImg"><a
										href="/goods/goodsDetail.do?goodsNo=12400"><img
											src="/3N1DATA01/donutbook/goods/udcsar0nh6a0.JPG" alt=""></a></span>
									<span class="brand">[BBQ]</span> <span class="prodName">마라핫치킨(한마리)+콜라1.25L</span>
									<span class="price"> <span class="prodPrice">20,900원</span>
									</span>
									<ul class="sendList">
										<li><a href="/order/order.do?goodsNo=12400" class="first"><span
												class="nowSend"></span><span class="sendTxt">바로발송</span></a></li>
										<li><a href="javascript:insertCart(12400);"><span
												class="cartPut"></span><span class="sendTxt">장바구니</span></a></li>
									</ul>
								</div>
							</li>

							<li class="last">
								<div class="prodBox">
									<p class="icoFlag">


										<span class="discountF">12%</span>

									</p>
									<span class="prodImg"><a
										href="/goods/goodsDetail.do?goodsNo=12690"><img
											src="/3N1DATA01/donutbook/goods/5kml2wzlpogj.png" alt=""></a></span>
									<span class="brand">[교촌치킨]</span> <span class="prodName">허니오리지날+웨지감자+콜라1.25L</span>
									<span class="price"> <span class="prodPrice">20,000원</span>
									</span>
									<ul class="sendList">
										<li><a href="/order/order.do?goodsNo=12690" class="first"><span
												class="nowSend"></span><span class="sendTxt">바로발송</span></a></li>
										<li><a href="javascript:insertCart(12690);"><span
												class="cartPut"></span><span class="sendTxt">장바구니</span></a></li>
									</ul>
								</div>
							</li>

						</ul>
					</div>
				</div>
			</div> -->

			<div class="subTit">상품 후기</div>
			<div>
			
			<c:forEach var="review"  items="${reviewDetail}">	
			
			<tr>
				<td>작성자: ${review.MEMBER_NUM}</td>
				<td>후기 : ${review.REVIEW_CNT}</td>
			</tr>
			</c:forEach>
			</div>
			

			<div class="askList">
				<form name="frm">
					<input type="hidden" id="goodsNum" name="goodsNum" value="${goodsDetail.GOODS_NUM}" />
					<input type="hidden" id="memberId" name="memberNum" value="${MEMBER_ID}" />
					<textarea id="content" name="content" rows="10" cols="100" class="commentForm"></textarea>
					
					<input type=button style="width:45pt;height:30pt; color:BLACK" id="btn" value="댓글작성" class="commentBt" />
				</form>
				
				
				<!-- <ul class="myAskList">
					<li id="list_0" class=""><a href="#" onclick="javascript:goDetail(0, 298); return false;"> 
					<span class="icoQuestion"></span> 
					<span class="faqTit">등급별 혜택은 어떻게 적용되나요?</span>
					<span class="icoView"><em>상세내용보기</em></span>
					</a>
						<div id="view_0" class="faqView" style="display: none;">
							<span class="icoAnswer">답변</span>
							<p>1회 발송금액 및 월 누적 사용금액의 기준에 따라 익월 1일 09시에 등급이 새롭게 산정됩니다. 등급에
								따라 1%~최대 12%까지 추가 도넛 적립이 가능하며, 상세 내용은 [도넛북소개]&gt;[등급별혜택소개] 페이지에서
								확인하실 수 있습니다.</p>
						</div></li>

				</ul> -->
			</div>
			


		</div>
	</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#btn").on("click", function(e) {
		e.preventDefault();
		fn_insertReview();
	});
});
function fn_insertReview(){
	var cnt = $("#content").val();
	$.ajax({
		type:"POST",
		data:{"REVIEW_CNT":cnt,
				"GOODS_NUM": $("#goodsNum").val(),
				"MEMBER_ID": $("#memberId").val(),
				"REVIEW_GRADE":5},
        url:"/giftcon/goods/reviewInsert.conn",
       	error : function(erromr) {
			alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
		},
		success : function() {
			alert("등록");
		}
	});

}
	
function goDetail(index, bbsNo) {
	
	var listId = "#list_"+index;
	var viewId = "#view_"+index;
	if ($(listId).attr('class') == 'on') {
		$(listId).attr('class', '');
		$(viewId).css('display', 'none');
	} else {
		
		// 조회수 업데이트
		$.ajax({
			type:"POST",
			data:{bbsNo:bbsNo},
	        url:"/bbs/updateBbsHits.do",
	        dataType:"text"
		});

		$(listId).attr('class', 'on');
		$(viewId).css('display', 'table');
	}
}
</script>
</body>
</html>
<%@include file="../module/footer.jsp"%>