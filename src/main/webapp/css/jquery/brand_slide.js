$(function(){
	var list=$(".brandList");
	var show_num=6;
	var num=0;
	var total=$(">li",list).size();
	var li_width=$("li:first",list).width();
	var easing = "swing";
	
	var copyObj=$(">li:lt("+show_num+")",list).clone();
	list.append(copyObj);
	
	$(".btnNextBrand").on("click",function(){
		if(num==total){
			num=0;
			list.css("margin-left",num);
		}
	
		num++;
		
		list.stop().animate({marginLeft:-li_width*num+"px"},500,easing);
		return false;
	});

	$(".btnPrevBrand").on("click",function(){
		if(num==0){
			num=total;
			list.css("margin-left",-num*li_width+"px");
		}
	
		num--;
		
		list.stop().animate({marginLeft:-li_width*num+"px"},500);
		return false;
	});
});