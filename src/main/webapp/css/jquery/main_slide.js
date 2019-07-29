$(document).ready(function(){
		
        var $slideWap = $("div.joinWrap"),
			$slides = $(".joinArea").find('div'),
            $nav = $slideWap.find('div.pageNav'),
			$prev = $slideWap.find("span.arrowL"),
			$next = $slideWap.find("span.arrowR"),
			
			slideCount = $slides.length,  
            currentIndex = 0,
			duration = 200,
			interval = 10000,
			easing = "easeInQuad",
			timer;             
		
		if(slideCount <= 1){
			$nav.hide();
			$prev.hide();
			$next.hide();
		} 
		
		function goToSlide (index){
			var nowImg = $slides.eq(index);
			nowImg.fadeIn(duration, easing);
			$slides.not(nowImg).fadeOut(duration, easing);
			
			currentIndex = index;
			tabMenu();
			
		}
        
		function tabMenu (){
			$nav.find("span").removeClass("on").eq(currentIndex).addClass("on");
		}
		
		function startTimer (){
			timer = setInterval(function(){
				var nextIndex = currentIndex + 1;
				if(nextIndex > slideCount -1){
					nextIndex = 0;
				}
				goToSlide(nextIndex);
			}, interval)
		}
        
		function stopTimer(){
			clearInterval(timer);
		}
		
		
		$nav.find("span").on("click", function(event){
			event.preventDefault ? event.preventDefault() : (event.returnValue = false);
			$nav.find("span").each(function(){
				if($(this).hasClass("on")){
					$(this).removeClass("on");
				}
			});
			$(this).addClass("on");
			goToSlide($(this).index());
		});
		
		$prev.on("click", function(event){
			event.preventDefault ? event.preventDefault() : (event.returnValue = false);
			currentIndex = currentIndex - 1;
			if( currentIndex < 0 ){
				currentIndex = slideCount - 1;
			}
			goToSlide(currentIndex);
		});
		$next.on("click", function(event){
			event.preventDefault ? event.preventDefault() : (event.returnValue = false);
			currentIndex = currentIndex + 1;
			if( currentIndex > slideCount - 1 ){
				currentIndex = 0;
			}
			goToSlide(currentIndex);
		}); 
			
		
		
		goToSlide(currentIndex);
		startTimer();
		
});