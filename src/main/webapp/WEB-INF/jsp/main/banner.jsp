<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css"> 

<script src="/giftcon/css/jquery/brand_slide.js"></script>
<script src="/giftcon/css/jquery/jquery.form.js"></script>

</head>
<body>

<div class="brandArea mb50">
				<div class="fixBox brandRoll">
					<span class="btn">
						<a href="" class="btnPrevBrand">이전 버튼</a>
						<a href="" class="btnNextBrand">다음 버튼</a>
					</span>
					<div class="brandBox">
						<div class="frame" style= "height:200px;">
							<ul class="brandList" style="margin-left: -163px;">
							<c:forEach items="${smallcategoryList}" var="list">
								<li>
									<a href="/giftcon/goods/list.conn?category=${list.CATEGORY_NUM}"><img src="/giftcon/images/category/${list.CATEGORY_IMG}" alt=""><span class="brandName">${list.SMALL_CATEGORY}</span></a>
								</li>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>

</body>
</html>