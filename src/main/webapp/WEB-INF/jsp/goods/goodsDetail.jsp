<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<img src="${goodsDetail.GOODS_IMG2}" alt="">
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
							onmousedown="_AceTM.AddCart(1);">장바구니 담기</a> <a
							href="/order/order.do?goodsNo=10091" class="btnBigBgBlue8 w213"
							onmousedown="_AceTM.BuyNow(1);">주문하기</a>

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

			<div class="subTit">상품 후기</div>

			<div class="askList">
				<ul class="myAskList">

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

				</ul>
			</div>
			


		</div>
	</div>
</div>
</div>
<script type="text/javascript">
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