<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include-header.jspf" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/bootstrapadmin.min.css">
<body>
<div class="row" align="center">    
	<h1 class="page-header">주문목록</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         주문목록페이지 검색, 수정, 삭제 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
							<a href="/giftcon/adminOrder.conn"><button type="button" class="btn btn-outline btn-default">전체</button></a>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--주문상태--</option>
								<option value ="/giftcon/adminOrder.conn?isSearch=N">입금대기</option>
								<option value ="/giftcon/adminOrder.conn?isSearch=Y">구매완료</option>
								<option value ="/giftcon/adminOrder.conn?isSearch=E">사용완료</option>
							</select>													
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 주문수 : ${ORDER_COUNT}</div>
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
										<th style="width: 7%; text-align:center;vertical-align:middle;">주문번호</th>
										<th style="width: 10%; text-align:center;vertical-align:middle;">상품 이미지</th>						
										<th style="width: 23%; text-align:center;vertical-align:middle;">상품이름</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">회원ID</th>
										<th style="width: 5%; text-align:center;vertical-align:middle;">수량
										<th style="width: 8%; text-align:center;vertical-align:middle;">주문금액합계</th>
										<th style="width: 15%; text-align:center;vertical-align:middle;">주문상태</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">주문일자</th>								
										<th style="width: 10%; text-align:center;vertical-align:middle;">관리</th>
									</tr>
								</thead>
								<tbody>
								<c:set var="NUM" value="0" />
								<c:forEach var="orderList"  items="${orderList}">	
									<c:if test="${NUM ne orderList.ORDER_NUM}">
										<c:set var="NUM" value="${orderList.ORDER_NUM}"/>
									<tr class="gradeA even" role="row" height="30px">
										<c:url var="Detail" value="/adminOrderDetail.conn" >
											<c:param name="ORDER_NUM" value="${orderList.ORDER_NUM }" />
										</c:url>
										
										<td style="text-align:center;vertical-align:middle;">
											<input type="hidden" name="order_num" value="${orderList.ORDER_NUM}"/>
										${orderList.ORDER_NUM}</td>	<!-- 주문번호 -->
										<td style="text-align:center;vertical-align:middle;"><a href="${Detail}"><img src="/giftcon/resources/images/처갓집.jpg"></a></td>	<!-- 상품이미지 -->
										<td style="text-align:center;vertical-align:middle;"><a href="${Detail}">${orderList.GOODS_NAME}<c:if test="${orderList.COUNTS > 1}">외 ${orderList.COUNTS-1}개</c:if></a></td>	<!-- 상품이름 -->
										<td style="text-align:center;vertical-align:middle;">${orderList.MEMBER_ID}</td>	<!-- 회원ID -->
										<td style="text-align:center;vertical-align:middle;">${orderList.ORDER_AMOUNT_SUM}</td>	<!-- 수량 -->
										<td style="text-align:center;vertical-align:middle;">${orderList.ORDER_PAY_SUM}</td>	<!-- 주문금액합계 -->
										<td style="text-align:center;vertical-align:middle;"><c:if test="${orderList.ORDER_PAYMENT eq 'N'}">입금 대기</c:if><c:if test="${orderList.ORDER_PAYMENT eq 'Y'}">결제 완료</c:if>
											<select class="form-control" id="select${orderList.ORDER_NUM}" onchange="fn_PAY_Modify(${orderList.ORDER_NUM})">
												<option value ="">상태 변경</option>
												<option value ="N">입금대기</option>
												<option value ="Y">결제완료</option>
												<!-- <option value ="/giftcon/adminOrder.conn?isSearch=E">사용완료</option> -->
											</select>
										</td>		<!-- 주문상태 -->
										<td style="text-align:center;vertical-align:middle;">${orderList.ORDER_DATE}</td><!-- 주문일자 -->
										<td style="text-align:center;vertical-align:middle;">	<!-- 관리 -->
										<c:url var="viewURL" value="/giftcon/orderNumDelete.conn" >
										</c:url>
										 <a href="#" onclick="fn_delete(${orderList.ORDER_NUM})"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png"></a></td>									
									</tr>
									</c:if>
								</c:forEach>
								
								<!--  등록된 상품이 없을때 -->
									<c:if test="${ORDER_COUNT le 0}">
										<tr><td colspan="9" style="text-align:center;">등록된 상품이 없습니다</td></tr>
									</c:if> 
								</tbody>
							</table>
							</form>
						</div>
					</div>
					<div class="paging">
						${pagingHtml}
					</div>
					<div class="row">
						<div style="text-align:center;">
							<div id="dataTables-example_filter" class="dataTables_filter">
								<form action="/giftcon/adminOrder.conn" method="POST">
									<label>회원 ID 검색 : </label>
									<input type="hidden" id="SearchNum" name="SearchNum" value="id">
									<input class="form-control" type="text" name="isSearch" id="isSearch"/>
									<span>
									<button type="submit" class="btn default">검색</button>
									</span>
								</form>
							</div>							
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
function fn_delete(num)
{
	$.ajax({
		type : "POST",
		url : "/giftcon/orderNumDelete.conn",
		data : {"ORDER_NUM":num},
		error : function(erromr) {
			alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
		},
		success : function() {
			alert("삭제되었습니다.");
			location.href="/giftcon/adminOrder.conn";
		}
	})
}

function fn_PAY_Modify(num)
{
	var select = $("#select"+num).val();
	
	$.ajax({
		type : "POST",
		url : "/giftcon/adminOrderPAY.conn",
		data : {"ORDER_NUM":num,
				"ORDER_PAYMENT": select},
		error : function(erromr) {
			alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
		},
		success : function() {
			alert("변경되었습니다.");
			location.href="/giftcon/adminOrder.conn";
		}
	})
}
</script>
</html>