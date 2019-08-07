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
					<li><a href="javascript:fn_login('전체')" > <img
							src="/images/sub/ico_cate1_on.jpg" alt="전체">
					</a></li>
					<li><a href="javascript:fn_login('치킨')"> <img
							src="/3N1DATA01/donutbook/category/gjjl0p6cze8h.jpg" alt="커피/음료">
					</a></li>
					<li><a href="javascript:setCategory(2);"> <img
							src="/3N1DATA01/donutbook/category/gtdp4l4fvwl9.jpg"
							alt="아이스크림/빙수">
					</a></li>
					<li><a href="javascript:setCategory(3);"> <img
							src="/3N1DATA01/donutbook/category/gnn08t6enp04.jpg" alt="떡/베이커리">
					</a></li>
					<li><a href="javascript:setCategory(5);"> <img
							src="/3N1DATA01/donutbook/category/he4t8c1h5kyy.jpg" alt="편의점/마트">
					</a></li>
					<li class="last"><a href="javascript:setCategory(6);"> <img
							src="/3N1DATA01/donutbook/category/aajjw8f85icn.jpg"
							alt="버거/치킨/피자">
					</a></li>
					<li><a href="javascript:setCategory(7);"> <img
							src="/3N1DATA01/donutbook/category/dd71a2eb12i6.jpg" alt="주유">
					</a></li>
					<li><a href="javascript:setCategory(8);"> <img
							src="/3N1DATA01/donutbook/category/km8aom8h5dyh.jpg"
							alt="외식/레스토랑">
					</a></li>
					<li><a href="javascript:setCategory(9);"> <img
							src="/3N1DATA01/donutbook/category/ebel2o6clwsl.jpg"
							alt="화장품/뷰티/패션">
					</a></li>
					<li><a href="javascript:setCategory(10);"> <img
							src="/3N1DATA01/donutbook/category/t7laa794a1dx.jpg"
							alt="문화/생활/기타">
					</a></li>
					<li><a href="javascript:setCategory(11);"> <img
							src="/3N1DATA01/donutbook/category/ako37p8p00i0.jpg"
							alt="상품권/금액권">
					</a></li>
					<li class="last"><a href="javascript:setCategory(12);"> <img
							src="/3N1DATA01/donutbook/category/2i0r581mdlsk.jpg" alt="배송">
					</a></li>

				</ul>
			</div>
			<!-- /end:product_search -->
			<!-- start:sub_title -->
			<div class="subTit1 mt44">
				<span class="resultTxt">All<em>(56건)</em></span>
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
			<!-- start:btn_more -->

			<div class="btnMore" id="item_more">
				<a href="javascript:viewMore();" class="btnBigLineBlack1 w256">더보기<em>(<span
						id="pageMoreCnt">24</span>/56)
				</em></a>
			</div>

			<!-- /end:btn_more -->
		</div>
	</div>
</form>
</body>
</html>