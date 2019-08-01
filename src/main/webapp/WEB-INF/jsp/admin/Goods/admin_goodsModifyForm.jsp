<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<script type="text/javascript">
window.onload = function(){
	var code ="${goodsModel.goods_category}"
	for(var i=0; i<5; i++){
	    if(document.joinform.goods_category.options[i].value == code){
	        document.joinform.goods_category.options[i].selected = true;
	        break;
	    }
	}
	
	var code2 = "${goodsModel.goods_best}"
	for(var i=0; i<4; i++){
	    if(document.joinform.goods_best.options[i].value == code2){
	        document.joinform.goods_best.options[i].selected = true;
	        break;
	    }
	}
}
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
	<h1 class="page-header">상품수정</h1>
</div>

<div class="row" style="padding-left:15px;width:900px;">
	<div class="panel panel-default">
		<div class="panel-heading" >상품수정 페이지입니다. 이미지 확인하십시오</div>
			<div class="panel-body">
				<form action="goodsModify.dog" enctype="multipart/form-data" method="post"name="joinform" onsubmit="return validateForm()">	
				<input type="hidden" name="goods_num" value="${goodsModel.goods_num}">				
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
                            <input type="text" class="form-control" path="goods_name" value="${goodsModel.goods_name}" style="width:500px;"/>
                        </div>
                        
                        <div class="form-group">
                            <label>상품수량</label>
                            <input type="text" class="form-control" path="goods_amount"  value="${goodsModel.goods_amount}" style="width:107px;"/>
                        </div>
                        <div class="form-group">
                            <label>판매가격</label>
                            <input type="text" class="form-control" value="${goodsModel.goods_price}" path="goods_price" style="width:initial;"/>
                            <p class="help-block">판매가격 입력하세요. 0원으로 그대로 갈 경우 큰일납니다</p>
                        </div>
                        <div class="form-group">
                            <label>할인가격</label>
                            <input type="text" class="form-control" value="${goodsModel.goods_dcprice}" style="width:initial;"/>
                            <p class="help-block">할인가격 입력하세요. 0원으로 그대로 갈 경우 큰일납니다</p>
                        </div>
                        <div class="form-group">
                            <label>상품 간략 설명</label>
                            <input type="text" class="form-control" value="${goodsModel.goods_simple}" style="width:initial;"/>
                            <p class="help-block">상품 간략 설명입니다. 상품에 관한 간략한 설명을 적어주세요.</p>
                        </div>
                        <div class="form-group">
                            <label>상품 상세 설명</label>
                            <textarea class="form-control" value="${goodsModel.goods_detail}"></textarea>
                            <p class="help-block">상품 상세 설명입니다. 상품에 관한 상세한 설명을 적어주세요.</p>
                        </div>                                                        
                        <div style="border:1px;" class="form-group">
                           <label>상품이미지</label>
                            
                            <c:if test="${!empty goodsModel.goods_image}">
                            	<p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="/pet/resources/goods_upload/${goodsModel.goods_image}" width="60" height="60" alt="" onerror="this.src='/pet/resources/images/noimg_130.gif'" /><input type="hidden"  name="goods_image" value="${goodsModel.goods_image}"></p>
                            </c:if>
                            
                            <input type="file" name="file[0]" size="30" value="${goodsModel.goods_image}"/>
                            <p class="help-block">메인상품 이미지 입니다</p> 
                        </div>
                        <div style="border:1px;" class="form-group">
                           <label>상품이미지2</label>
                            
                            <c:if test="${!empty goodsModel.goods_image2}">
                            	<p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="/pet/resources/goods_upload/${goodsModel.goods_image2}" width="60" height="60" alt="" onerror="this.src='/pet/resources/images/noimg_130.gif'" /><input type="hidden"  name="goods_image" value="${goodsModel.goods_image2}"></p>
                            </c:if>
                            
                            <input type="file" name="file[1]" size="30" value="${goodsModel.goods_image2}"/>
                            <p class="help-block">메인상품 이미지2 입니다</p>                            
                        </div>
                        <div style="border:1px;" class="form-group">
                           <label>상품이미지3</label>
                            
                            <c:if test="${!empty goodsModel.goods_image3}">
                            	<p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 이미지 : <img src="/pet/resources/goods_upload/${goodsModel.goods_image3}" width="60" height="60" alt="" onerror="this.src='/pet/resources/images/noimg_130.gif'" /><input type="hidden"  name="goods_image" value="${goodsModel.goods_image3}"></p>
                            </c:if>
                            
                            <input type="file" name="file[2]" size="30" value="${goodsModel.goods_image3}"/>
                            <p class="help-block">메인상품 이미지3 입니다</p>                            
                        </div>
						<button type="submit" class="btn btn-success">상품수정</button>
						<button type="reset" class="btn btn-default">작성취소</button>					
				</form>
			</div>
	</div>
</div>






<!-- // container -->
	

