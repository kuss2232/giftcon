<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include-header.jspf" %>
<!DOCTYPE html>
<html>
<body>
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">주문상세</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
			주문 상세 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 주문 상품수 : ${OrderCount}</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table  table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row" style="vertical-align:middle;">
										<th style="width: 7%; text-align:center;vertical-align:middle;">주문번호</th>
										<th style="width: 10%; text-align:center;vertical-align:middle;">상품 이미지</th>						
										<th style="width: 10%; text-align:center;vertical-align:middle;">상품이름</th>
										<th style="width: 15%; text-align:center;vertical-align:middle;">간략설명</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">회원ID</th>
										<th style="width: 5%; text-align:center;vertical-align:middle;">수량</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">금액</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">합계</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">주문상태</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">주문일자</th>								
										<th style="width: 13%; text-align:center;vertical-align:middle;">관리</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="orderList"  items="${orderList}" varStatus="stat">		
									<tr class="gradeA even" role="row" height="30px">
										<td style="text-align:center;vertical-align:middle;">${orderList.ORDER_NUM}</td>	<!-- 주문번호 -->							
										<td style="text-align:center;vertical-align:middle;"><img src="/giftcon/resources/images/don.jpg"></td>	<!-- 상품이미지 -->
										<td style="text-align:center;vertical-align:middle;">${orderList.GOODS_NAME}</td>	<!-- 상품이름 -->
										<td style="text-align:center;vertical-align:middle;">${orderList.GOODS_SIMPLE}</td>	<!-- 상품간략설명 -->
										<td style="text-align:center;vertical-align:middle;">${orderList.MEMBER_ID}</td>	<!-- 회원ID -->
										<td style="text-align:center;vertical-align:middle;">${orderList.ORDER_AMOUNT}</td>	<!-- 상품구매수량 -->
										<td style="text-align:center;vertical-align:middle;">${orderList.GOODS_PRICE}원<%-- <fmt:formatNumber value="${orderList.order_sum_money}" type="number"/> --%></td>	<!-- 상품1개당금액 -->
										<td style="text-align:center;vertical-align:middle;">${orderList.GOODS_PRICE * orderList.ORDER_AMOUNT}원</td>
										<c:set var="SUM" value="${SUM + (orderList.GOODS_PRICE * orderList.ORDER_AMOUNT)}" />
										<td style="text-align:center;vertical-align:middle;"><c:if test="${orderList.ORDER_PAYMENT eq 'N'}">입금 대기</c:if><c:if test="${orderList.ORDER_PAYMENT eq 'Y'}">결제 완료</c:if></td>		<!-- 주문상태 -->
										<td style="text-align:center;vertical-align:middle;">${orderList.ORDER_DATE}<%-- <fmt:formatDate value="${orderList.order_date}" pattern="YY.MM.dd HH:mm" /> --%></td><!-- 주문일자 -->									
										<td style="text-align:center;vertical-align:middle;">	<!-- 관리 -->
											<input type="hidden" id="ORDER_NUM" value="${orderList.ORDER_NUM}"/>
											<input type="hidden" id="GOODS_NUM" value="${orderList.GOODS_NUM}"/>
										<a href="#"><input type="image" id="deleteBtn" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png"></a></td>									
									</tr>
								</c:forEach>
									<tr>
										<td colspan="11" style="text-align:right; vertical-align:middle;"><h2>총 합계금액 : ${SUM}원</h2></td>
								</tbody>
							</table>
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
$(document).ready(function() {
	$("#deleteBtn").on("click", function(e) {
		e.preventDefault();
		fn_delete();
	});

});
function fn_delete()
{
	var ORDER_NUM = $("#ORDER_NUM").val();
	var GOODS_NUM = $("#GOODS_NUM").val();
	$.ajax({
		type : 'POST',
		url : '/giftcon/orderDelete.conn',
		data : {"ORDER_NUM":ORDER_NUM,
				"GOODS_NUM":GOODS_NUM},
		
		success : function(result) {
				alert("삭제되었습니다.");
				location.href="/giftcon/adminOrderDetail.conn?ORDER_NUM="+ORDER_NUM;
		},
		error:function(request, error) {
			alert("서버오류");
			// error 발생 이유를 알려준다.
			/* alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); */
		}
	})
}
</script>
</html>