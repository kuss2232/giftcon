<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
	<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
	<script src="/giftcon/css/common.js"></script>
	<script src="/giftcon/css/jquery/budget.js"></script>
<head>
	


<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="Pragma" content="No-Cache">
<meta name="description" content="대량 쿠폰 발송, 웰컴 BIZ 포인트 3천원, 최대 12% 적립, 예산 검색, MMS 꾸미기, 포인트 교환소">

<!-- Include the CSRF token within meta tags -->
<meta name="_csrf" content="6bfd5a00-f0ec-4ac5-8233-e1ac1cfc06a2">
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="X-CSRF-TOKEN">




<title>쉐어콘</title>

<!-- Service CSS -->

<link href="/images/common/favicon.ico" rel="shortcut icon" type="image/ico">
<link rel="shortcut icon" href="/images/common/typeA.png">
<link rel="apple-touch-icon" href="/images/common/typeA.png">

<!-- jQuery -->
<script type="text/javascript" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" async="" src="https://www.googleadservices.com/pagead/conversion_async.js"></script><script src="https://atm.acecounter.com/ac.js?tid=128153CT-20-A&amp;hsn=www.donutbook.co.kr&amp;hrf=in&amp;dvp=0&amp;tgp=&amp;tn1=&amp;tn2=0&amp;tn3=0&amp;tw1=&amp;tw2=&amp;tw3=&amp;tw4=&amp;tw5=&amp;tw6=&amp;tw7=&amp;rnd=1563784092844&amp;py=0"></script><script src="/js/jquery/jquery-1.12.4.min.js"></script>
<script src="/giftcon/css/jquery/jquery-migrate-1.4.1.min.js"></script>
<script src="/giftcon/css/jquery/jquery.blockUI.js"></script>
<script src="/giftcon/css/jquery/jquery.form.js"></script>
<script src="/giftcon/css/jquery/jquery.cookie.js"></script>
<script src="/giftcon/css/jquery/swiper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

<!--  date-picker -->

<script type="text/javascript" src="/giftcon/css/jquery/jq.datepicker.init.js" charset="utf-8"></script>
<script type="text/javascript" src="/giftcon/css/jquery/jquery-ui.min.js" charset="utf-8"></script>

<!-- Common JS -->

<script type="text/javascript" src="d:/css/jquery/gnb.js"></script>

<!-- Include CSRF token for AJAX Requests -->
<script type="text/javascript">
$(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});
</script>

<!-- Global site tag (gtag.js) - Google Ads: 772239512 -->
<script async="" src="https://www.googletagmanager.com/gtag/js?id=AW-772239512"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'AW-772239512');
</script>

