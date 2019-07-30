<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>

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
						<li><a href="/giftcon/findIdForm.conn" class="on">아이디 찾기</a></li>
						<li><a href="/giftcon/findPwForm.conn">비밀번호 재설정</a></li>
					</ul>
					<!-- /end:sub_tab -->
					<!-- start:contents -->
					<div class="findBox">
						<div>
							<p class="notiTxt1">회원님의 아이디는 <span class="point3">${MEMBER.MEMBER_ID}</span> 입니다.</p>
<!-- 							<p class="notiTxt2">가입일 : <span class="point4">
							2019년
							7월
							22일
							</span></p>
-->						</div>
					</div>
					<div class="btns">
			    		<a href="/giftcon/loginForm.conn" class="btnBigBgBlue2 w227">로그인</a>
				    </div>
					<!-- /end:contents -->
				</div>
			</div>
</body>
</html>
<%@include file="../module/footer.jsp"%>