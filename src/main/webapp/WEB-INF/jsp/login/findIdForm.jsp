<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">

<script type="text/javascript">
	$(document).ready(function() {
		$("#btnFindId").on("click", function(e) {
			e.preventDefault();
			fn_login();
		});
	});
	
	function fn_login() {
		var comSubmit = new ComSubmit("findIdFrm");
		comSubmit.setUrl("/giftcon/findId.conn");
		comSubmit.submit();
	}
</script>
</head>
<body>
	<div class="subWrap">
		<div class="subLayout">
			<!-- start:sub_tab -->
			<ul class="subTab">
				<li><a href="/giftcon/findIdForm.conn" class="on">아이디 찾기</a></li>
				<li><a href="/giftcon/findPwForm.conn">비밀번호 찾기</a></li>
			</ul>
			<!-- /end:sub_tab -->
			<form id="findIdFrm" name="findIdFrm" action="/giftcon/findId.conn"
				method="post">

				<!-- start:contents -->
				<div class="findBox">
					<div>
						<label for="name">이름</label> <input type="text" id="MEMBER_NAME"
							name="MEMBER_NAME" title="name" class="ipt2 w244" maxlength="12">
					</div>
					<div>
						<label for="phone">E-mail</label> <input type="text" id="MEMBER_EMAIL"
							name="MEMBER_EMAIL" title="email" class="ipt2 w244"
							maxlength="30">
					</div>
				</div>
				<div class="btns">
					<a href="" id="btnFindId" class="btnBigBgBlue2 w227">아이디 찾기</a>
				</div>
				<!-- /end:contents -->
				<div></div>
			</form>
		</div>
	</div>

</body>
</html>
<%@include file="../module/footer.jsp"%>