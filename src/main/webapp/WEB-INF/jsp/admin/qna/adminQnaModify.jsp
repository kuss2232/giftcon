<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
							<a href="/MODA/qna/adminQnaList">
								<button type="button" class="btn btn-outline btn-default">전체</button>
							</a>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value="">--카테고리--</option>
								<option value="/MODA/qna/adminQnaList?categoryNum=1">상품문의</option>
								<option value="/MODA/qna/adminQnaList?categoryNum=2">배송문의</option>
								<option value="/MODA/qna/adminQnaList?categoryNum=3">입금문의</option>
								<option value="/MODA/qna/adminQnaList?categoryNum=4">교환&amp;반품문의</option>
								<option value="/MODA/qna/adminQnaList?categoryNum=5">기타문의</option>
							</select>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value="">--답변상태--</option>
								<option value="/MODA/qna/adminQnaList?repState=1">답변대기</option>
								<option value="/MODA/qna/adminQnaList?repState=2">답변완료</option>
								<option value="/MODA/qna/adminQnaList?repState=3">문의종료</option>
							</select>
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 Q&amp;A수 : 1</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 6%; text-align:center;">글번호</th>
										<th style="width: 11%; text-align:center;">카테고리</th>
										<th style="width: 8%; text-align:center;">아이디</th>
										<th style="width: 35%; text-align:center;">글제목</th>
										<th style="width: 10%; text-align:center;">문의날짜</th>
										<th style="width: 10%; text-align:center;">답변상태</th>
										<th style="width: 10%; text-align:center;">답변날짜</th>
										<th style="width: 10%; text-align:center;">관리</th>
									</tr>
								</thead>
								<tbody>
								
																		
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">1</td>
										<td style="text-align:center;vertical-align:middle;">ìíë¬¸ì</td>
										<td style="text-align:center;vertical-align:middle;">qqqq</td>
										<td style="text-align:center;vertical-align:middle;">asd</td>
										<td style="text-align:center;vertical-align:middle;">19.07.18 16:39</td>
										<td style="text-align:center;vertical-align:middle;">답변대기</td>
										<td style="text-align:center;vertical-align:middle;"></td>
										<td style="text-align:center;vertical-align:middle;">
											<a href="adminQnaDetail?QNA_NUMBER=1">
												<input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png">
											</a>&nbsp;&nbsp;
										
										<a href="adminQnaDelete?QNA_NUMBER=1">
											<input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()">
										</a>
										</td>									
									</tr>
								
								<!-- Q&A가 없을때 -->
								 
								</tbody>
							</table>
						</div>
					</div>
					<div class="paging">
						<strong>1</strong>
					</div>
					<div class="row">
						<div style="text-align:center;">
							<div id="dataTables-example_filter" class="dataTables_filter">
								<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">아이디</option>
										<option value="1">제목</option>
									</select>
									<input class="form-control" type="text" name="isSearch" id="isSearch">
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
</body>
</html>