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
	<li><a href="/giftcon/mypage.conn" >회원정보수정</a></li>
	<li><a href="/giftcon/userPwChgForm.conn" class="on">비밀번호변경</a></li>
	<li><a href="/giftcon/myQnalist.conn">나의 문의 이력</a></li>
	<li><a href="/giftcon/myQnalist.conn">발신번호사전등록</a></li>
	<li><a href="/mypage/addrGroupList.do">주소록 관리</a></li>
</ul>
					<!-- /end:Tab -->
					<!-- start:pw_register -->
					<form id="updatePwdFrm" name="findPwdFrm" action="" method="post">
					<input type="hidden" name="MEMBER_ID" value="${MEMBER_ID}">
					<!-- start:contents -->
					<div class="findBox">

						<div>
							<label for="n_pw">새 비밀번호</label>
							<input type="password" id="userPwd" name="MEMBER_PASSWD" title="n_pw" class="ipt2 w244" maxlength="30" autocomplete="off">
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
			
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btnPwdMod").on("click", function(e){
				e.preventDefault();
				fn_login();
				
			});

		});
		
		function fn_login(){
			var comSubmit = new ComSubmit("updatePwdFrm");
			comSubmit.setUrl("/giftcon/userPwUpdate.conn");
			comSubmit.submit();
			alert("변경 되었습니다!");
		}

	</script>			
			
</body>
</html>
<%@include file="../module/footer.jsp"%>