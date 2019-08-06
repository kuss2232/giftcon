<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<th:block th:include="admin/category-js"></th:block>
<h3>카테고리 </h3>
<tr><h1>카테고리를 관리합니다.</h1></tr>
<br/>
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">브랜드 등록</h3>
    </div>
    <!-- /.box-header -->
    <!-- form start -->
    <form role="form" th:action="@{/category}" method="post">
        <div class="box-body">
            <div class="form-group">
                <label for="CATEGORY_IMG">이미지 파일</label><td>
                 <input type="file" name="imageFile" >
            </div>
            <div class="form-group">
                <label for="SMALL_CATEGORY">브랜드 명</label>
                <input type="text" class="form-control" id="labelNm" name="labelNm" placeholder="상표명을 입력하십시오." required>
            </div>
            <div class="form-group">
                <label for="Big_CATEGORY">카테고리 선택</label>
     <select class="form-control" name="BIG_CATEGORY"  id="BIG_CATEGORY">
										<option value="치킨/피자/버거">치킨/피자/버거</option>
										<option value="커피/음료">커피/음료</option>
										<option value="아이스크림/빙수">아이스크림/빙수</option>
										<option value="상품권">상품권</option>
										<option value="베이커리/도넛">베이커리/도넛</option>
									</select>    
					<!-- 빅카테고리 저장해서 넘기는 부분이 없음 팀장님께 부탁하는 걸로  -->        
            </div>
            <input type="submit" class="btn btn-primary" value="저장"/>
        </div>
        <!-- /.box-body -->
    </form>
</div>
 
 
 <br>
 </br>
<div class="box box-primary">
    <div class="box-header with-border">
        <h2 class="box-title" align="center">목록</h2>
       (등록된 상표 : 1)
        
    </div>
    <br/><br/>
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
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">1</td>
										<td style="text-align:center;vertical-align:middle;">치킨/피자/버거<%-- ${Big_Category} --%></td>
										<td align="center"><img src="/giftcon/resources/images/kyochon.png" ></td>
										<td style="text-align:center;vertical-align:middle;">교촌치킨</td>
										<td style="text-align:center;vertical-align:middle;">	
										<a href="${viewURL}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png"></a>&nbsp;&nbsp;								
										<c:url var="viewURL2" value="adminFaqDelete.dog" >
										</c:url>	
										 <a href="${viewURL2}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()"></a></td>									
									</tr>
			<%-- </c:forEach> --%>
            </tbody>
        </table>
    </div>
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