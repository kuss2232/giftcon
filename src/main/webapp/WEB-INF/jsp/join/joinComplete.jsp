<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<html>

<head>
	<title>가입완료</title>
	<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
</head>
<body>

<div class="subWrap">
		<div class="subLayout">
		<div class="stepTitArea" align="center">
				<ul class="stepBox">
					<li class="step1">
						<div class="stepCont">
							<span class="stNum">STEP 01</span> <span class="stKind">약관동의</span>
						</div>
					</li>
					<li class="step2 ">
						<div class="stepCont">
							<span class="stNum">STEP 02</span> <span class="stKind">이메일인증</span>
						</div>
					</li>
					<li class="step3">
						<div class="stepCont">
							<span class="stNum">STEP 03</span> <span class="stKind">회원정보입력</span>
						</div>
					</li>
					<li class="step4 on">
						<div class="stepCont">
							<span class="stNum">STEP 04</span> <span class="stKind">가입완료</span>
						</div>
					</li>
				</ul>
			</div>
		<!--section-body//end-->
		<div class="btnsExc1">
			
			<a href="/giftcon/main.conn" id = "btnNext" class="btnBigBgBlue2 w227">메인으로 가기</a>
			
			 <a href="/giftcon/goods/list.conn" id="btnNext" class="btnBigBgBlue2 w227">쇼핑하러 가기</a> 
		</div>
</div>
</div>
</body>
</html>


<%@include file="../module/footer.jsp"%>