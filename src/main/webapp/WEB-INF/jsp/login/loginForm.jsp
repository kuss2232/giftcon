﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnLogin").on("click", function(e){
		e.preventDefault();
		fn_login();
	});

});

function fn_login(){
	var check = "false";
	if(document.loginFrm.saveId.checked)
	{
		check = "true";
	}
	$.ajax({
		type : "POST",
		url : "/giftcon/login.conn",
		data : {"MEMBER_ID":$(MEMBER_ID).val(),
				"MEMBER_PASSWD":$(MEMBER_PASSWD).val(),
				"saveId":check},
		dataType : "text",
		error : function(request,status,error) {
			alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
			//alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		},
		success : function(result) {
			if( result != "null")
			{
				location.href="/giftcon/main.conn";
			}
			else
			{
				alert("아이디나 비밀번호가 맞지 않습니다.");
			}
		}
	})
}
// 엔터치면 로그인
function onEnterLogin(){
	if(event.keyCode == 13){
		fn_login();  // 실행할 이벤트
   }
}

// 아이디저장

$(document).ready(function(){
	var userInputId = getCookie("userInputId");
	$("#MEMBER_ID").val(userInputId);
	
	if($("#MEMBER_ID").val() != ""){
		$("#saveId").attr("checked",true);
	}
});

function getCookie(cookieName){
	cookieName = cookieName + "=";
	var cookieData = document.cookie;//web이가지고있는 쿠키값
	var start = cookieData.indexOf(cookieName);
	var cookieValue = "";
	if(start != -1){
		start += cookieName.length;//아이디 시작값을 계산
		var end = cookieData.indexOf(";", start);//아이디 마지막값을 계산
		if(end == -1)end = cookieData.length;//마지막값인 ;을 못찾았을때
		cookieValue = cookieData.substring(start, end);// 아이디값의 시작과 끝값 사이의 문자열을 자른후 value에 저장
	}
	return unescape(cookieValue);
}
</script>
</head>
<body>

	<div id="container" onkeydown="javascript:onEnterLogin();">
		<!-- start:sub_contents -->
		<div class="subWrap">	
			<div class="subLayout">
				<!-- start:login -->
				<div class="loginArea">
					<form id="userInfo" name="loginFrm" role="login" action=""
						method="post" autocomplete="off">
						<fieldset>
							<legend></legend>
							<div class="loginInput">
								<div class="infoWrite">
									<p class="writeBox">
										<label for="userId">아이디</label> <input type="text"
											name="MEMBER_ID" id="MEMBER_ID" placeholder="아이디를 입력해주세요."
											class="ipt1 w408">
									</p>
									<p class="writeBox">
										<label for="userPwd">비밀번호</label> <input type="password"
											name="MEMBER_PASSWD" id="MEMBER_PASSWD"
											placeholder="비밀번호를 입력해주세요." class="ipt1 w408">
									</p>
									<span class="btnLogin"><a href="#" id="btnLogin"
									class="btnBigBgBlue1 w120">로그인 </a></span>
									<div class="etcBox">
										<span class="saveId"> <input type="checkbox"
											id="saveId" name="saveId"> 아이디 저장
										</span> <span class="btnPw"> <a
											href="/giftcon/findIdForm.conn">아이디찾기/비밀번호재설정</a>
										</span> <span class="inputTxt"></span>
									</div>
								</div>
							</div>
						</fieldset>
						<div></div>
					</form>

					<div class="joinBanner">
						<div class="txt">
							<span class="icoClick"></span>
							<p class="bannerTxt">
								<span class="txt1">쉐어콘</span> <span class="txt2">아직 쉐어콘
									회원이 아니신가요?</span>
							</p>
						</div>
						<a href="/giftcon/joinStep1.conn" class="btnBigLineBlue1 w275">회원가입</a>
					</div>
				</div>
				<!-- /end:login -->
			</div>
		</div>
		<!-- /end:sub_contents -->
	</div>






</body>
</html>
<%@include file="../module/footer.jsp"%>