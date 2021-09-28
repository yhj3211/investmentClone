<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<header class="d-flex align-items-center justify-content-between mt-3">
	<h2 class="ml-3">코인모아</h2>
	<c:if test="${not empty userName }">
		<div class="d-flex">
			<image src="https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003" width="30px" class="mr-3"></image>
			<div class="mr-4">${userName }님 <a href="/user/sign_out">로그아웃</a> </div>
		</div>
	</c:if>
</header>
<hr>