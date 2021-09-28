<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap" class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="content d-flex justify-content-center">
			<div class="login-box d-flex justify-content-center align-items-center">
				<div class="w-100">
				
					<h1 class="text-center">로그인</h1>
					
					<form type="post">
					<input type="text" id="loginIdInput" class="form-control mt-3" placeholder="아이디">
					<input type="password" id="passwordInput" class="form-control mt-3" placeholder="패스워드">
					</form>
					<button id="loginBtn" type="submit" class="btn btn-success btn-block mt-3">로그인</button>
					<div class="mt-3 text-right" ><a href="/user/sign_up">회원가입</a></div>
				</div>

			</div>
				
		</section>
		<div class="mt-5"></div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
<script>
	$(document).ready(function(){
		
		$("#loginBtn").on("click", function(){
			var loginId = $("#loginIdInput").val();
			var password = $("#passwordInput").val();
			
			$.ajax({
				type:"post",
				url:"/user/signin",
				data:{"loginId":loginId, "password":password},
				success:function(data){
					if(data.result == "success"){
						location.href="/post/postlist";
					}else{
						alert("아이디 비밀번호를 확인해 주세요");
					}
				}, error:function(e){
					alert("시스템 에러");
				}
				
			
			});
			
		});
		
	});


</script>

</body>
</html>