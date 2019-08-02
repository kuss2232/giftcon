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
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" async="" src="https://www.googleadservices.com/pagead/conversion_async.js"></script><script src="https://atm.acecounter.com/ac.js?tid=128153CT-20-A&amp;hsn=www.donutbook.co.kr&amp;hrf=in&amp;dvp=0&amp;tgp=&amp;tn1=&amp;tn2=0&amp;tn3=0&amp;tw1=&amp;tw2=&amp;tw3=&amp;tw4=&amp;tw5=&amp;tw6=&amp;tw7=&amp;rnd=1563784092844&amp;py=0"></script><script src="/js/jquery/jquery-1.12.4.min.js"></script>
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
					<form id="goodsHeaderForm" name="goodsHeaderForm" action="/goods/searchList.do" method="GET">
						<fieldset>
							<legend>검색 바</legend>
							<label class="blind" for="search_txt">검색어 입력</label>
							<div>
								<input id="search_txt" name="searchKey" type="text" value="">
								<button class="btnSearch" type="submit">검색</button>
							</div>
						</fieldset>
					<div>
</div></form>
				</div>
				<form id="logoutFrm" name="logoutFrm" action="/common/logout.do" method="post">
				<ul class="snb">
					<%if(session.getAttribute("MEMBER_ID") != null){ %>
						<li><a href="/giftcon/logout.conn" class="logout" title="로그아웃"><span class="icoLogout"></span><em class="logState">로그아웃</em></a></li>
						<li><a href="관리자페이지" class="adjoin" title="관리자페이지"><span class="icojoin"></span><em class="logState">관리자페이지</em></a></li>
					<%}else{ %>
					<li><a href="/giftcon/joinStep1.conn" class="join" title="회원가입"><span class="icojoin"></span><em class="logState">회원가입</em></a></li>
					<li><a href="/giftcon/loginForm.conn" class="login" title="로그인"><span class="icoLogin"></span><em class="logState">로그인</em></a></li>
					<%} %>
					
					
					<li><a href="/giftcon/notice.conn" class="cs" title="고객센터"><span class="icoCs"></span><em class="logState">고객센터</em></a></li>
					<li class="exc last"><a href="/cart/cartlist.conn" class="cart" title="장바구니"><span class="icoCart"><em class="counting" id="headerCartCount"><b>0</b></em></span><em class="logState">장바구니</em></a></li>
				</ul>
				<div>
</div></form>
			</div>
		</div>
		<nav class="gnb">
			<div class="gnbBox">
				<ul class="menu">
					<li>
						<a href="/goods/mainShop.do" title="모바일쿠폰샵 바로가기" class="">모바일쿠폰샵</a>
						<ul class="smenu s01" style="display: none;">
							<li>
								<a href="/goods/mainShop.do" class="first">전체상품보기</a>
							</li>
							<li>
								<a href="/goods/brandShop.do">브랜드샵</a>
							</li>
							<li>
								<a href="/goods/bizShop.do">비즈전용상품관</a>
							</li>
							<li class="menuDelivery">
								<a href="/goods/brandShop.do?categoryNo=12&amp;pageNo=1">배송상품<span class="icoDelivery"></span></a>
							</li>
							<li>
								<a href="/goods/goodsNotice.do">상품문의</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="/contents/promotionList.do" title="기획전/이벤트 바로가기" class="">기획전/이벤트</a>
						<ul class="smenu s02" style="display: none;">
							<li>
								<a href="/contents/promotionList.do" class="first">기획/테마전</a>
							</li>
							<li>
								<a href="/contents/eventList.do" class="first">이벤트</a>
							</li>
							<li>
								<a href="/contents/eventNoticeList.do">당첨자발표</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="/mypage/myDonut.do" title="마이도넛북 바로가기">마이도넛북</a>
						<ul class="smenu s03" style="display: none;">
							<li>
								<a href="/mypage/orderList.do" class="first">주문내역보기</a>
							</li>
							<li>
								<a href="/mypage/myDeposit.do" class="first">적립금/도넛내역</a>
							</li>
							<li>
								<a href="/mypage/myTemplet.do" class="first">my배너관리</a>
							</li>
							<li>
								<a href="/mypage/myCoupon.do" class="first">my쿠폰조회</a>
							</li>
							<li>
								<a href="/mypage/addrGroupList.do" class="first">주소록관리</a>
							</li>
							<li>
								<a href="/mypage/userPwdCheck.do">회원정보 관리</a>
							</li>
						</ul>
					</li>
					<li class="last">
						<a href="/intro/serviceIntroduce.do" title="도넛북소개 바로가기">도넛북소개</a>
						<ul class="smenu s04" style="display: none;">
							<li>
								<a href="/intro/donutExchange.do" class="first">도넛교환소</a>
							</li>
							<li>
								<a href="/intro/gradeBenefit.do" class="first">등급별혜택소개</a>
							</li>
							<li>
								<a href="/intro/serviceIntroduce.do" class="first">서비스소개</a>
							</li>
							<li>
								<a href="/bbs/noticeList.do" class="last">고객센터</a>
							</li>
						</ul>
					</li>
				</ul>
				 <!-- 띠 배너  -->
	<!-- 				
						<span id="img0" class="rightBanner" style="display: block;">
							<a href="http://ppurio.com/mgr/DFLanding.qri?page=CouponEvent&amp;type=cross2&amp;key=donut" target="_blank"><img src="/3N1DATA01/donutbook/contents/banner/88ra54jdupp7fv05d03c.png" alt="" width="201"></a>
						</span>
					
						<span id="img1" class="rightBanner" style="display: none;">
							<a href="/contents/promotionList.do?tab=0"><img src="/3N1DATA01/donutbook/contents/banner/549g83zea3od2kbhhwhf.jpg" alt="" width="201"></a>
						</span>
					 -->
				
			</div>
			 <!-- 상단 사각 배너 -->
			<div class="sub_bg" style="display: none;"><p class="subBanner"><a href="https://www.donutbook.co.kr/intro/donutExchange.do"><img src="/3N1DATA01/donutbook/contents/banner/m151qtoe63a94d043b5x.jpg" alt="" width="201"></a></p></div>
			
		</nav>
	</header>
</body>
</html>