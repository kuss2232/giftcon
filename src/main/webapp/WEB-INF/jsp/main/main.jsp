<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<title>메인</title>
<%@include file="main-banner.jsp"%>
<%@include file="bestGoods.jsp"%>
<%@include file="saleGoods.jsp"%>
<%@include file="banner.jsp"%>
<%@include file="cscenter.jsp"%>
</head>
<body>
<%if(session.getAttribute("MEMBER_ID") != null) { %>
	<%if(Integer.valueOf(session.getAttribute("MEMBER_STATE").toString()) == 2){%>
		<script>
			alert("탈퇴한 회원이거나 삭제된 회원입니다.");
			document.location.href="/giftcon/logout.conn";
		</script>
	<%}	}%>
</body>
</html>
<%@include file="../module/footer.jsp"%>