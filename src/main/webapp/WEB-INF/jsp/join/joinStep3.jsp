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
	
	
	
</head>	
<%@ include file="/WEB-INF/include-header.jspf" %>
<%@ include file="/WEB-INF/include-body.jspf" %>
<body>
	<div id="container">
		<div class="contents">
			


			<!-- /end:sub_lnb -->
			<!-- start:contents -->
			<div class="subWrap">
				<div class="subLayout">
				<!-- start:join_step_img -->
				<div class="stepTitArea" align="center">
				<ul class="stepBox">
					<li class="step1">
						<div class="stepCont">
							<span class="stNum">STEP 01</span> <span class="stKind">약관동의</span>
						</div>
					</li>
					<li class="step2">
						<div class="stepCont">
							<span class="stNum">STEP 02</span> <span class="stKind">이메일인증</span>
						</div>
					</li>
					<li class="step3 on">
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
					<!-- /end:join_step_img -->
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
							  	<input type="text" class="ipt3 w260" id="mobile" name="MEMBER_PHONE" label="휴대폰번호">
							  	<span class="inpTxt" id="mobileTxt"></span>
							  </td>
							</tr>
							<tr>
							  <th scope="row"><label for="GENDER"><span class="mustTxt">*</span> 성별</label></th>
							  <td class="last"><input type="radio" id="gender1" name="MEMBER_GENDER" value="1">&nbsp;남자  &nbsp;
							  				   <input type="radio" id="gender2" name="MEMBER_GENDER" value = "2">&nbsp;여자 
								  <span class="inpTxt" id="emailTxt">* 체크해주세요!!</span>
							  </td>
							</tr>
							<tr>
							  <th scope="row"><label for="BIRTHDAY"><span class="mustTxt">*</span> 생년월일</label></th>
							  <td class="last"><input type="text" class="ipt2 w230 emailonly" id="birthday" name="MEMBER_BIRTHDAY" title="생년월일입력" maxlength="50" placeholder="ex) 901010"> 
								  <span class="inpTxt" id="emailTxt">* 6자리로 입력해주세요 ex) 901010</span>
							  </td>
							</tr>
							<tr>
							  <th scope="row"><label for="emal"><span class="mustTxt">*</span> 이메일주소</label></th>
							  <td class="last"><input type="text" class="ipt2 w230 emailonly" id="emailId" name="MEMBER_EMAIL" title="이메일아이디입력" maxlength="50" value="${MEMBER_EMAIL}" disabled="disabled"> 
								<span class="inpTxt" id="emailTxt"></span>
							  </td>
							</tr>
						  </tbody>
						</table>
						<!-- /end:contents -->
					<!-- /end:join_info -->
					
					<div class="btns">
						<a href="#" onClick="fn_insert()" id="btnJoin" class="btnBigBgBlue2 w227">회원가입</a>
					</div>
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
			data : {"MEMBER_ID":userId},
			//data : userData,
			dataType : "json",
			error : function(erromr) {
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
}
function fn_insert(){
	var  regexp = /^[0-9]*$/
	v = $("#btnjoin").val();
	if(!regexp.test(v)){
		alert("생년월일 6자리만 입력하세요");
		$("#btnjoin").val(v.replace(regexp,""));
	}
	var comSubmit = new ComSubmit(); 
	var gender = $("input[name='MEMBER_GENDER']:checked").val();
	comSubmit.setUrl("<c:url value='/joinComplete.conn' />");
	comSubmit.addParam("MEMBER_ID", $("#userId").val());
	comSubmit.addParam("MEMBER_PASSWD", $("#userPwd").val());
	comSubmit.addParam("MEMBER_EMAIL", $("#emailId").val());
	comSubmit.addParam("MEMBER_PHONE", $("#mobile").val());
	comSubmit.addParam("MEMBER_NAME", $("#userName").val());
	comSubmit.addParam("MEMBER_GENDER", gender);
	comSubmit.addParam("MEMBER_BIRTHDAY", $("#birthday").val());
	comSubmit.submit(); 
}



</script>
</body>
</html>