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
<meta charset="UTF-8">
<title>글 화면</title>
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
	
	<section class="mt-3 w-75 d-flex">
		
		<div id="contentBox" style="width:100%" class="container" data-post-Id="${post.id }">
				
				<!-- 제목 -->
				<hr>
				<div class="mb-3 w-100">${post.title }</div>
				<hr>
				
				<!-- 내용 -->
				<div style="height: 300px">${post.content }</div>
				<hr>
				
			<!-- 댓글 인풋 -->
				<div class="mb-4">
					<div class="d-flex">
						<textarea id="commentInput" class="form-control non-resize"></textarea>
						<button id="commentBtn" type="button" class="btn btn-secondary ml-3">등록</button>
					</div>
					<div class="mt-3 d-flex justify-content-between">
						<div class="col-2">
							<button id="likeBtn" type="button" class="btn btn-info" data-post-id="${post.id }">추천 ${likeCount }개</button>
						</div>
						<button type="button" class="forPost col-2 btn btn-info">목록으로</button>
					</div>
				
			<c:forEach var="comment" items="${commentList }">
					<div class="mt-3">
					
						<div class="mb-3">
							${comment.userNickname }
							<small class="ml-3">
								${comment.createdAt }
							</small>
						</div>
						
						<div class="mb-1">
							${comment.content }
						</div>
						
						<hr>
						
					</div>
					
			</c:forEach>
			
				</div>
		</div>
	</section>
	
</div>

<script>
	$(document).ready(function(){
		
		$(".forPost").on("click", function(){
			location.href="/post/postlist";
		});
		
		$("#commentBtn").on("click", function(){
			var content = $("#commentInput").val().trim();
			var postId = ${post.id};
			
				if(content == "" || content == null){
				alert("내용을 입력해주세요");
				return;
			}
			
			$.ajax({
				type:"get",
				url:"/comment/create",
				data:{"content":content, "postId":postId},
				success:function(data){
					if(data.result == "success"){
						location.reload();
					}else{
						alert("작성 실패");
					}
				}, error:function(e){
					alert("error");
				}
				
			});
		});
		
		$("#likeBtn").on("click", function(){
			
			var postId = ${post.id};
			
			$.ajax({
				type:"get",
				url:"/post/like",
				data:{"postId":postId},
				success:function(data){
					if(data.like){
						location.reload();
					}else{
						location.reload();
					}
				}, error:function(e){
					alert("error");
				}
				
				
			});
		});
	});

</script>

</body>
</html>