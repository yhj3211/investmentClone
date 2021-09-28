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
	
	<header class="mt-3">
		<div class="d-flex">
			<h2 class="ml-3">코인모아</h2>
		</div>
	</header>
	<hr>
	
	<div>
			<nav class="navbar navbar-expand-md navbar-dark bg-dark">
				<div>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#">메인으로</a></li>
						<li class="nav-item"><a class="nav-link" href="#">메모</a></li>
						<li class="nav-item"><a class="nav-link" href="#">바로가기</a></li>
						<li class="nav-item"><a class="nav-link" href="#">주식 화면으로</a></li>
					</ul>
				</div>
					<div style="width:68%" class="d-flex justify-content-end">
						<c:if test="${not empty userNickname }">
							<img src="https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003" width="30px" class="mr-3"></img>
							<div class="mr-3 text-white">${userNickname }님</div>		
							<a href="/user/sign_out">로그아웃</a>			
						</c:if>
					</div>
				</nav>
	</div>

	<section class="mt-3 ml-5">
		<c:forEach var="post" items="${postList}">
		<div id="postBox" style="width:75%" class=" d-flex mt-5">
				<div class="text-center d-flex align-items-center">
					${post.likecount }
				</div>
				<img src="https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003" class="ml-3" style="height:50px">
			<div class="ml-3">
				<div>
					<a href="/post/detail_post?id=${post.post.id }">
						${post.post.title }
					</a>
				</div>
				<div>
					<small>${post.post.createdAt }</small>
					<small class="ml-3">${post.post.userNickname }</small>
				</div>
			</div>
		
		</div>
		</c:forEach>
		

		
		
	<!-- 검색 -->
	
	</section>
	<div class="con">
		<form name="searchForm" method="get" action="/post/postlist">
	        <div class="d-flex justify-content-center mt-5" style="height:30px">
	                <input name="search" type="text" class="col-3 form-control" placeholder="검색어를 입력하세요" value="${search }">
	                <input type="submit" id="searchBtn" class="btn btn-secondary" value="검색">
	        </div>
    	</form>
	</div>
		<div class="mt-5" class="d-flex mr-3">
			<button type="button" class="ml-3 btn justify-content-end" onclick="location.href=`/user/create_Post`">글 쓰기</button>
		</div>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script>
		$(document).ready(function(){
			
		});
	
	</script>
	

</body>
</html>