<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.highcharts.com/stock/highstock.js"></script>
	<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="/static/css/style.css">
<title>Insert title here</title>

	<!-- 그래프 스타일 -->
	<style>
		#graph01{
			width:300px;
			height:300px;
		}
		
		#contentBox{
			overflow:automysql;
			min-width:100%;
			max-height:500px;
			border:1px solid;
			}
		
		.img{
			width:150px;
			height:150px;
		}
			
	</style>
</head>
<body>

	<div class="container">
	
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	<hr>
	
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
			<div>
				<div id="container1" style="height:400px; min-width:310px"></div>
			</div>
			
			<div class="text-center">
			
				<h3>
					<img class="img" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20210805_238%2F16281124993662OrII_JPEG%2FS202108050418102847610ae7f20ac38_main.jpg&type=a340">
					기도합시다
					<img class="img" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fimage.nmv.naver.net%2Fblog_2020_12_03_3210%2F5f5ee4a1-351d-11eb-8385-48df37ae3dc4_01.jpg&type=ofullfill340_600">	
				</h3>
				
				<div>
					<div id="contentBox" class="form-control mb-3">
						<c:forEach var="hope" items="${hopeList}">
							<div class="mt-1 mb-1 border-radius d-flex">
								<div class="ml-1 mr-1">
									${hope.userNickname } :
								</div>
								<div>
									${hope.content}
								</div>
							</div>
						</c:forEach>
					</div>
						<input type="text" id="textInput" class="form-control" placeholder="기도를 남기세요!">	
				</div>
				<button id="submitBtn" type="submit" class="btn btn-block btn-info">존버는 승리하리라</button>
				
			</div>
		
		</section>
		
	</div>

	<script>
		function draw1(){
				var chartdata = [];
				$.getJSON('https://poloniex.com/public?command=returnChartData&currencyPair=BTC_ETH&start=1455699200&end=9999999999&period=14400', function (data) {
					$.each(data, function(i, item){
						chartdata.push([item.date*1000, item.open, item.high, item.low, item.close]);
					});
				}).done(function(){
					Highcharts.stockChart('container1',{
						title: {
							text: 'ETH/BTC'
						},
						rangeSelector: {
							buttons: [
								{type: 'day',count: 1,text: '1d'}, 
								{type: 'all',count: 1,text: 'All'}
							],
							selected: 2,
							inputEnabled: true
						},
						plotOptions: {
							candlestick: {
								downColor: 'blue',
								upColor: 'red'
							}
						},
						series: [{
							name: 'ETH/BTC',
							type: 'candlestick',
							data: chartdata,
							tooltip: {
								valueDecimals: 8
							}
						}]
					});
				});
			}
			draw1();
		
			
			//2번째 차트
			//*
	/* 	var chart;
		var series = [
			{ name: 'BTC', data: [] },
		];
		
		function ticker(idx){
			url = 'https://api.bithumb.com/public/ticker/' + series[idx].name + '_KRW';
			$.get(url, function(data, status){
				point = [new Date().getTime(), parseInt(data['data']['fluctate_24H'])];
				console.log(point);
			
				var series = chart.series[idx],
					shift = series.data.length > 20;
					chart.series[idx].addPoint(point, true, shift);
			}, 'json');
		}
		
		function requestData(){
			for(var idx in series){
				ticker(idx);
			}
			setTimeout(requestData, 150000);
		}
		
		chart = new Highcharts.Chart({
			chart: {
				renderTo: 'container2',
				defaultSeriesType: 'spline',
				events: {
					load: requestData
				}
			},
			title: {
				text: "빗섬 비트코인 라이브"
			},
			xAxis: {
				type: 'datetime',
				tickPixelInterval: 1500,
				maxZoom: 20 * 1000
			},
			yAxis: {
				minpadding: 0.2,
				maxPadding: 0.2,
				title: {
					text: 'price',
					margin: 80
				}
			},
			series: series
		}); */
	//	
		
	$(document).ready(function(){
		$("#submitBtn").on("click", function(){
			var content = $("#textInput").val().trim();
			
			$.ajax({
				type:"get",
				url:"/post/createHope",
				data:{"content":content},
				success:function(data){
					if(data.result == "success"){
						location.reload();
					}else{
						alert("기도 입력에 실패했습니다");
						return;
					}
				}, error:function(e){
					alert("error");
					console.log("error");
				}
			});
		});
		
	});
	
		</script>

</body>
</html>