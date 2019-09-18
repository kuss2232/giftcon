<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
</head>
<script>
function fn_go_main(){
	location.href="/giftcon/main.conn";
}
</script>
<body>
	에러페이지입니다.
	계속해서 뜨는 경우 관리자에게 문의하여주시기 바랍니다.
	<input type="button" onclick="fn_go_main()" value="메인화면으로"/>
</body>
</html>