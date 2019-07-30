﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
</head>
<body>
<div id="container">


<style>
</style>
			<!-- start:sub_contents -->
			<div class="subWrap">
				<div class="subLayout">
					<!-- start:login -->
					<div class="loginArea">
						<form id="userInfo" name="loginFrm" role="login" action="/giftcon/login.conn" method="post" autocomplete="off">
							<fieldset>
								<legend></legend>
								<div class="loginInput">
									<div class="infoWrite">
										<p class="writeBox">
											<label for="userId">아이디</label>
											<input type="text" name="MEMBER_ID" id="MEMBER_ID" placeholder="아이디를 입력해주세요." class="ipt1 w408">
										</p>
										<p class="writeBox">
											<label for="userPwd">비밀번호</label>
											<input type="password" name="MEMBER_PASSWD" id="MEMBER_PASSWD" placeholder="비밀번호를 입력해주세요." class="ipt1 w408">
										</p>
										<div class="etcBox">
											<span class="saveId">
												<input type="checkbox" id="saveId" name="saveId"> 아이디 저장
											</span>
											<span class="btnPw">
												<a href="/user/findId.do">아이디찾기/비밀번호재설정</a>
											</span>
											<span class="inputTxt"></span>
										</div>
									</div>
									<span class="btnLogin"><a href="" id="btnLogin" class="btnBigBgBlue1 w120">로그인 </a></span>
								</div>
							</fieldset>
						<div>
						
</div></form>
						
						<div class="joinBanner">
							<div class="txt">
								<span class="icoClick"></span>
								<p class="bannerTxt">
									<span class="txt1">쉐어콘</span>
									<span class="txt2">아직 쉐어콘 회원이 아니신가요?</span>
								</p>
							</div>
							<a href="/giftcon/joinStep2.conn" class="btnBigLineBlue1 w275">회원가입</a>
						</div>
					</div>
					<!-- /end:login -->
				</div>
			</div>
			<!-- /end:sub_contents -->
		</div>
	</div>



	<script type="text/javascript">
		$(document).ready(function(){
			$("#btnLogin").on("click", function(e){
				e.preventDefault();
				fn_login();
			});

		});
		
		function fn_login(){
			var comSubmit = new ComSubmit("userInfo");
			comSubmit.setUrl("/giftcon/login.conn");
			comSubmit.submit();
		}

	</script>


</body>
</html>
<%@include file="../module/footer.jsp"%>