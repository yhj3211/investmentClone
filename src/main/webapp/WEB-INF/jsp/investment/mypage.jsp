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

	<div class="container">
	
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<div> 	
				<nav class="navbar navbar-expand-md navbar-dark bg-dark">
					<div class="w-75">
						<ul class="navbar-nav d-flex justify-content-between">	
							<li class="nav-item"><a class="nav-link" href="/post/postlist">메인으로</a></li>
							
							<li class="nav-item"><a class="nav-link" href="#">메모</a></li>
							
							<li class="nav-item"><a class="nav-link" href="#">바로가기</a>
								<ul class="d-none">
									<li><a href="https://finance.naver.com/">네이버 금융</a></li>
									<li><a href="http://finance.daum.net/">다음 금융</a></li>
									<li><a href="https://coinone.co.kr/?__cf_chl_jschl_tk__=pmd_B37e7nUJNegUbcXnzNtxyoW.H2ohmVAoYpQ4QfQLYJQ-1632993277-0-gqNtZGzNAdCjcnBszQjR">코인원</a></li>
								</ul>
							</li>
							
							
							<li class="nav-item"><a class="nav-link" href="/user/message">메세지</a></li>
						</ul>
					</div>
					<div style="width:68%" class="d-flex justify-content-end">
							<c:if test="${not empty userNickname }">
								<img src="https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003" width="30px" class="mr-3"></img>
								<div class="mr-3 text-white"><a href="/user/mypage" class="mr-1">${userNickname }</a>님</div>			
								<a href="/user/sign_out">로그아웃</a>			
							</c:if>
					</div>
				</nav>
		</div>
		
		<section style="min-height:300px;">
			<!-- 페이지 내용 -->
			<div id="infoBox" class="mt-3">
				<h5>회원 정보 보기</h5>
				<hr>
				
				<div class="justify-content-center">
					<div class="infoBoxChild d-flex border">
						<div class="border col-2 text-center">
							<h5>이름</h5>
						</div>
						
						<div class="ml-3">
							<small>${user.name }</small>
						</div>
					</div>
					
					<div class="infoBoxChild d-flex border">
						<div class="border col-2 text-center">
							<h5>닉네임</h5>
						</div>
						
						<div class="ml-3">
							<small>${user.nickname }</small>
						</div>
					</div>
					
					<div class="infoBoxChild d-flex border">
						<div class="border col-2 text-center">
							<h5>이메일</h5>
						</div>
						
						<div class="ml-3">
							<small>${user.email }</small>
						</div>
					</div>
					
					<div class="infoBoxChild d-flex border">
						<div class="border col-2 text-center">
							<h5>가입일</h5>
						</div>
						
						<div class="ml-3">
							<small>${user.createdAt }</small>
						</div>
					</div>
					
				</div>
			</div>
		</section>
		
		
	</div>
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
</body>
</html>