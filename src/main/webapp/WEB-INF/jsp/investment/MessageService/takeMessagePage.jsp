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
	
		<section>
		
			<div class="mt-3 mb-3">
				<button onclick="location.href='/user/takeMessagePage/'">받은 메세지함</button>
				<button onclick="location.href='/user/sendMessagePage/'">보낸 메세지함</button>
			</div>
			
			<h3>받은 메세지</h3>
			
			<table class="table">
				<tr>
					<td class="col-3">보낸 사람</td>
					<td class="col-4">내용</td>
					<td class="col-3">날짜</td>
					<td class="col-3"></td>
				</tr>
			<c:forEach var="takeList" items="${takeMessageList }">
				<tr>
					<td><a href="/user/message?id=${user.id }">${takeList.sendUserNickname}</a></td>
					<td>${takeList.content}</td>
					<td>${takeList.createdAt }</td>
					<td><a href="#" id="deleteHref" class="text-danger">메세지 삭제</a></td>
				</tr>
			</c:forEach>
			</table>
		</section>
	
	<hr>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>	
	</div>
	
	<script>
		$(document).ready(function(){
		
			$("#deleteHref").on("click", function(){
				var result = confirm("정말로 삭제하겠습니까?");
				//예를 눌렀을 때
					if(result){
						$.ajax({
							type:"get",
							url:"/user/deleteMessage",
							data:{},
							success:function(data){
							if(data.result == "success"){
								alert("삭제 성공");
								location.reload();
							}else{
								alert("삭제 실패");
							}
						}, error:function(e){
							alert("error");
						}
				});
			//아니오를 눌렀을 때
			}else{
				location.reload();
			}
			
		});
		});
	</script>
</body>
</html>
	
	