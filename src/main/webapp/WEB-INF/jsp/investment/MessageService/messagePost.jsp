<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
						<li class="nav-item"><a class="nav-link" href="/post/main">메인으로</a></li>
						
						<li class="nav-item"><a class="nav-link" href="/post/postlist">게시판</a></li>
						
						<li class="nav-item"><a class="nav-link" href="#">바로가기</a>
							<ul class="d-none">
								<li><a href="https://finance.naver.com/">네이버 금융</a></li>
								<li><a href="http://finance.daum.net/">다음 금융</a></li>
								<li><a href="https://coinone.co.kr/?__cf_chl_jschl_tk__=pmd_B37e7nUJNegUbcXnzNtxyoW.H2ohmVAoYpQ4QfQLYJQ-1632993277-0-gqNtZGzNAdCjcnBszQjR">코인원</a></li>
							</ul>
						</li>
				
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

		<section class="mb-5">
				<div class="d-flex justify-content-center">
					<div class="w-75 mt-3">
						<div>
							받는사람
							<br>
							${param.nickname }
						</div>
						<hr>
						<textarea id="contentInput" class="non-resize form-control" name="content"></textarea>
						<button id="sendBtn" type="button" class="btn-secondary btn form-control">전송</button>
					</div>
				</div>
		</section>

	<hr>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>

	<script>
		$(document).ready(function(){
			
			
			$("#sendBtn").on("click", function(){
				var sendUserId = ${user.id};
				var takeUserId = ${param.id};
				var sendUserNickname = "${user.nickname}";
				var takeUserNickname = "${param.nickname}";
				var content = $("#contentInput").val().trim();
				
				if(takeUserId == "" || takeUserId == null){
					alert("받는 사람을 입력해주세요");
					return;
				}
				
				if(content == "" || content == null){
					alert("내용을 입력해주세요");
					return;
				}
				
				if(takeUserId == sendUserId){
					alert("자신에게는 메세지를 보낼 수 없습니다");
					//크롬에선 location.href=() 괄호 형태로 진행했을 때 에러가 남
					window.location.href="/post/postlist";
				}
				
				$.ajax({
					type:"get",
					url:"/user/sendMessage",
					data:{"takeUserId":takeUserId, "content":content, "sendUserId":sendUserId, 
							"sendUserNickname":sendUserNickname, "takeUserNickname":takeUserNickname},
					success:function(data){
						if(data.result == "success"){
							alert("메시지 전송 완료");
							location.href="/post/postlist";
						}else{
							alert("메시지 전송 실패");
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