<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
<script type="text/javascript">
function validateForm() {
    var x = document.forms["joinform"]["goods_name"].value;
    if (x == null || x == "") {
        alert("상품명은 입력해야합니다");
        return false;
    }
}
</script>
</head>


<!-- 메뉴 시작 -->

<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">상품등록</h1>
</div>

<div class="row" style="padding-left:15px;width:900px;">
	<div class="panel panel-default">
		<div class="panel-heading">상품등록 페이지입니다. 빠짐없이 입력하셔야합니다</div>
			<div class="panel-body">
				<form action="goodsInsert.dog" enctype="multipart/form-data" method="post" name="joinform" onsubmit="return validateForm()">	
						<div class="form-group">
                            <label>카테고리</label>	                            
                               <select class="form-control" style="width:initial;" >
								<option value="0" label="치킨/피자/버거" />
								<option value="1" label="커피/음료" />
								<option value="2" label="아이스크림/빙수" />
								<option value="3" label="떡/베이커리" />
								<option value="4" label="편의점/마트" />
							</select>
							<label>브랜드</label>	                            
                               <select class="form-control" style="width:initial;" >
								<option value="0" label="치킨/피자/버거" />
								<option value="1" label="커피/음료" />
								<option value="2" label="아이스크림/빙수" />
								<option value="3" label="떡/베이커리" />
								<option value="4" label="편의점/마트" />
							</select>
                        </div>
                        <div class="form-group">
                            <label>상품명</label>
                            <input type="text" name="goods_name" class="form-control" placeholder="상품명을 입력하세요" style="width:500px;"/>
                        </div>
                        <div class="form-group">
                            <label>상품수량</label>
                            <input type="text" class="form-control" placeholder="상품수량을 입력해주세요" value="1" style="width:107px;"/>
                        </div>
                        <div class="form-group">
                            <label>판매가격</label>
                            <input type="text" class="form-control" style="width:initial;"/>
                            <p class="help-block">판매가격 입력하세요. 0원으로 그대로 갈 경우 큰일납니다</p>
                        </div>
                        <div class="form-group">
                            <label>할인가격</label>
                            <input type="text" class="form-control" style="width:initial;"/>
                            <p class="help-block">할인가격 입력하세요. 0원으로 그대로 갈 경우 큰일납니다</p>
                        </div>
                        <div class="form-group">
                            <label>상품 간략 설명</label>
                            <input type="text" class="form-control" style="width:initial;"/>
                            <p class="help-block">상품 간략 설명입니다. 상품에 관한 간략한 설명을 적어주세요.</p>
                        </div>
                        <div class="form-group">
                            <label>상품 상세 설명</label>
                            <textarea class="form-control"></textarea>
                            <p class="help-block">상품 상세 설명입니다. 상품에 관한 상세한 설명을 적어주세요.</p>
                        </div>
                        
                        <div class="form-group">
                            <label>상품이미지</label>
                            <input type="file" name="file[0]" size="30" value=''/>
                            <p class="help-block">메인상품 이미지 입니다</p>
                        </div>
                        <div class="form-group">
                            <label>상품이미지2</label>
                            <input type="file" name="file[1]" size="30" value=''/>
                            <p class="help-block">메인상품 이미지2 입니다</p>
                        </div>
                        <div class="form-group">
                            <label>상품이미지3</label>
                            <input type="file" name="file[2]" size="30" value=''/>
                            <p class="help-block">메인상품 이미지3 입니다</p>
                        </div>
                        
						<button type="submit" class="btn btn-success">상품등록</button>
						<button type="reset" class="btn btn-default">작성취소</button>					
				</form>
			</div>
	</div>
</div>


