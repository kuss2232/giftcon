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
   <input type="button" id="btn" value="���â����" />
   <div id="question" style="display: none; cursor: pointer;">
      <h1>���âȮ��</h1>
      <input type="button" id="closebtn" value="�ݱ�" />
   </div>

</body>
<script>
$(function(){
   $("#btn").click(function(){
      //��� ��Ÿ���ٰ� ������� �Լ�
      //$.growlUI('Ÿ��Ʋ', '����'); 
      $.blockUI({ 
             //html�±׸� ���ڿ��� �����ص� ������
             //message : "<table><tr><td>�±��׽�Ʈ</td></tr><table>"
            message: $('#question')
            //css ����
            ,css: { 
               width: '300px' 
            }
            //���â �ܺ� Ŭ���� �ݱ�
            ,onOverlayClick: $.unblockUI 
      });   
   })
   $("#closebtn").click(function(){
       //���â �ݱ�
       $.unblockUI(); 
   })
})

</script>
</html>