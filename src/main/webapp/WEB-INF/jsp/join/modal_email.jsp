<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="/giftcon/css/jquery/bootstrapadmin.min.css" rel="stylesheet" type="text/css">
<script>
$(document).ready(function(){
	$("#check").on("click", function(e) {
		e.preventDefault();
		fn_email_code();
	});
	
	$("#confirm").on("click", function(e){
		e.preventDefault();
		fn_confirm();
	});
})

	function fn_email_code() {
		var emailId = $("#email_Id").val();
		var email = {"MEMBER_EMAIL":emailId}
		if (emailId.length < 1) {
			alert("이메일을 입력하세요.");
		} else if (emailId.value == "") {
			alert("이메일을 정확히 입력하세요.");
			console.log("로그 내용1");
		} else {
			$.ajax({
				type : "POST",
				url : "/giftcon/joinStep1/modal_email_auth.conn",
				data :  {"MEMBER_EMAIL":emailId},
				dataType : "json",
				success : function(data) {
					console.log(data);
					if (data != 0) {
						alert("이미 가입된 이메일입니다.다른이메일을 입력해주세요");
					} else {
						alert("인증번호를 요청하신 이메일로 발송했습니다.");
						$("#email_Id").attr("disabled", true);
					}
					if (data != null) {
						console.log("로그 내용2" + data);
					}
				},
				error : function(e) {
					alert('error' + e);
				}
			});
		}
	}
	
	//이메일 확인(인증)
	function fn_confirm() {
		var emailId = $("#email_Id").val();
		var email = {"MEMBER_EMAIL":emailId}
		if (emailId == '@') {
			alert("이메일을 입력하세요.");
		} else if (emailId.value == "") {
			alert("이메일을 정확히 입력하세요.");
			console.log("로그 내용1");
		} else {
			$.ajax({
				type : "POST",
				url : "/giftcon/joinStep1/modal_email_auth_success.conn",
				success : function(data) {
					var code = $("#sing_code").val();

					if (data != null) {
						if (code.value=="") {
							alert("인증번호를 입력해 주세요");
							$("#sing_code").focus();//인증번호칸에 커서가간다
						} else if (code.value != data.value) {//인증번호와 ajax로 넘어온 인증번호값을 비교
							alert("인증번호가 맞지 않습니다.");
						} else {
							var comSubmit = new ComSubmit(); 
							comSubmit.setUrl("<c:url value='/joinStep3.conn' />");
							comSubmit.addParam("MEMBER_EMAIL", emailId);
							comSubmit.submit(); 
						}
					} else {
						alert("data값없음" + data);
						console.log("로그 내용3");
					}
				},
				error : function(e) {
					alert('error' + e);
				}
			});
		}
	}
</script>
<form name="frm" method="post" class="form-horizontal">

	<input name="agreement" value="o" type="hidden">

	<section style="padding: 30px 20px;">
		<div class="form-group">
			<label for="inputEmail3" class="col-xs-4 col-lg-4 control-label">이메일</label>
			<div class="col-xs-20 col-lg-20 form-inline">
				<input name="MEMBER_EMAIL" id="email_Id" class="form-control" size="25" type="text"> 
				<a href="#" id="check"	class="btn btn-default form-control">인증번호받기</a>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-4 control-label">인증번호</label>
			<div class="col-sm-20">
				<input id="sing_code" type="password">

			</div>
		</div>

		<div class="text-center" style="padding-top: 10px">
			<a href="#" id="confirm" class="btn btn-default">회원가입하기</a>
		</div>
	</section>
</form>
</div>
<div class="modal-foot"></div>
