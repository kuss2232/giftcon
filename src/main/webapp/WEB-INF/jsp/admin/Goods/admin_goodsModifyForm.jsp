<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>상품입력</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

<scRIPT language="Javascript">

function BIG_CATEGORYChange() {
 var x = document.frm.BIG_CATEGORY.options.selectedIndex;
 var groups=document.frm.BIG_CATEGORY.options.length;
 var group=new Array(groups);
 for (i=0; i<groups; i++)
  group[i]=new Array();
 
 group[0][0]=new Option("대분류를 먼저 선택하세요","");
 group[1][0]=new Option("치킨/피자/버거 브랜드 선택","");
 group[1][1]=new Option("BBQ","BBQ");
 group[1][2]=new Option("BHC","BHC");
 group[1][3]=new Option("피자마루","피자마루");
 group[2][0]=new Option("커피/음료 브랜드 선택","");
 group[2][1]=new Option("스타벅스","스타벅스");
 group[2][2]=new Option("이디야","이디야");
 group[2][3]=new Option("쥬시","쥬시");
 group[3][0]=new Option("아이스크림/빙수 브랜드 선택","");
 group[3][1]=new Option("베스킨라벤스31","베스킨라벤스31");
 group[3][2]=new Option("설빙","설빙");
 group[4][0]=new Option("떡/베이커리 브랜드 선택","");
 group[4][1]=new Option("파리바게트","파리바게트");
 group[4][2]=new Option("뚜레주르","뚜레주르");
 group[5][0]=new Option("편의점/마트 브랜드 선택","");
 group[5][1]=new Option("GS25","GS25");
 group[5][2]=new Option("CU","CU");
 group[5][3]=new Option("이마트24","이마트24");
 
 temp = document.frm.SMALL_CATEGORY;
 for (m = temp.options.length-1 ; m > 0 ; m--)
  temp.options[m]=null
 for (i=0;i<group[x].length;i++){
  temp.options[i]=new Option(group[x][i].text,group[x][i].value)
 }
 temp.options[0].selected=true
}
/* function GOODS_CATEGORY2Change() {
 var GOODS_CATEGORY1 = document.frm.GOODS_CATEGORY1.options.selectedIndex;
 var x = document.frm.GOODS_CATEGORY2.options.selectedIndex;
 var groups=document.frm.GOODS_CATEGORY2.options.length;
 var group=new Array(groups);
 for (i=0; i<groups; i++)
  group[i]=new Array();
 if(GOODS_CATEGORY1 == 1) {
  group[0][0]=new Option("중분류를 먼저 선택하세요","");
  group[1][0]=new Option("삼성컴퓨터 선택","");
  group[1][1]=new Option("섬성 팬티엄III","ss3");
  group[1][2]=new Option("삼성 팬티엄IV","ss4");
  group[1][3]=new Option("삼성 센스 노트북","ssnote");
  group[2][0]=new Option("대우 컴퓨터 선택","");
  group[2][1]=new Option("대우 데스크탑 프로","dw");
  group[3][0]=new Option("엘지 컴퓨터 선택","");
  group[3][1]=new Option("LG IBM PC","lgpc");
  group[3][2]=new Option("LG IBM NOTEBOOK ","lgnote");
 } else if(GOODS_CATEGORY1 == 2) {
  group[0][0]=new Option("중분류를 먼저 선택하세요","");
  group[1][0]=new Option("엡손 프린터 선택","");
  group[1][1]=new Option("엡손 잉크","epson_ink");
  group[1][2]=new Option("엡손 레이져","epson_laser");
  group[2][0]=new Option("휴렛캑커드 프린터 선택","");
  group[2][1]=new Option("HP 잉크젯","hp_ink");
  group[2][2]=new Option("HP 레이져젯","hp_laser");
 }
 
 temp = document.frm.third;
 for (m = temp.options.length-1 ; m > 0 ; m--)
  temp.options[m]=null
 for (i=0;i<group[x].length;i++){
  temp.options[i]=new Option(group[x][i].text,group[x][i].value)
 }
 temp.options[0].selected=true
} */

</scRIPT>



</head>
<body>

