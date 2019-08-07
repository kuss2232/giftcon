<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>관리자 페이지</title>
<h3>카테고리 </h3>
<tr><h1>카테고리를 관리합니다.</h1></tr>
<br/>

 <script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<script src="/giftcon/js/common.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<script>
		
	function fn_login(num){
		var comSubmit = new ComSubmit("brandForm");
			comSubmit.setUrl("/giftcon/adminCategory1.conn");
			comSubmit.addParam("BIG_CATEGORY",num);
			comSubmit.submit();
		}
	function fn_delete(category){
		if(confirm("삭제하시겠습니가?") == true){
			var comSummit = new ComSubmit("category");
			alert("삭제되었습니다.");
			comSubmit.setUrl("/giftcon/adminCategoryDelete.conn");
			comSubmit.addParam("SMALL_CATEGORY",category);
			comSubmit.submit();	
		}
		else {
			alert("취소되었습니다.");
		}
	}
</script>
</head>
<body>
<form id="brandForm" name="brandForm" action="/bigCategoryList.conn">
	<div class="subWrap">
		<div class="subLayout">
			<!-- start:sub_title -->
			<div class="subTit">브랜드 카테고리</div>
			<!-- /end:sub_title -->
			<!-- start:product_search -->
			<div class="searchCate2 mt6">
			
					<a href="javascript:fn_login('전체')" ><font size="3px">전체</font></a>&nbsp;&nbsp;&nbsp;/
					
					<a href="javascript:fn_login('치킨/피자/버거')"><font size="3px">치킨/피자/버거</font></a>&nbsp;&nbsp;&nbsp;/
					
					<a href="javascript:fn_login('아이스크림')"> <font size="3px">아이스크림</font></a>&nbsp;&nbsp;&nbsp;/
					
					<a href="javascript:fn_login('베이커리/도넛')"><font size="3px">베이커리/도넛</font></a>&nbsp;&nbsp;&nbsp;/
					
					<a href="javascript:fn_login('편의점/마트')"> <font size="3px" >편의점/마트</font></a>&nbsp;&nbsp;&nbsp;/
					
					<a href="javascript:fn_login('커피/음료')"><font size="3px" >커피/음료</font></a>&nbsp;&nbsp;&nbsp;

				
			</div>
			<!-- /end:product_search -->

			<!-- start:search_product -->
			<div class="brandLogo">
				<ul class="brandList" id="brandListAppend">
				
				</ul>

			</div>
			<!-- /end:search_product -->
		</div>
	</div>
</form>
 
 <br>

<div class="box box-primary">
    <div class="box-header with-border">
        <h2 class="box-title" align="center">목록</h2>
       
        
    </div>
    <br/><br/>
    <form id="category" name="category" >
    <div class="content">
        <table id="category_table" class="table table-striped table-bordered" style="width: 100%">
            <thead>
                <tr>
                   <th style="width: 10%; text-align:center;">번호</th>
                    <th style="width: 12%; text-align:center;">카테고리</th>
                    <th style="width: 20%; text-align:center;">브랜드 로고</th>
                    <th style="width: 12%; text-align:center;">브랜드 명</th>
                    <th style="width: 12%; text-align:center;">관리</th>
                </tr>
            </thead>
            <tbody>
           
            <%-- <c:forEach var="faqList"  items="${faqList}" varStatus="stat"> --%> 
            <c:forEach items="${list}" var="list">
					
					
					                                             
                           <tr class="gradeA even" role="row">
                              <td style="text-align:center;vertical-align:middle;">${list.CATEGORY_NUM}</td>
                              <td style="text-align:center;vertical-align:middle;">${list.BIG_CATEGORY}</td>
                              <td align="center"><img src="/giftcon/images/category/${list.CATEGORY_IMG}"></td>
                              <td style="text-align:center;vertical-align:middle;">${list.SMALL_CATEGORY}</td>
                              <td style="text-align:center;vertical-align:middle;">   
                              <a href="${viewURL}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png"></a>&nbsp;&nbsp;                        
                              <c:url var="viewURL2" value="adminFaqDelete.dog" >
                              </c:url>
                               <a href="${viewURL2}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="fn_delete(${list.SMALL_CATEGORY})"></a></td>  										                         
                           </tr>
                           </c:forEach>  
            </tbody>
        </table>
    </div>
    </form>
</div>
      <div class="row">
                     <div style="text-align:center;">
                        <div id="dataTables-example_filter" class="dataTables_filter">
                           <form action="">
                           <select class="form-control" name="searchNum" id="searchNum">
                              <option value="0">카테고리</option>
                              <option value="1">브랜드 명</option>
                           </select>
                              <input class="form-control" type="text" name="isSearch" id="isSearch"/>
                              <span>
                              <button type="submit" class="btn btn-default">검색</button>
                              </span>
                           </form>
                        </div>                     
                     </div>
                     
               </div>
</body>
</html>