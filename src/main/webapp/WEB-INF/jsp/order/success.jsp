<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#complete").on("click", function(e){
		e.preventDefault();
		fn_opener();
	});
});

function fn_opener()
{
	window.opener.fn_window();
	self.close();
}
</script>
<body>
 
카카오페이 결제가 정상적으로 완료되었습니다.
<br/>
<input type="button" id="complete" value="결제 완료">
</body>

</html>
