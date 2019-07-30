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
						<li><a href="/giftcon/findIdForm.conn">아이디 찾기</a></li>
						<li><a href="/giftcon/findPwForm.conn" class="on">비밀번호 찾기</a></li>
					</ul>
					<!-- /end:sub_tab -->
					<form id="findPwdFrm" name="findPwdFrm" action="/user/resetPwdForm.do" method="post">
					<input type="hidden" name="MEMBER_ID" id="userId" value="${map.MEMBER_ID }">
					<input type="hidden" name="MEMBER_NAME" value="${map.MEMBER_NAME}">
					<input type="hidden" name="MEMBER_EMAIL" value="${map.MEMBER_EMAIL}">
					<!-- start:contents -->
					<div class="findBox">
						<div>
							<p class="notiTxt2 mb30"><span class="point4">ez**</span>님의 본인인증이 완료되었습니다. 새로운 비밀번호를 설정해주세요.</p>
						</div>
						<div>
							<label for="n_pw">새 비밀번호</label>
							<input type="password" id="userPwd" name="MEMBER_PASSWD_C" title="n_pw" class="ipt2 w244" maxlength="30" autocomplete="off">
						</div>
						<div>
							<label for="join_name">새 비밀번호 확인</label>
							<input type="password" id="reUserPwd" name="reUserPwd" title="join_name" class="ipt2 w244" maxlength="30" autocomplete="off">
							<span>* 10~20자리의 영대/소문자,숫자 조합이나 8~20자리의 영대/소문자,숫자,특수문자 조합만 가능합니다.</span>
						</div>
					</div>
					<div class="btns">
			    		<a href="" id="btnPwdMod" class="btnBigBgBlue2 w227">변경하기</a>
				    </div>
					<!-- /end:contents -->
					<div>
</div></form>
				</div>
			</div>
			
<!-- <script type="text/javascript">
	$(document).ready(function() {
		$("#btnPwdMod").on("click", function(e) {
			e.preventDefault();
			fn_login();
		});
	});
	
	function fn_login() {
		var comSubmit = new ComSubmit("findPwdFrm");
		comSubmit.setUrl("/giftcon/chgPw.conn");
		comSubmit.submit();
	}
</script> -->

<script type="text/javascript">

$(document).ready(function() {
	
	$('#btnPwdMod').click(function(event) {
		event.preventDefault();
		
		if ($('#userPwd').val() == "") {
			alert('새 비밀번호를 입력해주세요.');
			$('#userPwd').focus();
			return;
		}
		
		if ($('#reUserPwd').val() == "") {
			alert('새 비밀번호 확인을 입력해주세요.');
			$('#reUserPwd').focus();
			return;
		}
		
		if ($('#userPwd').val() != $('#reUserPwd').val()) {
			alert("'새 비밀번호'와 '새 비밀번호 확인' 값이 일치하지 않습니다.");
			$('#userPwd').focus();
			return;
		}
		
/* 		if( isPasswordFormatError( $('#userPwd').val() ) ) {	
			$('#userPwd').focus();
		    return;
		} 
*/
		
		$.ajax
		({
			type:"POST",
			data : $("#findPwdFrm").serialize(),
	        url:"/giftcon/chgPw.conn",
	        dataType:"json",
	        success:function(data)
	        {
	            if (data.result == "SUCCESS") {
	            	alert("비밀번호 변경이 완료되었습니다.\n로그인 화면으로 이동합니다.");
	            	document.location.href = "/giftcon/loginForm.conn";
	            } else if (data.result != '') {
	            	alert(data.result);
	            	return;
	            } else {
	            	alert("비밀번호 변경을 실패했습니다.")
	            }
			},
	        error:function(data)
	        {
	            alert("다시 시도해주세요.");
	            return;
	        }
		});
	});
});
</script>
			
</body>
</html>
<%@include file="../module/footer.jsp"%>