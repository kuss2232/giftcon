<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">

		<div class="register-verify">
		<div class="guide">
			<section>
				<div class="title">
					<span class="pancoat"></span>
					<strong>giftcon 회원가입을 위해 본인인증을 시작합니다.</strong>
				</div>
				
			</section>
		</div>
		<div class="verify row">
	<section class="col-md-12">
				<div class="box-shadow">
					<div class="section-head left border">
						<h3 class="title">이메일 인증</h3>
					</div>
					<div class="section-body">
						<p>이메일 인증은 따로 정보를 저장하지 않습니다. 해당 이메일로 전송받은 인증 번호를 입력해서 인증을 받는 방법입니다.</p>
						<a href="/giftcon/joinStep1/modal_email.conn" class="button" target="modal" data-size="sm" data-label="이메일 인증">
							<span class="button-label">이메일 인증</span>
						</a>
					</div>
				</div>
			</section>
		</div>
	</div>

	<script>

	function email_code(){
		   var f = document.frm;
		   var email = f.emailId.value;
		   
		 	  if(email == '@') {
			      alert("이메일을 입력하세요.");
			   }else if(f.emailId.value==""){
			      alert("이메일을 정확히 입력하세요.");
			      console.log("로그 내용1");  
			   }else{
		    	  $.ajax({
		    	        type: "POST",
		    	        url: "./join/joinStep1/modal_email_auth",
		    	        data: ({mode:"email_code", email:email}),
		    	        
		    	        success: function(data) {
		    	        	console.log(data);
		    	        	if(data != 0){
		    	        		alert("이미 가입된 이메일입니다.다른이메일을 입력해주세요");
		            	}else{
		    	        		alert("인증번호를 요청하신 이메일로 발송했습니다.");
		    	        	}
		    	        	
		    	        	if(data != null)    {
		    	            	console.log("로그 내용2"+data);
		    	            }
		    	        },
		    	        error: function(e){
		    	         alert('error' + e);
		    	        }
		    	    });
		      }
		   
		}
	function member_send(){
	var f = document.frm;
	
	 var email = f.emailId.value;

	 if(email == '@') {
	      alert("이메일을 입력하세요.");
	   }else if(f.emailId.value){
	      alert("이메일을 정확히 입력하세요.");
	      console.log("로그 내용1");  
	   }else{
   		$.ajax({
      	 type: "POST",
       	 url: "./joinStep1/modal_email_auth_success",
      	  //data: ({Id:$("#Id").val(), Pwd:$("#Pwd").val()}),
      	  //contentType: "text/plain; charset=euc-kr",
      	  success: function(data) {
        		 /* alert("auth값받음"+data); */
   	     	 console.log("로그 내용1");
           	 if(data != null)    {
            		if(!f.sing_code.value){
        				alert("인증번호를 입력해 주세요");
        				f.sing_code.focus();
        			}else if(f.sing_code.value !=  data){
        				alert("인증번호가 맞지 않습니다.");

        			}else{
        				//alert("인증번호가 맞습니다.");
        				f.action = "/joinStep2";
        				f.submit(); 
        			}
         	   } else {
          	  	alert("data값없음"+data);
          	  	console.log("로그 내용3");
       	     }
     	   },
     	   error: function(e){
     	    alert('error' + e);
   	     }
   	 });
	}
}
</script>
</div>