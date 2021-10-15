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
		
		<section class="d-flex justify-content-center">
			<div class="signup-box d-flex align-items-center">
				<div class="w-100">
					<h2 class="text-center">회원가입</h2>
					<div class="text-center"><small class="text-center"><a href="/user/sign_in">로그인 화면으로 돌아가기</a></small></div>
					
					<hr>
					
					
					<div class="d-flex align-items-center">
						<input type="text" id="loginIdInput" class="form-control mt-3 mr-3" placeholder="아이디">
						<button type="submit" id="idCheck" class="btn btn-info mt-3">중복체크</button>
					</div>
					
					<div>
						<small id="Duptrue" class="text-danger d-none">중복된 ID입니다.</small>
						<small id="Dupfalse" class="d-none">회원가입 가능한 ID입니다.</small>					
					</div>
					
					<input type="password" id="passwordInput" class="form-control mt-3" placeholder="패스워드">
					<input type="password" id="passwordConfirmInput" class="form-control mt-3" placeholder="패스워드 확인">
					<small id="errorPassword" class="text-danger d-none">비밀번호가 일치하지 않습니다.</small>
					<div class="d-flex align-items-center">
						<input type="text" id="nicknameInput" class="form-control mt-3 mr-3" placeholder="닉네임">
						<button type="submit" id="nickNameCheck" class="btn btn-info mt-3">중복체크</button>
					</div>
					<div>
						<small id="nickNameDuptrue" class="text-danger d-none">중복된 닉네임입니다.</small>
						<small id="nickNameDupfalse" class="d-none">회원가입 가능한 닉네임입니다.</small>					
					</div>
					<input type="text" id="nameInput" class="form-control mt-3" placeholder="이름">
					<input type="text" id="emailInput" class="form-control mt-3" placeholder="이메일">
					
					<button type="submit" id="signUpBtn" class="btn btn-info btn-block mt-3">회원가입</button>
				</div>
			</div>
		</section>
		
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	<script>
	$(document).ready(function(){
			
			var idcheck = false;
	
			var nicknameCheck = false;
			
		$("#passwordConfirmInput").blur(function(){
			var password = $("#passwordInput").val();
			var checkPassword = $("#passwordConfirmInput").val();
			
			if(password != checkPassword){
				$("#errorPassword").removeClass("d-none");
			}
			
			if(password == checkPassword){
				$("#errorPassword").addClass("d-none");
			}
		});
			
		$("#signUpBtn").on("click", function(){
			var loginId = $("#loginIdInput").val();
			var password = $("#passwordInput").val();
			var checkPassword = $("#passwordConfirmInput").val();
			var nickname = $("#nicknameInput").val();
			var name = $("#nameInput").val();
			var email = $("#emailInput").val();
			
			if(loginId == "" || loginId == null){
				alert("아이디를 입력해주세요!");
				return;
			}
			
			if(password == "" || password == null){
				alert("비밀번호 입력해주세요!");
				return;
			}
			
			if(idcheck == false){
				alert("아이디 중복확인을 해 주세요");
				return;
			}
			
			if(nickname == "" || nickname == null){
				alert("아이디를 입력해주세요!");
				return;
			}
			
			if(nicknameCheck == false){
				alert("닉네임 체크를 해 주세요!");
				return;
			}
			
			if(email == "" || email == null){
				alert("아이디를 입력해주세요!");
				return;
			}
			
			if(name == "" || name == null){
				alert("아이디를 입력해주세요!");
				return;
			}
		
			$.ajax({
				type:"post",
				url:"/user/signup",
				data:{"loginId":loginId, "password":password, "nickname":nickname, "email":email, "name":name},
				success:function(data){
					if(data.result == "success"){
						alert("회원가입에 성공했습니다!");
						location.href="/user/sign_in";
					}else{
						alert("회원가입애 실패했습니다!");
					}
				}, error:function(e){
					alert("시스템 에러");
				}
			});
			});
			
			$("#idCheck").on("click", function(){
				var loginId = $("#loginIdInput").val();
				
				if(loginId == "" || loginId == null){
					alert("아이디를 입력해주세요!");
					return;
				}
			
				$.ajax({
					type:"get",
					url:"/user/idDuplicate",
					data:{"loginId":loginId},
					success:function(data){
						if(data.result == "success"){
							$("#Duptrue").removeClass("d-none");
							$("#Dupfalse").addClass("d-none");
						}else{
							idcheck = true;
							$("#Duptrue").addClass("d-none");
							$("#Dupfalse").removeClass("d-none");
						}
					}, error:function(e){
						alert("시스템 에러");
					}
					
				});		
			
		});
			
		$("#nickNameCheck").on("click", function(){
			var nickname = $("#nicknameInput").val();
			
			if(nickname == "" || nickname == null){
				alert("닉네임을 입력해주세요!");
				return;
			}
			
			$.ajax({
				type:"get",
				url:"/user/nicknameDup",
				data:{"nickname":nickname},
				success:function(data){
					if(data.result == "success"){
						$("#nickNameDuptrue").removeClass("d-none");
						$("#nickNameDupfalse").addClass("d-none");
					}else{
						nicknameCheck = true;
						$("#nickNameDupfalse").removeClass("d-none");
						$("#nickNameDuptrue").addClass("d-none");
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
	