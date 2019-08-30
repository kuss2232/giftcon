<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<script type="text/javascript"src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div class="subWrap">
		<div class="subLayout">
			<form id="userFrm" name="userFrm" action="/mypage/userDetail.do"
				method="post">
				<!-- start:Tab -->


				<ul class="subTab">
					<li><a href="/giftcon/mypage.conn" class="on">회원정보수정</a></li>
					<li><a href="/giftcon/userPwChgForm.conn">비밀번호변경</a></li>
					<li><a href="/giftcon/myQnalist.conn">나의 문의 이력</a></li>
					<li><a href="/giftcon/orderList.conn">주문내역</a></li>

				</ul>
				<!-- /end:Tab -->
				<!-- start:sub_title -->
				<div class="subTit2">기본정보</div>
				<!-- /end:sub_title -->
				<!-- start:contents -->
				<table summary="회원정보 수정 표" class="tbA">
					<caption>회원정보 수정</caption>
					<colgroup>
						<col width="26%">
						<col width="74%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><label for="id">아이디</label></th>
							<td class="last">${MEMBER.MEMBER_ID }</td>
						</tr>
						<tr>
							<th scope="row"><label for="person_name">이름</label></th>
							<td class="last">${MEMBER.MEMBER_NAME}</td>
						</tr>
						<tr>
							<th scope="row"><label for="cellphone">휴대폰 번호</label></th>
							<td class="last"><input type="text" class="ipt3 w260"
								id="cellphone" name="MEMBER_PHONE"
								value="${MEMBER.MEMBER_PHONE}"></td>
						</tr>
						<tr>
							<th scope="row"><label for="emal">이메일주소</label></th>

							<td class="last"><input type="text"
								class="ipt2 w110 emailonly" id="emailId" name="MEMBER_EMAIL1"
								title="이메일아이디입력" value="${MEMBER.MEMBER_EMAIL1}" maxlength="25">
								@ <input type="text" id="emailServer" name="MEMBER_EMAIL2"
								class="ipt2 w110 emailonly" title="이메일주소입력"
								value="${MEMBER.MEMBER_EMAIL2}" maxlength="20"> 
								<select class="selectMail" id="setEmailServer" onchange="$('#emailServer').val($('#setEmailServer').val());">
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="nate.com">nate.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="gmail.com">gmail.com</option>
							</select> <span class="inpTxt" id="emailTxt"></span></td>
						</tr>
						<tr>
							<th scope="row">광고성정보 수신동의</th>
							<td class="last"><span class="checkGroup1"><input
									type="checkbox" name="ckAgreeEmail" id="ckAgreeEmail"
									checked=""> <strong>이메일 수신 동의</strong></span> <span
								class="checkGroup1"><input type="checkbox"
									name="ckAgreeSms" id="ckAgreeSms" checked=""> <strong>메시지
										수신 동의</strong></span>
								<ul>
									<li>* 이벤트 정보 및 고객 관련 서비스 안내시 고객님의 수신동의가 필요합니다.</li>
									<li>* 주요 공지사항 및 개인정보관련 안내 등은 수신동의여부에 관계없이 발송됩니다.</li>
								</ul></td>
						</tr>

					</tbody>
				</table>
				<!-- /end:contents -->
				<!-- start:btn -->
				<div class="btn2">
					<a href="" id="btnDelete" class="btnBigLineBlue2 w180 mr10">회원탈퇴
						바로가기</a> <a href="" id="btnModify" class="btnBigBgBlue2 w227 mr10">회원정보변경</a>
				</div>
				<!-- /end:btn -->
				<div></div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
      $(document).ready(function(){
         $("#btnModify").on("click", function(e){
            e.preventDefault();
            fn_login();
         });

      });
      
      $(document).ready(function(){
          $("#btnDelete").on("click", function(e){
             e.preventDefault();
             fn_delete();
          });

       });
      
      function fn_login(){
         var comSubmit = new ComSubmit("userFrm");
         comSubmit.setUrl("/giftcon/userInfoUpdate.conn");
         comSubmit.submit();
      }
      
      function fn_delete(){
          var comSubmit = new ComSubmit("userFrm");
          comSubmit.setUrl("/giftcon/userSecession.conn");
          comSubmit.submit();
       }

   </script>
</body>
</html>
<%@include file="../module/footer.jsp"%>