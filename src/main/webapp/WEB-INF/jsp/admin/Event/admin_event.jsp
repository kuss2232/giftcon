
.<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<head>
<script type="text/javascript">
function delchk(){
    return confirm("삭제하시겠습니까?");
}
</script>

</head>

<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">EVENT</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                        EVENT  등록, 수정, 삭제 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
							<a href="admin/adminfaqList.dog?searchNum=0&isSearch="><button type="button" class="btn btn-outline btn-default">전체</button></a>													
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 게시물수 : ${totalCount}</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table table-striped table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 10%; text-align:center;">번호</th>
										<th style="width: 12%; text-align:center;">이미지</th>
										<th style="width: 38%; text-align:center;">제목</th>
										<th style="width: 10%; text-align:center;">작성자</th>										
										<th style="width: 10%; text-align:center;">등록일자</th>
										<th style="width: 10%; text-align:center;">조회수</th>
										<th style="width: 10%; text-align:center;">관리</th>
									</tr>
								</thead>
								<tbody>
								<%-- <c:forEach var="noticeList"  items="${noticeList}" varStatus="stat"> --%>						
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">1</td>
										<td><img src="/giftcon/resources/images/kyochon.png"></td>
										<td style="text-align:center;vertical-align:middle;">교촌 레드 콤보</td>
										<td style="text-align:center;vertical-align:middle;">관리자 1</td>
										<td style="text-align:center;vertical-align:middle;">2019-07-23</td>
										<td style="text-align:center;vertical-align:middle;">1</td>									
										<td style="text-align:center;vertical-align:middle;">
										<%-- <c:url var="viewURL1" value="adminEventUpdate.do"> --%>
										<a href="${viewURL}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png"></a>&nbsp;&nbsp;									
										<c:url var="viewURL2" value="adminEventDelete.do" >
											<c:param name="no" value=" ${eventList.no }" />							
										</c:url>	
										 <a href="${viewURL2}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()"></a></td>									
									</tr>
								 <%-- 	</c:forEach> --%>
														<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(eventList) le 0}">
										<tr><td colspan="9" style="text-align:center;">등록된 이벤트가 없습니다</td></tr>
									</c:if> 
								</tbody>
							</table>
						</div>
					</div>
					<div class="paging">
						${pagingHtml}
					</div>
				<button type="submit" class="btn btn-default">등록</button>
				
								<div class="row">
							<div style="text-align:center;">
								<div id="dataTables-example_filter" class="dataTables_filter">
									<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">제목</option>
										
									</select>
										<input class="form-control" type="text" name="isSearch" id="isSearch"/>
										<span>
										<button type="submit" class="btn btn-default">검색</button>
										</span>
									</form>
								</div>							
							</div>
					</div>
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>