<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<head>
<!-- <script type="text/javascript">
 window.onload = function(){
	var code ="${orderModel.order_trade_type}"
	for(var i=0; i<2; i++){
	    if(document.joinform.order_trade_type.options[i].value == code){
	        document.joinform.order_trade_type.options[i].selected = true;
	        break;
	    }
	}
	
	var code2 = "${orderModel.order_trade_payer}"
	for(var i=0; i<4; i++){
	    if(document.joinform.order_trade_payer.options[i].value == code2){
	        document.joinform.order_trade_payer.options[i].selected = true;
	        break;
	    }
	}
	var code3 = "${orderModel.order_status}"
		for(var i=0; i<6; i++){
		    if(document.joinform.order_status.options[i].value == code3){
		        document.joinform.order_status.options[i].selected = true;
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
</script> -->
</head>

<!-- 메뉴 시작 -->

<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">주문수정</h1>
</div>

<div class="row" style="padding-left:15px;width:900px;">
	<div class="panel panel-default">
		<div class="panel-heading" >주문수정 페이지입니다. 이미지를 확인하십시오</div>
			<div class="panel-body">
				<%-- <form:form commandName="order" action="orderModify.dog" enctype="multipart/form-data" method="post" name="joinform" onsubmit="return validateForm()">	 --%>
						<div class="form-group">
                            <label>주문번호</label>
                            <input type="text" id="order_num" class="form-control" value="${ORDER_NUM}" style="width:initial;" readonly/>                             
                        </div>
                        <div class="form-group">
                            <label>상품명</label>
                            <input type="text" id="GOODS_NAME" class="form-control" value="" style="width:500px;" readonly/>                             
                        </div>
                        <div style="border:1px;" class="form-group">
                           <label>상품이미지</label>
                           <p><img src="/giftcon/resources/images/don.jpg" width="100" height="100" alt="" />                                                     
                        </div>	
                        <div class="form-group">
                            <label>상품수량</label>
                            <input type="text" class="form-control" value="" style="width:initial;" readonly/>                             
                        </div>
                        <div class="form-group">
                            <label>상품가격</label>
                            <input type="text" class="form-control" value="" style="width:initial;" readonly/>                             
                        </div>		
                        <div class="form-group" style="border-bottom: 1px dotted #999;width:550px;">
                            <label>총 주문가격</label>
                            <input type="text" class="form-control" value="" style="width:initial;" readonly/>   
                            <p>                   
                        </div>
                        <div class="form-group">
                            <label>무통장계좌</label>
                            <label>기업은행 : 1234-55-123145 (주)쉐어콘</label>
                        </div>
                        <div class="form-group">
                            <label>주문상태</label>
                            <select path="order_status" class="form-control" style="width:initial;" name="order_status" >
								<option value="입금대기" label="입금대기" />
								<option value="결제완료" label="결제완료" />
							</select>                   
                        </div>							
						<div class="form-group">
                            <label>주문일자</label>
                            <%-- <fmt:formatDate value="201907231" pattern="YYYY.MM.dd" /> --%>                            
                        </div>
						
						<button type="submit" class="btn btn-success">주문수정</button>
						<button type="reset" class="btn btn-default">작성취소</button>					
				<%-- </form:form> --%>
			</div>
	</div>
</div>