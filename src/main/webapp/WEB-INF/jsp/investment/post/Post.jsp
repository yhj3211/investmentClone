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
	
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
	<hr>
	
	<div> 	
			<nav class="navbar navbar-expand-md navbar-dark bg-dark">
				<div class="w-75 top-menu">
					<ul class="navbar-nav d-flex justify-content-between">	
						<li class="nav-item"><a class="nav-link" href="/post/main">메인으로</a></li>
						
						<li class="nav-item"><a class="nav-link" href="/post/postlist">게시판</a></li>
						
						<li class="nav-item"><a class="nav-link" href="/user/takeMessagePage">메세지</a></li>
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
	
	<section class="mt-3 w-75 d-flex">
		
		<div id="contentBox" style="width:100%" class="container" data-post-Id="${post.id }" style="min-height:300px;">
				
				<!-- 제목 -->
				<hr>
					<div class="d-flex justify-content-between">
						<h4>${post.title }</h4>
							<div class="">
									${post.userNickname }
									<c:if test="${post.userId eq userId }">
										<a class="mr-2 text-danger ml-2" href="#" id="deletePostBtn">
											글 삭제
										</a>
										<a class="text-dark" href="/post/adjust_Post?id=${post.id }" id="adjustPostBtn">
											글 수정
										</a>
									</c:if>
							</div>
					</div>
				<hr>
				
				<!-- 내용 -->
				<div>
					<div>
						${post.content }
					</div>
					
					<!-- 이미지 파일 박스 -->
					
					<c:if test="${not empty post.imagePath  }">
						<div>
							<img src="${post.imagePath}" style="width:800px; height:400px;">
						</div>
					</c:if>
					
					<small>
						
					</small>
					
				</div>
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
						<button id="postlistBtn" type="button" class="forPost col-2 btn btn-info">목록으로</button>
					</div>
				
			<c:forEach var="comment" items="${commentList }">
					<div class="mt-3">
					
						<div class="mb-3">
							<a href="/user/message/id?=${user.id }">${comment.userNickname }</a>
							<small class="ml-3">
								${comment.createdAt }
							</small>
							
							<c:if test="${comment.userId eq userId }">
								<small>
									<a href="#" id="deleteCommentBtn" class="text-danger">
										삭제
									</a>
								</small>
							</c:if>
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

<!-- modal
	<div class="modal fade" id="deletePostModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dailog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body text-center">
						<a href="#" id="deletePostBtn">삭제하기</a>
				</div>
			</div>
		</div>
	</div>
-->

<script>
	$(document).ready(function(){
		
		 /* $('.navbar-nav>li').mouseover(function(){
			  $(this).children().stop().slideDown(100);
			  }).mouseout(function(){
				  $(this).children().stop().slideDown(100);
			  });
			});
		*/	
		
		if(${userId} == "" || ${userId} == null){
			location.href="/user/sign_in";
		}
		
		$(".forPost").on("click", function(){
			location.href="/post/postlist";
		});
		
		//글 삭제 버튼 보이기 여부
		
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
			
			if(${userId} == ${post.userId}){
				alert("자신의 게시글엔 추천을 할 수 없습니다");
				return;
			}
					
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
		
		$("#deleteCommentBtn").on("click", function(){
				var postId = ${post.id};	
			
			var result = confirm("정말로 삭제하겠습니까?");
			if(result){
			$.ajax({
				type:"get",
				url:"/comment/deleteComment",
				data:{"postId":postId},
				success:function(data){
					if(data.result == "success"){
						location.reload();
					}else{
						alert("댓글 삭제에 실패했습니다");
					}
				}, error:function(e){
					alert("error");
				}
					
			});
		}else{
			location.reload();
		}
			
		});
		
		$("#deletePostBtn").on("click", function(){
			
			var result = confirm("정말로 삭제하겠습니까?");
			if(result){
				var postId = ${post.id};
				$.ajax({
					type:"get",
					url:"/post/deletePost",
					data:{"postId":postId},
					success:function(data){
						if(data.result == "success"){
							alert("글 삭제를 성공했습니다!");
							location.href="/post/postlist";
						}else{
							alert("글 삭제에 실패했습니다!");
							location.reload();
						}
					}, error:function(e){
						alert("시스템 에러");
					}
				});
			}
			else{
				location.reload();
			}
		
			
		});
	});

</script>

</body>
</html>