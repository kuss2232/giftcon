<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include-header.jspf" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/bootstrapadmin.min.css">
<body>
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">장바구니목록</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         장바구니페이지 수정, 삭제 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 상품수 : ${totalCount}</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
						<form id="frm" name="frm" method="POST">
							<table
								class="table  table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row" style="vertical-align:middle;">
										<th style="width: 7%; text-align:center;vertical-align:middle;">상품번호</th>
										<th style="width: 20%; text-align:center;vertical-align:middle;">상품 이미지</th>						
										<th style="width: 23%; text-align:center;vertical-align:middle;">상품이름</th>
										<th style="width: 20%; text-align:center;vertical-align:middle;">수량</th>
										<th style="width: 20%; text-align:center;vertical-align:middle;">상품금액</th>
										<th style="width: *; text-align:center;vertical-align:middle;">관리</th>
									</tr>
								</thead>
								<tbody>
								<c:set var="amount" value="0"/>
								<c:set var="price" value="0"/>
								<c:forEach var="cartList"  items="${cartList}">	
									<tr class="gradeA even" role="row" height="30px">
										<c:url var="Detail" value="/goods/Detail.conn" >
											<c:param name="GOODS_NUM" value="${cartList.GOODS_NUM}" />
										</c:url>
										
										<td style="text-align:center;vertical-align:middle;">
											<input type="hidden" name="order_num" value="${cartList.GOODS_NUM}"/>
										${cartList.GOODS_NUM}</td>	<!-- 상품번호 -->
										<td style="text-align:center;vertical-align:middle;"><a href="${Detail}"><img src="/giftcon/resources/images/don.jpg"></a></td>	<!-- 상품이미지 -->
										<td style="text-align:center;vertical-align:middle;"><a href="${Detail}">${cartList.GOODS_NAME}</a></td>	<!-- 상품이름 -->
										<td style="text-align:center;vertical-align:middle;">${cartList.CART_AMOUNT}개<c:set var="amount" value="${amount + cartList.CART_AMOUNT}"/>	<!-- 수량 -->
											<select class="form-control" id="select${cartList.CART_NUM}" onchange="fn_AmountModify(${cartList.CART_NUM})">
												<option value ="">수량 변경</option>
												<c:forEach var="i" begin="0" end="${cartList.GOODS_AMOUNT}">
													<option value="${i}">${i}개</option>
												</c:forEach>
											</select>

										</td>		<!-- 주문상태 -->
										<td style="text-align:center;vertical-align:middle;">
											<c:if test="${empty cartList.GOODS_DCPRICE}">${cartList.GOODS_PRICE}<c:set var="price" value="${cartList.GOODS_PRICE * cartList.CART_AMOUNT + price}"/></c:if>
											<c:if test="${not empty cartList.GOODS_DCPRICE}">
												<c:if test="${cartList.GOODS_DCPRICE ne 0}">${cartList.GOODS_DCPRICE}<c:set var="price" value="${cartList.GOODS_DCPRICE * cartList.CART_AMOUNT + price}"/></c:if>
												<c:if test="${cartList.GOODS_DCPRICE eq 0}">${cartList.GOODS_PRICE}<c:set var="price" value="${cartList.GOODS_PRICE * cartList.CART_AMOUNT + price}"/></c:if></c:if>원</td> <!-- 상품 금액 -->
										<td style="text-align:center;vertical-align:middle;">	<!-- 관리 -->
										<c:url var="viewURL" value="/giftcon/orderNumDelete.conn" >
										</c:url>
										 <a href="#" onclick="fn_delete(${cartList.CART_NUM})"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png"></a></td>									
									</tr>
								</c:forEach>
								<!--  등록된 상품이 없을때 -->
									<c:if test="${totalCount le 0}">
										<tr><td colspan="9" style="text-align:center;">등록된 상품이 없습니다</td></tr>
									</c:if> 
								</tbody>
							</table>
							</form>
						</div>
						<div align="right">
							<table>
								<tr>
									<td align="right"><h2>상품 갯수 : ${amount}개 </h2>
								</tr>
								<tr >
									<td><h1>상품 총 가격 : ${price}원 </h1></td>
								</tr>
							</table>
							<input type="button" class="form-control" id="btn" value="전체 계산하기" onclick="fn_orderAll()">
						</div>
					</div>
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>
</body>
<script type="text/javascript">
function fn_AmountModify(num){
	var amount = $("#select"+num).val();
	$.ajax({
		type : "POST",
		url : "/giftcon/cart/cartAmountModify.conn",
		data : {"CART_NUM":num,
				"CART_AMOUNT":amount},
		error : function(erromr) {
			alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
		},
		success : function() {
			alert("수정되었습니다.");
			location.href="/giftcon/cart/cartlist.conn";
		}
	})
}
function fn_orderAll()
{
	$.ajax({
		type : "POST",
		url : "/giftcon/orderAll.conn",
		data : {"MEMBER_NUM":num},
		error : function(erromr) {
			alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
		},
		success : function() {
			alert("결제되었습니다.");
			location.href="/giftcon/orderForm.conn";
		}
	})
}

function fn_delete(num)
{
	$.ajax({
		type : "POST",
		url : "/giftcon/cart/cartDelete.conn",
		data : {"CART_NUM":num},
		error : function(erromr) {
			alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
		},
		success : function() {
			alert("삭제되었습니다.");
			location.href="/giftcon/cart/cartlist.conn";
		}
	})
}

</script>
</html>