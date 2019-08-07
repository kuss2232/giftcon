<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">

<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<script src="/giftcon/js/common.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
/* function setCategory(categoryNo) {
	var form = document.brandForm;
	form.pageNo.value = 1;
	form.categoryNo.value = categoryNo;
	form.action = "/giftcon/adminCategory.conn";
	form.submit();
}

	
 $(document).ready(function(){
			$("#aaa").on("click", function(e){
				e.preventDefault();
				fn_login();
			});

		});  */
		
	function fn_login(num){
		var comSubmit = new ComSubmit("brandForm");
			comSubmit.setUrl("/giftcon/adminCategory.conn");
			comSubmit.addParam("BIG_CATEGORY",num);
			comSubmit.submit();
		}
</script>
</head>
<body>
<form id="brandForm" name="brandForm" action="/bigCategoryList.conn">
	<div class="subWrap">
		<div class="subLayout">
			<!-- start:sub_title -->
			<div class="subTit">브랜드 카테고리</div>
			<!-- /end:sub_title -->
			<!-- start:product_search -->
			<div class="searchCate2 mt6">
				<ul>
					<li><a href="javascript:fn_login('전체')" ><font size="3px" >전체</font>
					</a></li>
					<li><a href="javascript:fn_login('치킨/피자/버거')"><font size="3px">치킨/피자/버거</font>
					</a></li>
					<li><a href="javascript:fn_login('아이스크림')"> <font size="3px">아이스크림</font>
					</a></li>
					<li><a href="javascript:fn_login('떡/베이커리')"><font size="3px">떡/베이커리</font>
					</a></li>
					<li><a href="javascript:fn_login('편의점/마트')"> <font size="3px" >편의점/마트</font>
					</a></li>
					<li class="last"><a href="javascript:fn_login('외식/레스토랑')"><font size="3px" >외식/레스토랑</font>
					</a></li>

				</ul>
			</div>
			<!-- /end:product_search -->
			<!-- start:sub_title -->
			<div class="subTit1 mt44">
				<span class="resultTxt">상품<em></em></span>
			</div>
			<!-- /end:sub_title -->
			<!-- start:search_product -->
			<div class="brandLogo">


				<ul class="brandList" id="brandListAppend">
				<c:forEach items="${list}" var="list">
					<li class="last"><a
						href="/goods/mainShop.do?searchBrandNoList=71"><img
							src="/giftcon/images/category/${list.CATEGORY_IMG}" alt=""><span>${list.SMALL_CATEGORY}</span></a>
					</li>
				</c:forEach>
				</ul>

			</div>
			<!-- /end:search_product -->
		</div>
	</div>
</form>
</body>
</html>