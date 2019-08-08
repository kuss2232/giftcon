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
					<!-- start:Tab -->

<ul class="subTab">
	<li><a href="/giftcon/mypage.conn" class="on">회원정보수정</a></li>
	<li><a href="/giftcon/userPwChgForm.conn">비밀번호변경</a></li>
	<li><a href="/giftcon/myQnalist.conn">나의 문의 이력</a></li>
	<li><a href="/giftcon/orderList.conn">주문 내역</a></li>
	<li><a href="/mypage/addrGroupList.do">주소록 관리</a></li>
</ul>
					<!-- /end:Tab -->
					<!-- start:pw_register -->
					<form id="userPwdCheckFrm" name="userPwdCheckFrm" action="" method="post">
					<div class="pwEntry">
						<p class="notiTxt5"><span class="notiIcon"></span><span>회원님의 개인정보 확인을 위하여 비밀번호를 다시 한번 입력해주세요.<br>정기적인 비밀번호 변경을 통해 개인정보유출 위험에 대응해 주시기 바랍니다.</span></p>
						<div class="pwBox">
							<label for="c_pw">비밀번호 입력</label>
							<input type="password" name="MEMBER_PASSWD" id="userPwd" class="ipt2 w230" maxlength="20" autofocus="" autocomplete="off">
						</div>
					</div>
					<div>
</div></form>
					<!-- /end:pw_register -->
					<!-- start:btn -->
					<div class="btns ml51">
						<a href="" id="btnPwdCheck" class="btnMidBgBlue1 w108">확인</a>
					</div>
					<!-- /end:btn -->
				</div>
			</div>
			
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btnPwdCheck").on("click", function(e){
				e.preventDefault();
				fn_login();
			});

		});
		
		function fn_login(){
			var comSubmit = new ComSubmit("userPwdCheckFrm");
			comSubmit.setUrl("/giftcon/userCheckPw.conn");
			comSubmit.submit();
		}

	</script>			
			
</body>
</html>
<%@include file="../module/footer.jsp"%>