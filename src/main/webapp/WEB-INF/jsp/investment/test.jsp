<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="/static/css/style.css">
		
		
		
	<meta charset="UTF-8">
	
	<style>
*{
	margin: 0 auto;
	padding: 0;
	list-style: none;
	color: #000000;
	font-size: 20px;
}
body{
	width: 1400px;
}
a{
	display: block;
	text-decoration: none;
}
nav{
	width: 1000px;
}
.menu>li{
	float: left;
	width: 250px;
	height: 40px;
	background-color: #70a0cf;
}
.menu>li>a{
	line-height: 40px;
	text-align: center;
	font-weight: bold;
	color: #ffffff;			
}
.menu>li:hover>a{
	background-color: #84acd3;
}
.submenu{
	display: none; /* 마지막에 적기 */
}
.submenu>li{
	width: 250px;
	height: 40px;
	background-color: #d7eafd;
}
.submenu>li>a{
	line-height: 40px;
	font-size: 18px;
	text-align: center;
	color: #70a0cf;
}
.submenu>li:hover>a{
	text-decoration: underline;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<nav>
	  <ul class="menu">
	    <li><a href="#">메인메뉴1</a>
	      <ul class="submenu">
	        <li><a href="#">서브메뉴1-1</a></li>
	        <li><a href="#">서브메뉴1-2</a></li>
	        <li><a href="#">서브메뉴1-3</a></li>
	        <li><a href="#">서브메뉴1-4</a></li>
	      </ul>
	    </li>
	    
	    <li><a href="#">메인메뉴2</a>
	      <ul class="submenu">
	        <li><a href="#">서브메뉴2-1</a></li>
	        <li><a href="#">서브메뉴2-2</a></li>
	        <li><a href="#">서브메뉴2-3</a></li>
	        <li><a href="#">서브메뉴2-4</a></li>
	      </ul>
	    </li>
	    
	    <li><a href="#">메인메뉴3</a>
	      <ul class="submenu">
	        <li><a href="#">서브메뉴3-1</a></li>
	        <li><a href="#">서브메뉴3-2</a></li>
	        <li><a href="#">서브메뉴3-3</a></li>
	        <li><a href="#">서브메뉴3-4</a></li>
	      </ul>
	    </li>
	    
	    <li><a href="#">메인메뉴4</a>
	      <ul class="submenu">
	        <li><a href="#">서브메뉴4-1</a></li>
	        <li><a href="#">서브메뉴4-2</a></li>
	        <li><a href="#">서브메뉴4-3</a></li>
	        <li><a href="#">서브메뉴4-4</a></li>
	      </ul>
	    </li>
	  </ul>
	</nav>
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
jQuery(document).ready(function(){
  $('.menu>li').mouseover(function(){
    $(this).find('.submenu').stop().slideDown(500);
  }).mouseout(function(){
    $(this).find('.submenu').stop().slideUp(500);
  });
});
</script>
    
</body>
</html>