<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">상품수정</h1>
</div>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
				<col width="13%">
				<col width="*"/>
			</colgroup>
			<caption>상품 수정</caption>
			<tbody>
				<tr>
					<th scope="row">상품번호</th>
					<td colspan="3">${goodsBasic.GOODS_NUM}<input type="hidden" id="GOODS_NUM" name="GOODS_NUM" class="wdp_90" value="${goodsBasic.GOODS_NUM}"></input></td>
				</tr>
				<tr>
					<th scope="row">상품명</th>
					<td><input type="text" id="GOODS_NAME" name="GOODS_NAME" class="wdp_90" value="${goodsBasic.GOODS_NAME}"></input></td>
				</tr>
				<tr>
					<th scope="row">가격</th>
					<td ><input type="text" id="GOODS_PRICE" name="GOODS_PRICE" class="wdp_90" value="${goodsBasic.GOODS_PRICE}"></input></td>
				</tr>
				
				<tr>
					<th scope="row">카테고리</th>
					<td>
						<select id="BIG_CATEGORY" name="BIG_CATEGORY" onchange="BIG_CATEGORYChange();" size=1>
						<OPTION value=''>대분류</OPTION>
						<OPTION value='치킨/피자/버거'>치킨/피자/버거</OPTION>
						<OPTION value='커피/음료'>커피/음료</OPTION>
						<OPTION value='아이스크림/빙수'>아이스크림/빙수</OPTION>
						<OPTION value='떡/베이커리'>떡/베이커리</OPTION>
						<OPTION value='편의점/마트'>편의점/마트</OPTION>
						 
						</select>
						<SELECT id="SMALL_CATEGORY" name="SMALL_CATEGORY" size=1>
						 <OPTION value=''>대분류를 먼저 선택하세요</OPTION>
						</SELECT>
					</td>
				</tr>
				<tr>
					<th scope="row">이미지1</th>
					<td><input type="file" id="GOODS_IMG1" name="GOODS_IMG1" value="${goodsBasic.GOODS_IMG1 }"></td>
				</tr>
				<tr>
					<th scope="row">이미지2</th>
					<td><input type="file" id="GOODS_IMG2" name="GOODS_IMG2" value="${goodsBasic.GOODS_IMG2}"></td>
				</tr>
				<tr>
					<th scope="row">할인 가격</th>
					<td><input type="text" id="GOODS_DCPRICE" name="GOODS_DCPRICE" class="wdp_90" value="${goodsBasic.GOODS_DCPRICE}"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="5" cols="100" title="내용" id="GOODS_SIMPLE" name="GOODS_SIMPLE" placeholder="기본 설명">${goodsBasic.GOODS_SIMPLE}</textarea>
						<br/><br/>
						<textarea rows="10" cols="100" title="내용" id="GOODS_DETAIL" name="GOODS_DETAIL" placeholder="상세 설명">${goodsBasic.GOODS_DETAIL}</textarea>
						<br/><br/>
					</td>
				</tr>
				<tr>
					<th scope="row">물량 수정</th>
					<td><input type="text" id="GOODS_AMOUNT" name="GOODS_AMOUNT" class="wdp_90"></input></td>
				</tr>
				<tr>
					<th scope="row">추가 이미지</th>
					<td><input type="file" id="GOODS_IMG3" name="GOODS_IMG3"></td>
				</tr>
			</tbody>
		</table>
		
		<br/><br/>
		<a href="#this" class="btn" id="write">작성하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
	</form>
	<br/>
	<br/>
	
	<form id="commonForm" name="commonForm"></form>
	<script type="text/javascript">
		var gfv_count = 1;
		var gfc_count = 1;
	
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openGoodsList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				 if($('#GOODS_NAME').val()==""){
					alert("상품명을 입력해 주세요.");
					return false;
				 } else if($('#GOODS_PRICE').val()==""){
					 alert("상품가격을 입력해 주세요.");
						return false;
				 } else if($('#BIG_CATEGORY').val()==''){
					 alert("상품 대분류를 선택해 주세요.");
						return false;
				 } else if($('#SMALL_CATEGORY').val()==''){
					 alert("상품 소분류를 선택해 주세요.");
						return false;
				 } else if($('#GOODS_IMG1').val()==""){
					 alert("이미지1을 등록해 주세요.");
						return false;
				 } else if($('#GOODS_IMG2').val()==""){
					 alert("이미지2를 등록해 주세요.");
						return false;
				 } else if($('#GOODS_SIMPLE').val()==""){
					 alert("상품 간략설명을 입력해 주세요.");
						return false;
				 } else if($('#GOODS_DETAIL').val()==""){
					 alert("상품 상세설명을 입력해 주세요.");
						return false;
				 } else if($('#GOODS_AMOUNT').val()==""){
					 alert("상품 수량을 입력해 주세요.");
						return false;
				 } else if($('#GOODS_IMG3').val()==""){
					 alert("이미지3을 등록해 주세요.");
						return false;
				 }
				 else{
				fn_insertGood();
				}
			});
			
			$("#addFile").on("click", function(e){ //파일 추가 버튼
				e.preventDefault();
				fn_addFile();
			});
			
			$("#addKind").on("click", function(e){ //파일 추가 버튼
				e.preventDefault();
				fn_addKind();
			});
			
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteKind($(this));
			});
		});
		
		function fn_openGoodsList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/goods/adminGoodsList.conn' />");
			comSubmit.submit();
		}
		
		function fn_insertGood(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/goods/adminInsertGoods.conn' />");
			comSubmit.submit();
		}
		
		
	</script>
</body>
</html>