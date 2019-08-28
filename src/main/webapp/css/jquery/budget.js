
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
		alert("ad");
		$("#price").val($("#budget").val() /  $("#people").val()) ;
	}
	


/*
function quickMenuToggle() {
	if( $('#quickMenuButton').hasClass("btnQuickClose") ) {
		$('#quickArea').css('width', '6px');
		$('#quickMenuButton').removeClass("btnQuickClose");
		$('#quickMenuButton').addClass("btnQuickOpen");
	} else {
		$('#quickArea').css('width', '106px');
		$('#quickMenuButton').removeClass("btnQuickOpen");
		$('#quickMenuButton').addClass("btnQuickClose");
		
	}
}
*/

