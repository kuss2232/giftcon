<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<title>이메일인증</title>
	<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
	<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
	<script src="/giftcon/css/common.js"></script>
	<script src="/giftcon/css/jquery/jquery.blockUI.js"></script>
	
	
	<script>
	$(function(){ 
		$("#btnCert").click(function(){ 
			//잠깐 나타났다가 사라지는 함수
			//$.growlUI('타이틀', '내용'); 
			$.blockUI({ //html태그를 문자열로 적용해도 무관함 
				//message : "<table><tr><td>태그테스트</td></tr><table>" 
				message: $('#emailCheck')
				//css 설정 
				,css: { border: 'none', padding:'15px',backgroundColor:'#EAEAEA',  textAlign: 'left' , align:'center', width:'560px'} 
				//모달창 외부 클릭시 닫기 
				 });	}) 
		$("#confirm").click(function(e){ //모달창 닫기 
			fn_email_code();
			fn_confirm();
			e.preventDefault();
		}) 
	})

	</script>
	
</head>
<body>

<script>
$(document).ready(function(){
	$("#check").on("click", function(e) {
		
		e.preventDefault();
		fn_email_code();
	});
/* 	
	$("#confirm").on("click", function(e){
		e.preventDefault();
		fn_confirm();
	}); */
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
				//data :  email,
				dataType : "json",/* ({
					mode : "email_code",
					email : email
				}) */

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
		} else if (emailId == "") {
			alert("이메일을 정확히 입력하세요.");
			console.log("로그 내용1");
		} else {
			$.ajax({
				type : "POST",
				url : "/giftcon/joinStep1/modal_email_auth_success.conn",
				success : function(data) {
					var code = $("#sing_code").val();
					//alert("auth값 : "+data + ", code 값 : "+code); 
					//console.log("로그 내용1");
					if (data != null) {
						if (code == "") {
							alert("인증번호를 입력해 주세요");
							$("#sing_code").focus();
						} else if (code != data) {
							alert("인증번호가 맞지 않습니다.");
						} else {
							var comSubmit = new ComSubmit("frm"); 
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
<div id = "emailCheck" style="display:none; align:center;">
<form id="frm" name="frm" method="post" class="form-horizontal">

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


	<div class="subWrap">
		<div class="subLayout">
		<div class="stepTitArea" align="center">
				<ul class="stepBox">
					<li class="step1">
						<div class="stepCont">
							<span class="stNum">STEP 01</span> <span class="stKind">약관동의</span>
						</div>
					</li>
					<li class="step2 on">
						<div class="stepCont">
							<span class="stNum">STEP 02</span> <span class="stKind">이메일인증</span>
						</div>
					</li>
					<li class="step3">
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
					<div class="centerBox">
					<span class="icoPhoneCertify"></span>
				</div>
				<div class="btnsExc1">
					<a href="#" id="btnCert" class="btnBigLineBlue3 w227">이메일 본인인증</a>
																			
				</div>
				<ul class="centerList">
					<li>- 본인 명의의 이메일로만 인증하실 수 있습니다. (타인 명의를 부정사용하는 경우 3년 이하의 징역 또는 5천만원 이하의 벌금이 부과될 수 있습니다.)</li>
					<li>- 만 14세 미만은 가입할 수 없습니다.</li>
					<li>- 입력하신 정보는 본인확인을 위해 한국인터넷진흥원㈜에 제공되며, 본인확인 용도 외에 사용되거나 저장되지 않습니다.</li>
				</ul>
				</div></div>
<script type="text/javascript">
function openPop(){
	window.open('/giftcon/joinStep2-1.conn',"top=100px, right=100px left=100px, height=500px, width=500px");
}
</script>
</body>
</html>
<%@include file="../module/footer.jsp"%>