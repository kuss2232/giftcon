<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css"> 
<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<script src="/giftcon/css/common.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	"use strict";
	
	$.form = $("#budgetForm");
	
	$("[name='btnOpenBudgetPop']").click(function(event) {
		event.preventDefault();
		$.blockUI({ message : $('#budgetSearch'), css : { border: 'none', textAlign: 'left' } });
	});

	$(".btnClose").click(function(event) {
		event.preventDefault();
		onSetInit();
		$.unblockUI();
	});
	
	$.form.find("#btnSearch").on('click', function(event) {
		event.preventDefault();
		
		if($.form.find("#price").val() == null || $.form.find("#price").val() == '' || $.form.find("#price").val() == 0) {
			alert("예상 상품단가가 설정되지 않았습니다.\n예산을 계산해 주세요.");
			$.form.find('#budget').focus();
			return;
		}
		
		getGoodsList();
		
	});
	
	$.form.find("[name='btnOrderSearch']").on('click', function(event) {
		event.preventDefault();
		
		if($.form.find("#price").val() == null || $.form.find("#price").val() == '' || $.form.find("#price").val() == 0) {
			alert("예상 상품단가가 설정되지 않았습니다.\n예산을 계산해 주세요.");
			$.form.find('#budget').focus();
			return;
		}
		
		var orderType = 'OD0';
		
		if($(this).is(':contains("카테고리")')) {
			orderType += "1";
		} else if($(this).is(':contains("브랜드")')) {
			orderType += "2";
		} else if($(this).is(':contains("상품명")')) {
			orderType += "3";
		} else if($(this).is(':contains("판매가격")')) {
			orderType += "4";
		}
		
		if($(this).find("span").attr("class") == "icoDown") {
			orderType += "1";
			$(this).find("span").attr("class", "icoUp");
		} else {
			orderType += "2";
			$(this).find("span").attr("class", "icoDown");
		}
		
		$.form.find("[name='orderType']").val(orderType);
		getGoodsList();
		
	});
	
	$.form.find("#btnGoodsDetail").on('click', function(event) {
		event.preventDefault();
		var goodsNo = $.form.find("input[name='goodsNo']:checked").val();
		if(goodsNo == null || goodsNo == '' || goodsNo == 0) {
			alert("상세보기 상품을 선택해 주세요.");
			return;
		}
		document.location.href = "/goods/goodsDetail.do?goodsNo="+goodsNo;
	});
	
	$.form.find("#btnOrder").on('click', function(event) {
		event.preventDefault();
		var goodsNo = $.form.find("input[name='goodsNo']:checked").val();
		if(goodsNo == null || goodsNo == '' || goodsNo == 0) {
			alert("발송 상품을 선택해 주세요.");
			return;
		}
		document.location.href = "/order/order.do?goodsNo="+goodsNo;
	});
	
	$.form.find("#budget").on('input propertychange', onSetPrice);
	$.form.find("#people").on('input propertychange', onSetPrice);
});

function getGoodsList() {
	
	$.form = $("#budgetForm");
	
	$.ajax({
		type:"POST",
		data:$("#budgetForm").serialize(),
		url:"/popup/budgetSearch.do",
		dataType:"json",
		success:function(data) {

			var trHTML = '';
			var totalCount = 0;
			$.form.find("#tbBudgetSearchResult").find("tbody:last").empty();
			
			if (data.resCd == 'SUCCESS') {
				
				totalCount = data.resObj.length; 
				
				if (totalCount == 0) {
					trHTML += '<tr><td class="alignC1" colspan="5">조회된 상품이 없습니다.</td></tr>';
				} else {
					$.each(data.resObj, function (i, item) {
						trHTML += '<tr>';
						trHTML += '<td><input type="radio" name="goodsNo" value="'+item.goodsNo+'"></td>';
						trHTML += '<td>'+item.categoryName+'</td>';
						trHTML += '<td>'+item.brandName+'</td>';
						trHTML += '<td>'+item.goodsName+'</td>';
						trHTML += '<td class="last">'+cutNumber(item.salePrice)+'</td>';
						trHTML += '<tr>';
					});
					
					$.form.find(".popupBtns").show();
				}

			} else {
				trHTML += '<tr><td class="alignC1" colspan="5">조회된 상품이 없습니다.</td></tr>';
				$.form.find(".popupBtns").hide();
			}

			$.form.find(".calculateResultTxt").html("총 "+cutNumber(totalCount)+"건");
			$.form.find(".calculateResultTxt").show();
			
			$.form.find("#tbBudgetSearchResult").find("tbody:last").append(trHTML);
		},
		error:function(data) {
			alert("다시 시도해 주세요.");
			return;
		}
	});
}

function onSetInit() {
	
	$.form = $("#budgetForm");
	
	$.form.find("#budget").val('');
	$.form.find("#people").val('');
	$.form.find("#price").val('');
	
	$.form.find("[name='orderType']").val();
	$.form.find("[name='priceSearchStart']").val();
	$.form.find("[name='priceSearchEnd']").val();
	
	$.form.find("#tbBudgetSearchResult").find("tbody:last").empty();
	$.form.find("#tbBudgetSearchResult").find("tbody:last").append('<tr><td class="alignC1" colspan="5">조회된 상품이 없습니다.</td></tr>');

	$.form.find(".calculateResultTxt").hide();
	$.form.find(".popupBtns").hide();
}

