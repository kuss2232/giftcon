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
			<form id="findPwdFrm" name="resetPwdFrm" action="/giftcon/findPw.conn"
				method="post">
				<input type="hidden" name="ckCertNum" id="ckCertNum"> <input
					type="hidden" name="expiredCertNum" id="expiredCertNum">

				<!-- start:contents -->
				<div class="findBox">
					<div>
						<label for="id">아이디</label> <input type="text" id="userId"
							name="MEMBER_ID" title="id" class="ipt2 w244" maxlength="12">
					</div>
					<div>
						<label for="join_name">이름</label> <input type="text" id="userName"
							name="MEMBER_NAME" title="join_name" class="ipt2 w244"
							maxlength="12">
					</div>
					<div>
						<label for="phone_num">E-mail</label> <input type="text"
							id="email" name="MEMBER_EMAIL" title="email"
							class="ipt2 w244" maxlength="30">
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
	
<script type="text/javascript">
	$(document).ready(function() {
		$("#ckUserId").on("click", function(e) {
			e.preventDefault();
			fn_login();
		});
	});
	
	function fn_login() {
		var comSubmit = new ComSubmit("findPwdFrm");
		comSubmit.setUrl("/giftcon/chgPwform.conn");
		comSubmit.submit();
	}
</script>	
</body>
</html>
<%@include file="../module/footer.jsp"%>