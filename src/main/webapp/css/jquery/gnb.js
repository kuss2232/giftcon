$(document).ready(function(){
	var $gnbArea = $("nav.gnb"),
		$gnbBg = $gnbArea.find(".sub_bg"), 
		$gnbMenu = $("ul.menu > li > a"), 
		$subArea = $("ul.menu li ul"), 
		$sMenu = $("ul.menu > li > ul li a"), 
		
		duration = 200, 
		easing = "swing";  
		
	$gnbMenu.on("mouseover", function(){
		$gnbBg.hide();
		$gnbMenu.removeClass("on");
		$(this).addClass("on");
		if($gnbBg.hasClass("on")){
			return false;
		}
		$gnbBg.show();
		$subArea.show();
		$sMenu.on("mouseover focus", function(){
			$gnbMenu.removeClass();
			$(this).parent().parent().siblings("a").addClass("on");
		});	
	});
	
	$gnbArea.on("mouseleave", function(){
		$gnbMenu.removeClass("on");
		$gnbBg.hide();
		$subArea.hide();
	});
	
});