function onSetPrice(event) {
	
	$.form = $("#budgetForm");
	
	var budget = isNaN(parseInt($.form.find('#budget').val().replace(/,/g, ''))) ? 0 : parseInt($.form.find('#budget').val().replace(/,/g, ''));
	if(budget > 100000000) {
		$.form.find("#budget").val(cutNumber(100000000))
	}
	
	var people = isNaN(parseInt($.form.find('#people').val().replace(/,/g, ''))) ? 0 : parseInt($.form.find('#people').val().replace(/,/g, ''));
	if(people > 10000000) {
		$.form.find("#people").val(cutNumber(10000000))
	}
	
	var price = isNaN(parseInt(budget/people)) ? 0 : parseInt(budget/people);
	$.form.find("#price").val(cutNumber(price));
	
	var priceMin = 0;
	var priceMax = 100000;
	
	if(isFinite(price) && price > 0) {
		priceMin = parseInt(price - (price*0.2));
		priceMax = parseInt(price + (price*0.2));
	}
	
	$.form.find("[name='priceSearchStart']").val(priceMin);
	$.form.find("[name='priceSearchEnd']").val(priceMax);
	}


$(document).ready(function() {

	$("a.btnQuickClose").on("click", function(event) {
		event.preventDefault();
		$("#quickArea").toggleClass("off");
	}); 
	
	$('#quickBtnLogout').click(function(event) {
		event.preventDefault();
		$("#quickLogoutFrm").submit();
	});
	
	var arrGoodsNo = new Array();
	var arrGoodsImg = new Array();
	
	if($.cookie("todayGoodsNo") != undefined && $.cookie("todayGoodsImg") != undefined) {
		var arrGoodsNo = $.cookie("todayGoodsNo").split(",");
		var arrGoodsImg = $.cookie("todayGoodsImg").split(",");
		arrGoodsNo.reverse();
		arrGoodsImg.reverse();
	}
	
	//tg :: today goods
	var tgPageNo = 1;
	var tgRowCount = 2;
	var tgTotalCount = (arrGoodsNo.length<1) ? 0 : arrGoodsNo.length-1;
	
	var tgLastPageNo = 0;
	if(tgTotalCount % tgRowCount == 0) {
		tgLastPageNo = tgTotalCount / tgRowCount;
	} else {
		tgLastPageNo = parseInt(tgTotalCount / tgRowCount) + 1;
	}
	
	var setTodayGoods = function() {
		
		var liHTML = '';

		$("#todayGoodsList").empty();
		if(tgTotalCount > 0) {
			var tgStIdx = tgRowCount*(tgPageNo-1);
			var tgEnIdx = tgStIdx+(tgRowCount-1);
			if(tgEnIdx >= tgTotalCount) tgEnIdx = tgTotalCount - 1;
			
			for(var i=tgStIdx; i<=tgEnIdx; i++) {
				liHTML += '<li><a href="/goods/goodsDetail.do?goodsNo='+arrGoodsNo[i]+'"><img src="'+arrGoodsImg[i]+'" alt=""></a></li>';
			}
		}
		$("#todayGoodsList").append(liHTML);
	}
	
	$("#btnTodayGoodsPrev").click(function(event) {
		event.preventDefault();
		
		tgPageNo -= 1;
		if(tgPageNo < 1) tgPageNo = 1;

		setTodayGoods();
	});
	
	$("#btnTodayGoodsNext").click(function(event) {
		event.preventDefault();
	
		tgPageNo += 1;
		if(tgPageNo > tgLastPageNo) tgPageNo = tgLastPageNo;

		setTodayGoods();
	});
	
	$("#todayGoodsCnt").html(tgTotalCount);
	setTodayGoods();

	$(".btnTop").click(function(event) {
		event.preventDefault();
		$("body,html").animate({scrollTop: 0}, 600);
	});
	
	$("#myGrade").click(function(event) {
		event.preventDefault();
		location.href="/mypage/userPwdCheck.do";
	});
	
	$("#myGradeType").click(function(event) {
		event.preventDefault();
		location.href="/intro/gradeBenefit.do";
	});

});

function calcul() {
	if(document.getElementById("budget").value && document.getElementById("people").value){
		  document.getElementById('price').value =parseInt(document.getElementById("budget").value) /  parseInt(document.getElementById('people').value);
		 }
} 

</script>
<head>



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
					<input onkeyup='calcul()' type="text" class="ipt2 w146" id="budget" style="text-align:right;"> 원
				</div>
				<span class="icoDivision"></span>
				<div class="calBox">
					<p class="tBox">
						<span class="icoPeople"></span>
						<span class="titTxt">발송 할 인원 수</span>
					</p>
					<input onkeyup='calcul()' type="text" class="ipt2 w146" id="people" style="text-align:right;"> 명
				</div>
				<span class="icoEquals"></span>
				<div class="calBox last">
					<p class="tBox">
						<span class="icoPrice"></span>
						<span class="titTxt">예상되는 상품단가</span>
					</p>
					<input type="text" class="ipt2 w146 " id="price" style="text-align:right;" readonly=""> 원
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