<!-- Criteo Script -->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
	<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
	<script type="text/javascript" src="/giftcon/css/jquery/brand_slide.js"></script>
	<script type="text/javascript" src="/giftcon/css/jquery/mbanner_slide.js"></script>
	<script type="text/javascript" src="/giftcon/css/jquery/banner_slide.js"></script>
	<script type="text/javascript" src="/giftcon/css/jquery/main_slide.js"></script>

	<style>
		ul.brandProdList li > p > span.prodName {white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
	</style>
	
	<!-- // Criteo Script Start ( 1.홈페이지 코드 ) -->
	<script type="text/javascript">
	var criteoScriptEmail = '';
	
	
	
	window.criteo_q = [];
	window.criteo_q.push(
		{ event: "setAccount", account: 58456 },
		{ event: "setEmail", email: criteoScriptEmail },
		{ event: "setSiteType", type: "d" },
		{ event: "viewHome" }
	);
	</script>
	<!--  Criteo Script End   -->
	
	<script>
	$(function(){ 
		$("#budgetBtn").click(function(){ 
			//잠깐 나타났다가 사라지는 함수
			//$.growlUI('타이틀', '내용'); 
			$.blockUI({ //html태그를 문자열로 적용해도 무관함 
				//message : "<table><tr><td>태그테스트</td></tr><table>" 
				message: $('#budgetSearch')
				//css 설정 
				,css: { border: 'none', textAlign: 'left' } 
				//모달창 외부 클릭시 닫기 
				,onOverlayClick: $.unblockUI });	}) 
		$("#closebtn").click(function(){ //모달창 닫기 
			$.unblockUI(); 
		}) 
	})

	</script>
</head>
</head>
<body>
	<header id="header">
		
		<div class="topBox">
			<div class="top">
				<h1 class="logo">
				<a href="/giftcon/main.conn">
				<img src="/giftcon/css/main.png" alt="쉐어콘"></a></h1>
				<div class="searchBox">
					<form id="goodsHeaderForm" name="goodsHeaderForm" action="/giftcon/goods/searchList.conn" method="GET">
						<fieldset>
							<legend>검색 바</legend>
							<label class="blind" for="search_txt">검색어 입력</label>
							<div>
								<input id="SearchKeyword" name="SearchKeyword" type="text" value="">
								<button class="btnSearch" type="submit">검색</button>
							</div>
						</fieldset>
					<div>
</div></form>
				</div>
				<form id="logoutFrm" name="logoutFrm" action="/common/logout.do" method="post">
				<ul class="snb">
					<%if(session.getAttribute("MEMBER_ID") != null) { %>
						<li><a href="/giftcon/logout.conn" class="logout" title="로그아웃"><span class="icoLogout"></span><em class="logState">로그아웃</em></a></li>
						<%if(Integer.valueOf(session.getAttribute("MEMBER_ADMIN").toString()) == 1){%>
							<li><a href="/giftcon/mypage.conn" class="mypage" title="마이페이지"><span class="icojoin"></span><em class="logState">마이페이지</em></a></li>
						<%} else  {%>
							<li><a href="/giftcon/adminMain.conn" class="adjoin" title="관리자페이지"><span class="icojoin"></span><em class="logState">관리자페이지</em></a></li>
						<%} %>
					<%}else {%>
						<li><a href="/giftcon/loginForm.conn" class="login" title="로그인"><span class="icoLogin"></span><em class="logState"></em>로그인</a></li>
						<li><a href="/giftcon/joinStep1.conn" class="join" title="회원가입"><span class="icojoin"></span><em class="logState">회원가입</em></a></li>
					<%} %>
					<li><a href="/giftcon/notice.conn" class="cs" title="고객센터"><span class="icoCs"></span><em class="logState">고객센터</em></a></li>
					<li class="exc last"><a href="/giftcon/cart/cartlist.conn" class="cart" title="장바구니"><span class="icoCart"><em class="counting" id="headerCartCount"><b><%=session.getAttribute("count") %></b></em></span><em class="logState">장바구니</em></a></li>
				</ul>
				<div>
</div></form>
			</div>
		</div>
		<nav class="gnb">
			<div class="gnbBox">
				<ul class="menu">
					<li align="center">
						<a href="/giftcon/goods/list.conn" title="모바일쿠폰샵 바로가기" class="" >전체 상품</a>
					</li>
					<li  align="center">
						<a href="/giftcon/eventList.conn" title="기획전/이벤트 바로가기" class="">이벤트</a>
						
						<!-- <ul class="smenu s02" style="display: none;">
							<li>
								<a href="/contents/promotionList.do" class="first">기획/테마전</a>
							</li>
							<li>
								<a href="/contents/eventList.do" class="first">이벤트</a>
							</li>
							<li>
								<a href="/contents/eventNoticeList.do">당첨자발표</a>
							</li>
						</ul> -->
					</li>
						<li>
								<a href="/giftcon/notice.conn" title="고객센터" class="">고객센터</a>
						</li>
						<li>
					<a href="#"  id="budgetBtn">
					맞춤 계산기</a>
						</li>
									</ul>
				
				
				 <!-- 띠 배너  -->
					
					<span id="img0" class="rightBanner" style="display: block;">
						<a href="http://ppurio.com/mgr/DFLanding.qri?page=CouponEvent&amp;type=cross2&amp;key=donut" target="_blank"><img src="/giftcon/images/mini-banner2.png" alt="" width="201"></a>
					</span>
				
					<span id="img1" class="rightBanner" style="display: none;">
						<a href="/contents/promotionList.do?tab=0"><img src="/giftcon/images/mini-banner2.jpg" alt="" width="201"></a>
					</span>
					 
				
			</div>
			<!--  <!-- 상단 사각 배너 -->
			<div class="sub_bg" style="display: none;"><p class="subBanner"><a href="https://www.donutbook.co.kr/intro/donutExchange.do"><img src="/3N1DATA01/donutbook/contents/banner/m151qtoe63a94d043b5x.jpg" alt="" width="201"></a></p></div>
			 
		</nav>
	</header>
	<div>
		${soldOut}
	</div>
	
	<div class="popupWrap w700" id="budgetSearch" style="cursor: default; display:none;" >
	<!-- start:title -->
	<div class="titArea" align="center">
		<h1 class="tit">예산검색하기</h1>
		<a href="" class="btnClose">닫기</a>
	</div>
	<!--/end:title -->
	<!-- start:contents -->
	<div class="contWrap">

		<form id="budgetForm" name="budgetForm" action="/index.do" method="POST">
			<input type="hidden" name="orderType">
			<input type="hidden" name="priceSearchStart" value="12960">
			<input type="hidden" name="priceSearchEnd" value="19440">
			<input type="hidden" value="${goods.GOODS_NUM}" id="GOODS_NUM">
			
 		<!-- start:calculate -->
		<div class="calculateArea">
			<p class="titTop">
				<span class="tit">예산 검색</span>
				<span class="btnAlign">
					<a href="#" class="btnSmlLineBlue2 w50" onclick="javascript:onSetInit(); return false;">초기화</a>
					<a href="#" class="btnSmlLineBlue2 w50" id="btnSearch">검색</a>
				</span>
			</p>
			<div class="budgetCal">
				<div class="calBox">
					<p class="tBox">
						<span class="icoMoney"></span>
						<span class="titTxt">총 예산은?</span>
					</p>
					<input onchange="calcul()" onkeyup="calcul()" type="number" class="ipt2 w146" id="budget" style="text-align:right;"> 원
				</div>
				<span class="icoDivision"></span>
				<div class="calBox">
					<p class="tBox">
						<span class="icoPeople"></span>
						<span class="titTxt">발송 할 인원 수</span>
					</p>
					<input on onchange="calcul()" onkeyup='calcul()' type="number" class="ipt2 w146" id="people" style="text-align:right;"> 명
				</div>
				<span class="icoEquals"></span>
				<div class="calBox last">
					<p class="tBox">
						<span class="icoPrice"></span>
						<span class="titTxt">예상되는 상품단가</span>
					</p>
					<input type="number" onkeydown="Enter_Check()" class="ipt2 w146 cutNumber"  id="price" style="text-align:right;" readonly=""  > 원
				</div>
			</div>
		</div>
		<!--/end:calculate -->
		<!-- start:search_result -->
		<p class="calculateResultTxt" style="display: none;">총 90건</p>
		<div class="calculateResult">
			<table summary="예산 검색 결과 표" class="tbL" id="tbBudgetSearchResult">
			  <colgroup>
				<col width="60px">
				<col width="139px">
				<col width="110px">
				<col width="232px">
				<col width="94px">
			  </colgroup>
			  <thead>
				<tr>
				  <th>선택</th>
				  <th><a href="#" name="btnOrderSearch">카테고리<span class="icoDown"></span></a></th>
				  <th><a href="#" name="btnOrderSearch">브랜드<span class="icoDown"></span></a></th>
				  <th><a href="#" name="btnOrderSearch">상품명<span class="icoDown"></span></a></th>
				  <th class="last"><a href="#" name="btnOrderSearch">판매가격<span class="icoDown"></span></a></th>
				</tr>
			   </thead>
			   <tbody><tr><td class="alignC1" colspan="5">조회된 상품이 없습니다.</td></tr></tbody>
			</table>
		</div>
		<!--/end:search_result -->
		
		<!-- start:btn -->
		<div class="popupBtns" style="display: none;">
			<a href="" class="btnMidLineBlue2 w154 mr10" id="btnGoodsDetail">선택상품 상세보기</a>
			<a href="" class="btnMidBgBlue2 w108" id="btnOrder">발송하기</a>
		</div>
		<!--/end:btn -->
		<div>
<input type="hidden" name="_csrf" value="2d681deb-020b-4c0f-bc82-6bb7017efa90">
</div></form>
	</div>
	<!--/end:contents -->
</div>
</body>
</html>