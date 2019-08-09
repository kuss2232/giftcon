<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link href="/giftcon/css/jquery/bootstrapadmin.min.css" rel="stylesheet" type="text/css">
<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<script src="/giftcon/js/common.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">리뷰리스트</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         [리뷰 관리페이지] 리뷰를 검색, 삭제하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
							<a href="/giftcon/adminReviewList.conn"><button type="button" class="btn btn-outline btn-default">전체</button></a>
<!-- 							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--카테고리--</option>
								<option value ="/MODA/goods/goodsList?searchNum=2&isSearch=OUTER">OUTER</option>
								<option value ="/MODA/goods/goodsList?searchNum=2&isSearch=TOP">TOP</option>
								<option value ="/MODA/goods/goodsList?searchNum=2&isSearch=PANTS">PANTS</option>
								<option value ="/MODA/goods/goodsList?searchNum=2&isSearch=SHOES">SHOES</option>
								<option value ="/MODA/goods/goodsList?searchNum=2&isSearch=ACC">ACC</option>
							</select>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--상품구분--</option>
								<option value ="/MODA/goods/goodsList?searchNum=3&isSearch=0">판매중</option>
								<option value ="/MODA/goods/goodsList?searchNum=4&isSearch=">품절상품</option>
								<option value ="/MODA/goods/goodsList?searchNum=3&isSearch=1">비활성화</option>
							</select>			
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--상품정렬--</option>
								<option value ="/MODA/goods/goodsList?searchNum=5&isSearch=GOODS_AMOUNT">판매수량순</option>
								<option value ="/MODA/goods/goodsList?searchNum=6&isSearch=GOODS_COUNT">조회순</option>
							</select> -->											
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 상품수 : ${count}</div>
						</div>
						
					</div>
					<form id="frm">
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table  table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row" style="vertical-align:middle;">
										<th style="width: 5%; text-align:center;vertical-align:middle;">상품번호</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">상품 사진</th>										
										<th style="width: 8%; text-align:center;vertical-align:middle;">상품명</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">가격</th>
										<th style="width: 35%; text-align:center;vertical-align:middle;">리뷰</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">리뷰 사진</th>
										<th style="width: 3%; text-align:center;vertical-align:middle;">평점</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">작성자</th>	
										<th style="width: 10%; text-align:center;vertical-align:middle;">등록일</th>									
										<th style="width: 13%; text-align:center;vertical-align:middle;">관리</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="reviewList"  items="${reviewList}" varStatus="stat">								
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">${reviewList.GOODS_NUM}</td>										
										<td style="text-align:center;vertical-align:middle;"><img src="${reviewList.GOODS_IMG1}" width="60" height="60" alt=""  onerror="this.src='/giftcon/images/XBox.png'" /></td>
										<td style="text-align:center;vertical-align:middle;">${reviewList.GOODS_NAME}</td>
										
										<c:if test="${reviewList.GOODS_DCPRICE != null}">
										<td style="text-align:center;vertical-align:middle;">
												<del><fmt:formatNumber value="${reviewList.GOODS_PRICE}" type="number"/>원<br/></del>
												<fmt:formatNumber value="${reviewList.GOODS_DCPRICE}" type="number"/>원</td>
										</c:if>
										<c:if test="${reviewList.GOODS_DCPRICE == null}">
										<td style="text-align:center;vertical-align:middle;">
												<fmt:formatNumber value="${reviewList.GOODS_PRICE}" type="number"/>원</td>
										</c:if>
										<td style="text-align:center;vertical-align:middle;">${reviewList.REVIEW_CNT}</td>
										<td style="text-align:center;vertical-align:middle;"><img src="/MODA/file/goodsFile/${reviewList.REVIEW_IMG}" width="60" height="60" alt=""  onerror="this.src='/giftcon/images/XBox.png'" /></td>
										<td style="text-align:center;vertical-align:middle;">${reviewList.REVIEW_GRADE}</td>
										<td style="text-align:center;vertical-align:middle;">${reviewList.MEMBER_ID}</td>		
										<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${reviewList.REVIEW_REGDATE}" pattern="YY.MM.dd" /></td>										
										<td style="text-align:center;vertical-align:middle;">
										<!-- <a href="#" ><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png"></a>&nbsp;&nbsp; -->	
										 <a href="#" onclick="reDelete('${reviewList.REVIEW_NUM}')"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()"></a></td>									
									</tr>
								</c:forEach>
								
								<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(reviewList) le 0}"> <!-- reviewList가 0보다 작거나 같으면 -->
										<tr><td colspan="11" style="text-align:center;">등록된 상품이 없습니다</td></tr>
									</c:if> 
								</tbody>
							</table>
						</div>
					</div>
					</form>
					<div class="paging" align="center">
						${pagingHtml}
					</div>
					<div class="row">
							<div style="text-align:center;">
								<div id="dataTables-example_filter" class="dataTables_filter">
									<form action="/giftcon/adminReviewList.conn">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">상품명</option>
										<option value="1">ID</option>
									</select>
										<input class="form-control" type="text" name="SearchKeyword" id="SearchKeyword"/>
										<span>
										<button type="submit" class="btn btn-default">검색</button>
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
<script type="text/javascript">
function reDelete(reNum){
	if(confirm("삭제하시겠습니까?") == true){
		var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("/giftcon/adminReviewDelete.conn");
			comSubmit.addParam("REVIEW_NUM", reNum);
			comSubmit.submit();
	}
}

</script>
</body>
</html>