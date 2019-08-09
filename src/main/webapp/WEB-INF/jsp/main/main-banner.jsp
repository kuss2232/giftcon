<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	
<img src="/giftcon/images/main-banner1.png" id=mainImage alt="YsjImage" style="width:1100px;height:300px; 
margin-left:auto; margin-right:auto; display:block;">

<script>
var myImage=document.getElementById("mainImage");
var imageArray=["/giftcon/images/main-banner1.png","/giftcon/images/main-banner2.JPG","/giftcon/images/main-banner3.JPG","/giftcon/images/main-banner4.JPG"];
var imageIndex=0;

function changeImage(){
	myImage.setAttribute("src",imageArray[imageIndex]);
	imageIndex++;
	if(imageIndex>=imageArray.length){
		imageIndex=0;
	}
}
setInterval(changeImage,3000);
</script>
</body>
</html>
