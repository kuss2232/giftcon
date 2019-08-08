<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../module/header.jsp"%>
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
							onmousedown="_AceTM.AddCart(1);">장바구니 담기</a>
							<a href="/giftcon/orderForm.conn?GOODS_NUM=${goodsDetail.GOODS_NUM}" 
							class="btnBigBgBlue8 w213" onmousedown="_AceTM.BuyNow(1);">주문하기</a>

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
</script>
</body>
</html>
<%@include file="../module/footer.jsp"%>