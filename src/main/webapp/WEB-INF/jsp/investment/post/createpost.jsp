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
	
	<section class="mt-5 d-flex justify-content-center">
		<!-- 바깥 틀 -->
		<div id="inputCard" class="card border border-radius w-75">
			<!-- 제목 -->
			<div>
				<input type="text" id="titleInput" class="form-control mt-3" placeholder="제목">
			</div>
			<!-- /제목 -->
		
			<!-- 내용 -->
			<div class="mt-3">
				<textarea id="contentInput" class="form-control non-resize" placeholder="내용을 입력하세요"></textarea>
			</div>
			<!-- /내용 -->
			
			<!-- 파일 첨부, 입력 버튼 -->
			<div class="d-flex justify-content-between mt-3">
				<div>
					<input id="fileInput" type="file">
				</div>
				
				<div class="d-flex justify-content-between">
					<div>
						<button id="postListBtn" type="button" class="mb-2 btn mr-3 btn-secondary">돌아가기</button>
					</div>
				
					<div>
						<button id="inputBtn" type="button" class="btn btn-secondary">글 쓰기</button>
					</div>
				</div>
			</div>
		</div>
			
			<!-- /파일 첨부, 입력 버튼 -->
		<!-- /바깥 틀 -->
	</section>
			
		<div class="mt-5"></div>	
			
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#postListBtn").on("click", function(){
				location.href="/post/postlist";
				
			});
			
			$("#inputBtn").on("click", function(){
				
			let content = $("#contentInput").val().trim();
			let title = $("#titleInput").val();
			
			if(title == "" || title == null){
				alert("제목을 입력해주세요");
				return;
			}
			
			if(content == "" || content == null){
				alert("내용을 입력해주세요");
				return;
			}
			
			if($("#fileInput")[0].files.length == 0){
				$("#fileInput").add(" ");
			}
			
			var formData = new FormData();
			formData.append("file", $("#fileInput")[0].files[0]);
			formData.append("content", content);
			formData.append("title", title);
	
			$.ajax({
				enctype: 'multipart/form-data',
				type:"Post",
				url:"/post/create",
				processData: false,
				contentType: false,
				data:formData,
				success:function(data){
					if(data.result == "success"){
						alert("글 작성이 완료됐습니다");
						location.href="/post/postlist";
					}else{
						alert("글 작성에 실패했습니다");
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
	