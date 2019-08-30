<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
<script type="text/javascript" src="/giftcon/css/jquery/jquery.blockUI.js"></script>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <input type="button" id="btn" value="모달창띄우기" />
   <div id="question" style="display: none; cursor: pointer;">
      <h1>모달창확인</h1>
      <input type="button" id="closebtn" value="닫기" />
   </div>

</body>
<script>
$(function(){
   $("#btn").click(function(){
      //잠깐 나타났다가 사라지는 함수
      //$.growlUI('타이틀', '내용'); 
      $.blockUI({ 
             //html태그를 문자열로 적용해도 무관함
             //message : "<table><tr><td>태그테스트</td></tr><table>"
            message: $('#question')
            //css 설정
            ,css: { 
               width: '300px' 
            }
            //모달창 외부 클릭시 닫기
            ,onOverlayClick: $.unblockUI 
      });   
   })
   $("#closebtn").click(function(){
       //모달창 닫기
       $.unblockUI(); 
   })
})

</script>
</html>