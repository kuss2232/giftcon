<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
<script type="text/javascript"></script>
</head>
<body>
<div class="subWrap">
	<div class="subLayout">
	
	<div class="subTit">브랜드 카테고리</div>
		<div class="searchCate2 mt6">
			<ul>
				<li><a href="javascript:setCategory(0);" class="on"> <img
						src="/giftcon/images/big/ico_cate1_on.jpg" alt="전체">
				</a></li>
				
				<li><a href="javascript:setCategory(1);" class=""> <img
						src="/giftcon/images/big/ako37p8p00i0.jpg" alt="상품권/금액권">
				</a></li>
				<li><a href="javascript:setCategory(2);" class=""> <img
						src="/giftcon/images/big/gjjl0p6cze8h.jpg" alt="커피/음료">
				</a></li>
				<li><a href="javascript:setCategory(3);" class=""> <img
						src="/giftcon/images/big/gnn08t6enp04.jpg" alt="떡/베이커리">
				</a></li>
				<li><a href="javascript:setCategory(4);" class=""> <img
						src="/giftcon/images/big/gtdp4l4fvwl9.jpg" alt="아이스크림/빙수">
				</a></li>
				<li><a href="javascript:setCategory(5);" class=""> <img
						src="/giftcon/images/big/he4t8c1h5kyy.jpg" alt="편의점/마트">
				</a></li>
				<li><a href="javascript:setCategory(6);" class=""> <img
						src="/giftcon/images/big/km8aom8h5dyh.jpg" alt="외식/레스토랑">
				</a></li>
				<li><a href="javascript:setCategory(7);" class=""> <img
						src="/giftcon/images/big/t7laa794a1dx.jpg" alt="문화/생활/기타">
				</a></li>

			</ul>
		</div>

		<div class="subTit1 mt44">
			<span class="resultTxt">All<em>(55건)</em></span>
		</div>
		
		<div class="brandLogo">
			<ul class="brandList" id="brandListAppend">
			<c:forEach items="${SMALL_CATEGORY}" var="list">
				<li>
					<a href="/giftcon/goods/list.conn?CATEGORY_NUM=${list.CATEGORY_NUM}">
					<img src="${list.CATEGORY_IMG}" alt=""><span>${list.SMALL_CATEGORY}</span></a>
					<input type="hidden" id="CATEGORY_NUM" value="${list.CATEGORY_NUM}"/>
				</li>
			</c:forEach>
			</ul>
		</div>

	
	
	</div>
</div>
</body>
</html>