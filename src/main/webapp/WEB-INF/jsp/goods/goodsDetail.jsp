<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@include file="../module/header.jsp"%>
<style>
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

.starL{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 15px;
  height: 15px;
 display: inline-block;
 }
 
 .starL.on{background-position:0 0;}
</style>

<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/swiper.min.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/bootstrapadmin.min.css">

<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<script src="/giftcon/js/common.js"></script>
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
					<img src="/giftcon/resources/file/goodsFile/${goodsDetail.GOODS_IMG}" alt="">
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
					<%if(session.getAttribute("MEMBER_ID") != null){ %>
						<a href="javascript:insertCart(10091);"
							class="btnBigLineBlack2 w213 mr10"
							onclick="addCart(${goodsDetail.GOODS_NUM})">장바구니 담기</a>
					<%
					} else {%>
						<a href="/giftcon/loginForm.conn"
							class="btnBigLineBlack2 w213 mr10">장바구니 담기</a>
					<%} %>
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
					<span class="tit">[간단설명]</span>
					<p class="txt">${goodsDetail.GOODS_SIMPLE}</p>
				</div>
				<div class="expBox mb40">
					<span class="tit">[상품설명]</span>
					<p class="txt">${goodsDetail.GOODS_DETAIL}</p>
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
							<td>본 쉐어콘 모바일 교환권은 지급보증 및 피해보상보험 계약없이 ㈜다우기술의 신용으로 발행합니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- /end:product_detail -->

			<div class="subTit">상품 후기</div>
	  <form name="frm">
	<div class="starRev"  onclick="Click()">
  			<span class="starR " id="1" >1</span>
  			<span class="starR" id="2">2</span>
  			<span class="starR"  id="3">3</span>
 			<span class="starR"  id="4">4</span>
  			<span class="starR"  id="5">5</span>
		</br></br>
		</div>
      
               <input type="hidden" id="goodsNum" name="goodsNum" value="${goodsDetail.GOODS_NUM}" />
               <input type="hidden" id="memberId" name="memberNum" value="${MEMBER_ID}" />
               <input type="hidden" id="memberNum" value="${MEMBER_NUM}"/>
               
            <div>               
               <textarea id="content" name="content" rows="10" cols="100" style="height:100px;width:980px; resize: none;" class="commentForm"></textarea>

               <input type=button style="margin-bottom:94.5px; width:70px;height:100px; color:BLACK" id="btn" value="댓글작성" class="commentBt" />
            </div>
            </form>
        	
			<c:if test="${MEMBER_ADMIN == 0}" >
			<table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 6%; text-align:center;">글번호</th>
										<th style="width: 11%; text-align:center;" >작성자</th>
										<th style="width: 35%; text-align:center;">리뷰</th>
										<th style="width: 10%; text-align:center;">작성일</th>
										<th style="width: 10%; text-align:center;">평점</th>
										<th style="width: 10%; text-align:center;">관리</th>
									</tr>
								</thead>
								<tbody>
							
					<form id="f1" >
									<c:forEach var="review" items="${reviewDetail}">
										<tr class="gradeA even" role="row">
											<td style="text-align: center; vertical-align: middle;">${review.REVIEW_NUM}</td>
											<td style="text-align: center; vertical-align: middle;">${review.MEMBER_ID}</td>
											<td style="text-align: center; vertical-align: middle;">${review.REVIEW_CNT}</td>
											<td style="text-align: center; vertical-align: middle;">
													<fmt:formatDate	value="${review.REVIEW_REGDATE}" pattern="YY.MM.dd " /></td>
											<td style="text-align: center; vertical-align: middle;">
											<c:forEach begin="1"  end="${review.REVIEW_GRADE}" >
											<span class="starL on" id="1" ></span></c:forEach></td>
											<td style="text-align: center; vertical-align: middle;">
												<input type="button" value="삭제" onclick="fn_deleteReview(${review.REVIEW_NUM})"/>
											</td>
										</tr>
										</c:forEach>
					</form>
					</td></tr>
										<!-- Q&A가 없을때 -->
								 
								</tbody>
							</table>
			</c:if>
			<c:if test="${MEMBER_ADMIN != 0}" >
			
			<table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 10%; text-align:center;">글번호</th>
										<th style="width: 15%; text-align:center;">작성자</th>
										<th style="width: 50%; text-align:center;">리뷰</th>
										<th style="width: 10%; text-align:center;">작성일</th>
										<th style="width: 20%; text-align:center;">평점</th>
									</tr>
								</thead>
								<tbody>
								
					<form id="f1" >
									<c:forEach var="review" items="${reviewDetail}">
										<tr class="gradeA even" role="row">
											<td style="text-align: center; vertical-align: middle;">${review.REVIEW_NUM}</td>
											<td style="text-align: center; vertical-align: middle;">${review.MEMBER_ID}</td>
											<td style="text-align: center; vertical-align: middle;">${review.REVIEW_CNT}</td>
											<td style="text-align: center; vertical-align: middle;">
													<fmt:formatDate	value="${review.REVIEW_REGDATE}" pattern="YY.MM.dd" /></td>
											<td style="text-align: center; vertical-align: middle;">
											<c:forEach begin="1"  end="${review.REVIEW_GRADE}" >
											<span class="starL on" id="1" ></span></c:forEach></td>
										</tr>
										</c:forEach>
					</form>
					</td></tr>
										<!-- Q&A가 없을때 -->
								 
								</tbody>
							</table>
			</c:if>
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

var review = 0;

$('.starRev span').click(function(){
	
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  review = $(this).attr('id');
	  	  return false;
	
	});

function fn_insertReview(){

	var cnt = $("#content").val();
	$.ajax({
		type:"POST",
		data:{"REVIEW_CNT":cnt,
				"GOODS_NUM": $("#goodsNum").val(),
				"MEMBER_ID": $("#memberId").val(),
				"REVIEW_GRADE": review
			},
				
        url:"/giftcon/goods/reviewInsert.conn",
       	
        error : function(erromr) {
			alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
		},
		success : function() {
			alert("등록");
			location.reload();
		}
	});
}
function fn_deleteReview(num){
	$.ajax({
		type:"POST",
		data:{"REVIEW_NUM": num},
        url:"/giftcon/deleteReivew.conn",
        error:function(request,status,error){
        	alert("서버오류");
            //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
           },
		success : function() {
			alert("삭제완료");
			location.reload();
		}
	});
}
function addCart(num)
{
	$.ajax({
		type:"POST",
		data:{"CART_AMOUNT": 1,
				"GOODS_NUM": num,
				"MEMBER_NUM": $("#memberNum").val()
		},
        url:"/giftcon/cart/addCart.conn",
       	error : function(erromr) {
			alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
		},
		success : function() {
			alert("장바구니에 등록되었습니다.");
			location.href="/giftcon/main.conn";
		}
	});
}

</script>
<!-- <a href="/giftcon/chart.conn">asd</a> -->
<!-- <img src="/giftcon/images/word232.png"/> -->
</body>
</html>
<%@include file="../module/footer.jsp"%>