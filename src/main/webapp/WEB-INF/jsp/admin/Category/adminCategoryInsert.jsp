<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
	<script src="/giftcon/js/common.js"></script>
</head>
<body>
<h1>카테고리를 관리합니다.</h1><br>

<h3 class="box-title">브랜드 등록</h3>

    <!-- form start -->
    <form id ="frm" name="frm"  method="post" enctype="multipart/form-data">
        <div class="box-body">
            <div class="form-group">
                <label for="CATEGORY_IMG">이미지 파일</label>
                 <input type="file" name="CATEGORY_IMG" >
            </div>
            <div class="form-group">
                <label for="SMALL_CATEGORY">브랜드 명</label>
                <input type="text" class="form-control" id="labelNm" name="SMALL_CATEGORY" placeholder="상표명을 입력하십시오." required>
            </div>
            <div class="form-group">
                <label for="Big_CATEGORY">카테고리 선택</label>
     					<select class="form-control" name="BIG_CATEGORY"  id="selectCateogry">
										<option value="치킨">치킨/피자/버거</option>
										<option value="커피">커피/음료</option>
										<option value="아이스크림">아이스크림</option>
										<option value="상품권">상품권</option>
										<option value="베이커리">베이커리/도넛</option>
							</select> 
					</div>
				 <a href ="#this" class="btn" id="insert">작성하기</a>
				 
			</div>
	</form>
	<script>
		$(document).ready(function(){
			$("#insert").on("click",function(e){
				e.preventDefault();
				fn_insertGoods();
			});
		});
		
		function fn_insertGoods(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/adminCategoryInsert.conn' />");
		comSubmit.submit();
	}
	</script>
</body>
</html>