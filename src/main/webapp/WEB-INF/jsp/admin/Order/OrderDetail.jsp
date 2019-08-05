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
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 주문 상품수 : 1${totalCount}</div>
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
								<c:url var="viewURL" value="" >
									<c:param name="order_num" value="${orderList.order_num }" />
								</c:url>									
									<tr class="gradeA even" role="row" height="30px">
										<td style="text-align:center;vertical-align:middle;">1</td>	<!-- 주문번호 -->							
										<td style="text-align:center;vertical-align:middle;"><img src="/giftcon/images/don.jpg"></td>	<!-- 상품이미지 -->
										<td style="text-align:center;vertical-align:middle;">돈까스</td>	<!-- 상품이름 -->
										<td style="text-align:center;vertical-align:middle;">돼지 등심으로 만든 돈까스</td>	<!-- 상품간략설명 -->
										<td style="text-align:center;vertical-align:middle;">kkkknum1</td>	<!-- 회원ID -->
										<td style="text-align:center;vertical-align:middle;">3</td>	<!-- 상품구매수량 -->
										<td style="text-align:center;vertical-align:middle;">5000원<%-- <fmt:formatNumber value="${orderList.order_sum_money}" type="number"/> --%></td>	<!-- 상품1개당금액 -->
										<td style="text-align:center;vertical-align:middle;">15000원</td>
										<td style="text-align:center;vertical-align:middle;">결제 완료</td>		<!-- 주문상태 -->
										<td style="text-align:center;vertical-align:middle;">2019.07.24<%-- <fmt:formatDate value="${orderList.order_date}" pattern="YY.MM.dd HH:mm" /> --%></td><!-- 주문일자 -->									
										<td style="text-align:center;vertical-align:middle;">	<!-- 관리 -->
											<a href="${viewURL}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png"></a>&nbsp;&nbsp;
										<c:url var="viewURL2" value="orderadmindelete.dog" >
											<c:param name="order_num" value="${orderList.order_num }" />
										</c:url>	
										 <a href="${viewURL2}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()"></a></td>									
									</tr>
								</c:forEach>
									<tr>
										<td colspan="11" style="text-align:right; vertical-align:middle;"><h2>총 합계금액 : 15000원</h2></td>
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
</html>