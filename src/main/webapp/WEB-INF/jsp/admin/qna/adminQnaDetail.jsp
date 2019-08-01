<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/giftcon/css/bootstrapadmin.min.css">
	<script src="/giftcon/css/common.js" charset="utf-8"></script>
	<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function button2_click(frm) {
		var Form1 = document.frm;
		Form1.action = "adminQnaReplyDelete.conn?QNA_NUM=${qnaDetail.QNA_NUM}";
	}
	function goList(){
		location.href="/giftcon/adminQnaList.conn";
	}
</script>
</head>
<body>
<div class="row" style="padding-left: 15px; width: 700px;">
	<h1 class="page-header">Q&A 상세보기</h1>
</div>

<div class="row" style="padding-left: 15px; width: 700px;">
	<div class="panel panel-default">
		<div class="panel-heading">Q&A 상세보기 페이지입니다.</div>
		<div class="panel-body">
				<form id="commonForm" name="commonForm">
				<div class="form-group">
					<label>QNA 글번호</label> 
					<input type="text" class="form-control" name="QNA_NUM" value="${qnaDetail.QNA_NUM}" style="width: initial;" readonly />
				</div>

				<div class="form-group">
					<label>QNA 카테고리</label> 
					<input type="text" class="form-control" id="QNA_CATEGORY" name="QNA_CATEGORY" value="${qnaDetail.QNA_CATEGORY}" style="width: initial;" readonly />
				</div>
				<div class="form-group">
					<label>제목</label> 
					<input type="text" class="form-control" id="QNA_TITLE" name="QNA_TITLE" value="${qnaDetail.QNA_TITLE}" style="width: initial;" readonly />
				</div>

				<div class="form-group">
					<label>회원 아이디</label> 
					<input type="text" class="form-control" id="MEMBER_ID" name="MEMBER_ID" value="${qnaDetail.MEMBER_ID}" style="width: 250px;" readonly />
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" id="QNA_CONTENT" name="QNA_CONTENT" rows="10" cols="30" readonly>${qnaDetail.QNA_CNT}</textarea>
				</div>
				<c:choose>
					<c:when test="${qnaDetail.QNA_FILE eq null}">
						<div class="form-group">
							<label>등록 이미지</label>
						</div>
						<div class="form-group">
						</div>
					</c:when>
				</c:choose>
				<div class="form-group">
					<label>문의날짜</label> 
					<input type="text" class="form-control" id="QNA_DATE" name="QNA_DATE"
						value="${qnaDetail.QNA_DATE}" style="width: initial;" readonly />
				</div>

				<div class="form-group">
					<label>답변</label>
					<textarea class="form-control" id="QNA_REPCONTENT" name="QNA_REPCONTENT" rows="10" cols="30" readonly>${qnaDetail.QNA_COMMENT}</textarea>
				</div>
				<c:if test="${qnaDetail.QNA_REDATE ne null}">
					<div class="form-group">
						<label>답변날짜</label> 
						<input type="text" class="form-control" id="QNA_REGDATE" name="QNA_REPDATE"
							value="${qnaDetail.QNA_REDATE}"	style="width: initial;" readonly />
					</div>
				</c:if>
				<c:if test="${qnaDetail.QNA_COMMENT eq null}">
					<button type="button" class="btn btn-success" onclick="do_Upate(${qnaDetail.QNA_NUM});">답변달기</button>
				</c:if>
				<c:if test="${qnaDetail.QNA_COMMENT ne null}">
					<button type="button" class="btn btn-success" onclick="do_Upate(${qnaDetail.QNA_NUM});">답변수정</button>
					<button type="button" class="btn btn-success" onclick="button2_click();">답변삭제</button>
				</c:if>
					<button type="button" class="btn btn-outline btn-default" onclick="goList()">목록으로</button>
			</form>
		</div>
	</div>
</div>
<script>
	function do_Upate(qna_num){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/adminQnaReplyForm.conn'/>");
		comSubmit.addParam("QNA_NUM", qna_num);
		comSubmit.submit();
	}
</script>
</body>
</html>