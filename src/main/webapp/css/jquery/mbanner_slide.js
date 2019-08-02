$(function () {
	
		function partnerL (){
			var $wrap = $(".partnerBoxL"),
			$rollingContain = $(".partnerBoxL .rollBox"),
			
			bannerLen = $(".partnerBoxL .rollBox > a").length,
			bannerWidth = $(".partnerBoxL .rollBox > a").width(),
			currentIndex = 1,
			duration = 200,
			easing = "swing",
			interval = 6000,
			timer;
			
			if(bannerLen > 1){
				$rollingContain.css("width",  bannerWidth * (bannerLen + 2) + "px");
			} else {
				return false;
			}
			
			function showBannerAt (index){
				$rollingContain.stop().animate({left: -100 * index + "%"}, duration, easing, function(){
					function nPosition(){
						$rollingContain.css("left", -100 * index + "%");
					}
					if (index < 1){
						index = bannerLen;
						nPosition();
					} else if (index > bannerLen){
						index = 1;
						nPosition();
					}
					currentIndex = index;
					page_nav();
				});
			}
			
			function page_nav (){
				$(".partnerBoxL .pageNav span").each(function(){
					if($(this).hasClass("on")){
						$(this).removeClass("on");
					}
					$(".partnerBoxL .pageNav span").eq(currentIndex-1).addClass("on");
				});
			}
			
			$(".partnerBoxL  .pageNav span").on("click", function(event){
				event.preventDefault();
				$(".partnerBoxL .pageNav span").each(function(){
					if($(this).hasClass("on")){
						$(this).removeClass("on");
					}
				});
				$(this).addClass("on");
				showBannerAt($(this).index()+1);
			});
			
			function startTimer () {
				timer = setInterval(function () {
					var nextIndex = currentIndex + 1;
					showBannerAt(nextIndex);
				}, interval);
			}
			
			function stopTimer () {
				clearInterval(timer);
			}
			startTimer();
			
			$rollingContain.prepend($(".partnerBoxL .rollBox > a").last().clone());
			$rollingContain.append($(".partnerBoxL .rollBox > a").eq("1").clone());
			$rollingContain.css({"left": -bannerWidth});
			
		}
		
		function partnerR (){
			var $wrap = $(".partnerBoxR"),
			$rollingContain = $(".partnerBoxR .rollBox"),
			
			bannerLen = $(".partnerBoxR .rollBox > a").length,
			bannerWidth = $(".partnerBoxR .rollBox > a").width(),
			currentIndex = 1,
			duration = 200,
			easing = "swing",
			interval = 6000,
			timer;
			
			if(bannerLen > 1){
				$rollingContain.css("width",  bannerWidth * (bannerLen + 2) + "px");
			} else {
				return false;
			}
			
			function showBannerAt (index){
				$rollingContain.stop().animate({left: -100 * index + "%"}, duration, easing, function(){
					function nPosition(){
						$rollingContain.css("left", -100 * index + "%");
					}
					if (index < 1){
						index = bannerLen;
						nPosition();
					} else if (index > bannerLen){
						index = 1;
						nPosition();
					}
					currentIndex = index;
					page_nav();
				});
			}
			
			function page_nav (){
				$(".partnerBoxR .pageNav span").each(function(){
					if($(this).hasClass("on")){
						$(this).removeClass("on");
					}
					$(".partnerBoxR .pageNav span").eq(currentIndex-1).addClass("on");
				});
			}
			
			$(".partnerBoxR  .pageNav span").on("click", function(event){
				event.preventDefault();
				$(".partnerBoxR .pageNav span").each(function(){
					if($(this).hasClass("on")){
						$(this).removeClass("on");
					}
				});
				$(this).addClass("on");
				showBannerAt($(this).index()+1);
			});
			
			function startTimer () {
				timer = setInterval(function () {
					var nextIndex = currentIndex + 1;
					showBannerAt(nextIndex);
				}, interval);
			}
			
			function stopTimer () {
				clearInterval(timer);
			}
			startTimer();
			
			$rollingContain.prepend($(".partnerBoxR .rollBox > a").last().clone());
			$rollingContain.append($(".partnerBoxR .rollBox > a").eq("1").clone());
			$rollingContain.css({"left": -bannerWidth});
		}
		
		partnerL();
		partnerR();
		
		
});	