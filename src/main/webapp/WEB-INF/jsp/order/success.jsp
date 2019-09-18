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
<style>
div.kakao {display: inline-block; width: 400px; padding: 30px 30px 22px 30px; background: #f9f9f9;}
div.kakao > div {margin-bottom: 8px;}
div.kakao > div p.Txt {font-size: 22px; font-weight: 600; color: #333; text-align: center;}
div.btns {margin-top: 60px; width: 450px; text-align: center;}
input.btnBigBgBlue2 {display: inline-block; font-size: 18px; font-weight: 600; color: #fff; text-align: center; background: #2164bf; border: 1px solid #2164bf; line-height: 57px;}
input.btnBigBgBlue2:hover {background: #0049ad; border: 1px solid #0049ad;}
</style>
<body>
<div class="subWrap">
	<div class="subLayout">
		<div class="kakao">
			<div>
				<p class="TxT">카카오페이 결제가 정상적으로 완료되었습니다.</p>
			</div>
		</div>
		<div class="btns">
			<input class="btnBigBgBlue2 w227" type="button" id="complete" value="결제 완료">
		</div>
	</div>
</div>
</body>
</html>