<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
	<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
</head>	
<body>
	<div id="container">
		<div class="contents">
			
<style>
div.depthArea {position:relative;z-index:2}
</style>
<script>
function viewMainMenu() {
	if( $(".depthArea #mainMenuBox").hasClass("on") ) {
		$(".depthArea #mainMenuBox").removeClass("on");
	} else {
		$(".depthArea #mainMenuBox").addClass("on");
	}
	
	if( $(".depthArea #subMenuBox").hasClass("on") ) {
		$(".depthArea #subMenuBox").removeClass("on");
		$('.depthArea #subMenu').slideToggle(300);
	}
	
	$('.depthArea #mainMenu').slideToggle(300);
}

function viewSubMenu() {
	if( $(".depthArea #subMenuBox").hasClass("on") ) {
		$(".depthArea #subMenuBox").removeClass("on");
	} else {
		$(".depthArea #subMenuBox").addClass("on");
	}
	
	if( $(".depthArea #mainMenuBox").hasClass("on") ) {
		$(".depthArea #mainMenuBox").removeClass("on");
		$('.depthArea #mainMenu').slideToggle(300);
	}
	
	$('.depthArea #subMenu').slideToggle(300);
}
</script>
			<!-- /end:sub_lnb -->
			<!-- start:contents -->
			<div class="subWrap">
				<div class="subLayout">
					<!-- start:join_step_img -->
					<div class="stepTitArea">
						<ul class="stepBox">
							<li class="step1">
								<div class="stepCont">
									<span class="stNum">STEP 01</span>
									<span class="stKind">회원종류선택</span>
								</div>
							</li>
							<li class="step2">
								<div class="stepCont">
									<span class="stNum">STEP 02</span>
									<span class="stKind">약관동의</span>
								</div>
							</li>
							<li class="step3">
								<div class="stepCont">
									<span class="stNum">STEP 03</span>
									<span class="stKind">본인인증</span>
								</div>
							</li>
							<li class="step4 on">
								<div class="stepCont">
									<span class="stNum">STEP 04</span>
									<span class="stKind">회원정보입력</span>
								</div>
							</li>
							<li class="step5">
								<div class="stepCont">
									<span class="stNum">STEP 05</span>
									<span class="stKind">가입완료</span>
								</div>
							</li>
						</ul>
					</div>
					<!-- /end:join_step_img -->
					<form id="joinFrm" name="joinFrm" action="/user/joinStep4.do" method="post">
					<input type="hidden" name="certUserId" id="certUserId" value="">
					<input type="hidden" name="compFile" id="compFile" value="">
					<input type="hidden" name="email" id="email" value="">
					<input type="hidden" name="userType" id="userType" value="P">
					
					<!-- start:join_info -->
						<!-- start:sub_title -->
						<div class="subTit">가입정보입력</div>
						<!-- /end:sub_title -->
						<!-- start:contents -->
						<table summary="개인/비즈회원 이용자의 공통 회원정보 입력" class="tbA mb60">
					  	<caption>회원정보입력</caption>
					  	<colgroup>
					  		<col width="26%">
					  		<col width="74%">
					  	</colgroup>
						  <tbody>
							<tr>
							  <th scope="row"><label for="id"><span class="mustTxt">*</span> 아이디</label></th>
							  <td class="last">
							  	<input type="text" class="ipt2 w260" id="userId" name="MEMBER_ID" maxlength="20" autocomplete="off"> <a href="#" id="ckUserId" class="btnSmlBgGray1 w93">중복확인</a> <!-- href="/giftcon/checkId.conn" -->
							  	<span class="inpTxt" id="userIdTxt"></span>
							  	<span class="guideTxt">* 영문/숫자 혼합으로 4~12자 이내</span>
							  </td>
							</tr>
							<tr>
								<th scope="row"><label for="pw"><span class="mustTxt">*</span> 비밀번호</label></th>
							  <td class="last">
							  	<input type="password" class="ipt2 w260" id="userPwd" name="MEMBER_PASSWD" maxlength="20" autocomplete="off"> <span class="inpTxt" id="userPwdTxt"></span>
								<span class="guideTxt">* 10~20자리의 영대/소문자,숫자 조합이나 8~20자리의 영대/소문자,숫자,특수문자 조합만 가능합니다.</span>
							  </td>
							</tr>
							<tr>
							  <th scope="row"><label for="pw_confi"><span class="mustTxt">*</span> 비밀번호확인</label></th>
							  <td class="last">
							  	<input type="password" class="ipt2 w260" id="reUserPwd" maxlength="20" name="reUserPwd" autocomplete="off"> <span class="inpTxt" id="reUserPwdTxt"></span>
							  </td>
							</tr>
							<tr>
							  <th scope="row"><label for="name"><span class="mustTxt">*</span> 이름</label></th>
							  <td class="last">
							  	<input type="text" class="ipt3 w260" id="userName" name="MEMBER_NAME" value=""  required="" label="이름">
							  	<span class="inpTxt" id="userNameTxt"></span>
							  </td>
							</tr>
							<tr>
							  <th scope="row"><label for="cellphone"><span class="mustTxt">*</span> 휴대폰번호</label></th>
							  <td class="last">
							  	<input type="text" class="ipt3 w260" id="mobile" name="MEMBER_PHONE"  required="" label="휴대폰번호">
							  	<span class="inpTxt" id="mobileTxt"></span>
							  </td>
							</tr>
							<tr>
							  <th scope="row"><label for="emal"><span class="mustTxt">*</span> 이메일주소</label></th>
							  <td class="last"><input type="text" class="ipt2 w110 emailonly" id="emailId" name="MEMBER_EMAIL" title="이메일아이디입력" maxlength="50"> 
								  <span class="inpTxt" id="emailTxt"></span>
							  </td>
							</tr>
						  </tbody>
						</table>
						<!-- /end:contents -->
					<!-- /end:join_info -->
					
					<div class="btns">
						<a href="/giftcon/joinStep1.conn" id="btnJoin" class="btnBigBgBlue2 w227">회원가입</a>
					</div>
					<input type="password" id="userPwdFake" name="userPwdFake" autocomplete="off" style="display: none;">
					<div>
<input type="hidden" name="_csrf" value="cc7600b9-b04d-4e37-b4f0-8ae4a4a5c2eb">
</div></form>
				</div>
			</div>
			<!-- /end:contents -->
		</div>
	</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#ckUserId").on("click", function(e) {
		e.preventDefault();
		fn_checkId();
	});

});

function fn_checkId() {
	var userId = $("#userId").val();
	var userData = {"MEMBER_ID":userId}
	if(userId.length < 1)
	{
		alert("아이디를 입력해주시기 바랍니다.");
	}
	else
	{
		$.ajax({
			type : "POST",
			url : "/giftcon/checkId.conn",
			data : userData,
			dataType : "json",
			error : function(error) {
				alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
			},
			success : function(result) {
				if(result == 0)
				{
					$("#userId").attr("disabled", true);
					alert("사용이 가능한 아이디입니다.");
				}
				else if(result == 1)
				{
					alert("이미 존재하는 아이디입니다. \n다른 아이디를 사용해주세요.");
				}
				else
				{
					alert("에러가 발생하였습니다.");
				}
			}
		})
	}
	/* var comSubmit = new ComSubmit("joinFrm");
	comSubmit.setUrl("/giftcon/checkId.conn");
	comSubmit.submit(); */
}
</script>
</body>
</html>