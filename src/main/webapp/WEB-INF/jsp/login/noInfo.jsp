<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../module/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="subWrap">
		<div class="subLayout">
			<!-- start:sub_tab -->
			<ul class="subTab">
				<li><a href="/giftcon/findIdForm.conn">아이디 찾기</a></li>
				<li><a href="/giftcon/findPwForm.conn" class="on">비밀번호 찾기</a></li>
			</ul>
			<!-- /end:sub_tab -->
			<form id="findPwdFrm" name="resetPwdFrm" action="/giftcon/findPw.conn"
				method="post">
				<input type="hidden" name="ckCertNum" id="ckCertNum"> <input
					type="hidden" name="expiredCertNum" id="expiredCertNum">

				<!-- start:contents -->
				<div class="findBox">
					<div>
						<p class="notiTxt1">입력하신 정보는 존재하지않습니다.</p>
					</div>

				</div>

				<div class="btns">
					<a href="" id="ckUserId" class="btnBigBgBlue2 w227">비밀번호 찾기</a>
				</div>
				<div class="findGo">아이디가 기억나지 않는다면? <a href="/giftcon/findIdForm.conn" class="btnTxt">아이디찾기바로가기 &gt;</a>
				</div>
				<!-- /end:contents -->
				<div></div>
			</form>
		</div>
	</div>

</body>
</html>
<%@include file="../module/footer.jsp"%>