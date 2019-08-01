<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<title>이메일인증</title>
	<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
	<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
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
					<li class="step2 on">
						<div class="stepCont">
							<span class="stNum">STEP 02</span> <span class="stKind">이메일인증</span>
						</div>
					</li>
					<li class="step3">
						<div class="stepCont">
							<span class="stNum">STEP 03</span> <span class="stKind">회원정보입력</span>
						</div>
					</li>
					<li class="step4">
						<div class="stepCont">
							<span class="stNum">STEP 04</span> <span class="stKind">가입완료</span>
						</div>
					</li>
				</ul>
			</div>
					<div class="centerBox">
					<span class="icoPhoneCertify"></span>
				</div>
				<div class="btnsExc1">
					<a href="/giftcon/joinStep2-1.conn" id="btnCert" class="btnBigLineBlue3 w227">이메일 본인인증</a>
				</div>
				<ul class="centerList">
					<li>- 본인 명의의 이메일로만 인증하실 수 있습니다. (타인 명의를 부정사용하는 경우 3년 이하의 징역 또는 5천만원 이하의 벌금이 부과될 수 있습니다.)</li>
					<li>- 만 14세 미만은 가입할 수 없습니다.</li>
					<li>- 입력하신 정보는 본인확인을 위해 한국인터넷진흥원㈜에 제공되며, 본인확인 용도 외에 사용되거나 저장되지 않습니다.</li>
				</ul>
				</div></div>
</body>
</html>
<%@include file="../module/footer.jsp"%>