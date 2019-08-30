<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css"> 
<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<script src="/giftcon/css/common.js"></script>
<script src="/giftcon/css/jquery/budget.js"></script>



<title>예산계산기</title>

</head>

<body>

<div class="popupWrap w700" id="budgetSearch" style="cursor: default;" >
	<!-- start:title -->
	<div class="titArea" align="center">
		<h1 class="tit">예산검색하기</h1>
		<a href="" class="btnClose">닫기</a>
	</div>
	<!--/end:title -->
	<!-- start:contents -->
	<div class="contWrap">

		<form id="budgetForm" name="budgetForm" action="/index.do" method="POST">
			<input type="hidden" name="orderType">
			<input type="hidden" name="priceSearchStart" value="12960">
			<input type="hidden" name="priceSearchEnd" value="19440">
			<input type="hidden" value="${goods.GOODS_NUM}" id="GOODS_NUM">
			
 		<!-- start:calculate -->
		<div class="calculateArea">
			<p class="titTop">
				<span class="tit">예산 검색</span>
				<span class="btnAlign">
					<a href="#" class="btnSmlLineBlue2 w50" onclick="javascript:onSetInit(); return false;">초기화</a>
					<a href="#" class="btnSmlLineBlue2 w50" id="btnSearch">검색</a>
				</span>
			</p>
			<div class="budgetCal">
				<div class="calBox">
					<p class="tBox">
						<span class="icoMoney"></span>
						<span class="titTxt">총 예산은?</span>
					</p>
					<input onchange="calcul()" onkeyup="calcul()" type="number" class="ipt2 w146" id="budget" style="text-align:right;"> 원
				</div>
				<span class="icoDivision"></span>
				<div class="calBox">
					<p class="tBox">
						<span class="icoPeople"></span>
						<span class="titTxt">발송 할 인원 수</span>
					</p>
					<input on onchange="calcul()" onkeyup='calcul()' type="number" class="ipt2 w146" id="people" style="text-align:right;"> 명
				</div>
				<span class="icoEquals"></span>
				<div class="calBox last">
					<p class="tBox">
						<span class="icoPrice"></span>
						<span class="titTxt">예상되는 상품단가</span>
					</p>
					<input type="number" onkeydown="Enter_Check()" class="ipt2 w146 cutNumber"  id="price" style="text-align:right;" readonly=""  > 원
				</div>
			</div>
		</div>
		<!--/end:calculate -->
		<!-- start:search_result -->
		<p class="calculateResultTxt" style="display: none;">총 90건</p>
		<div class="calculateResult">
			<table summary="예산 검색 결과 표" class="tbL" id="tbBudgetSearchResult">
			  <colgroup>
				<col width="60px">
				<col width="139px">
				<col width="110px">
				<col width="232px">
				<col width="94px">
			  </colgroup>
			  <thead>
				<tr>
				  <th>선택</th>
				  <th><a href="#" name="btnOrderSearch">카테고리<span class="icoDown"></span></a></th>
				  <th><a href="#" name="btnOrderSearch">브랜드<span class="icoDown"></span></a></th>
				  <th><a href="#" name="btnOrderSearch">상품명<span class="icoDown"></span></a></th>
				  <th class="last"><a href="#" name="btnOrderSearch">판매가격<span class="icoDown"></span></a></th>
				</tr>
			   </thead>
			   <tbody><tr><td class="alignC1" colspan="5">조회된 상품이 없습니다.</td></tr></tbody>
			</table>
		</div>
		<!--/end:search_result -->
		
		<!-- start:btn -->
		<div class="popupBtns" style="display: none;">
			<a href="" class="btnMidLineBlue2 w154 mr10" id="btnGoodsDetail">선택상품 상세보기</a>
			<a href="" class="btnMidBgBlue2 w108" id="btnOrder">발송하기</a>
		</div>
		<!--/end:btn -->
		<div>
<input type="hidden" name="_csrf" value="2d681deb-020b-4c0f-bc82-6bb7017efa90">
</div></form>
	</div>
	<!--/end:contents -->
</div>
</body>
</html>
