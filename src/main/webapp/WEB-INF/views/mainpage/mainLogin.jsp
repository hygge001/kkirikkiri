<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>끼리끼리</title>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet" href="/css/kkirikkiri.css" />

<script src="/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function() {
		
	}); // ready end
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/mainpage/mainHeaderLogin.jsp" %>	
	<main>
		<section class="main-banner row">
			<div class="col-1"></div>
			<div class="col-3">
				<img src="images/main_banner.png" alt="끼리끼리 배너"> 
			</div>	
			<div class="col-2"></div>
			<div class="banner-phrase col-5">
				<h1>친구도 취미도<br> <b>끼리끼리</b>에서</h1>
				<h6>나와 같은 관심사를 가진 사람들과 <br>가장 가까운 곳에서 소모임을 시작해보세요!</h6>
				<button onclick="location.href= 'groupregister/register'">모임 만들기</button>
			</div>
			<div class="col-1"></div>				
		</section>
		
		<section class="container">
			<div class="my-group-list-title">
				<h3>
					<i class="fa-solid fa-crown" style="color:#ffdf00;"></i>
					<b>내 모임</b>
				</h3>
				<a href="/mypage" id="go-to-my-group-list" class="group-more-btn">내 모임 더보기</a>
			</div>			
            <div class="row" id="myGroupDetailContainer">
            	<!-- Ajax로 받아온 내 모임 정보 내용 -->			  		
			</div>	
			
			<div class="interest-group-list">
				<div class="interests-group-list-title">
					<h3>
						<i class="fa-solid fa-anchor" style="color:#8fbc8f"></i>
						<b>관심사별 검색을 통해 꼭 맞는 모임을 빠르게 만나보세요</b>
					</h3>
					<a href="/groupsearch" class="group-more-btn">모임 더보기</a>
				</div>				
				<div class="row interest-nav-area">						  
					<div class="col-sm-2 interest-nav continue-hover" data-interest-id="1">			    
			      		<a href="#" class="interest-nav-a">			    
				      		<i class="fa-solid fa-masks-theater" style="color:#558257;"></i>    			    
						    <p>문화예술</p>
					    </a>
					</div>
					<div class="col-sm-2 interest-nav" data-interest-id="2">			    
			      		<a href="#" class="interest-nav-a">			    
				      		<i class="fa-solid fa-person-running" style="color:#e15c31;"></i>    			    
						    <p>액티비티</p>
					    </a>
					</div>
					<div class="col-sm-2 interest-nav" data-interest-id="3">			    
			      		<a href="#" class="interest-nav-a">			    
				      		<i class="fa-solid fa-utensils" style="color:#ffdf00;"></i>   			    
						    <p>푸드&드링크</p>
					    </a>
					</div>
					<div class="col-sm-2 interest-nav" data-interest-id="4">			    
			      		<a href="#" class="interest-nav-a">			    
				      		<i class="fa-solid fa-building-columns" style="color:#e15c31;"></i>    			    
						    <p>자기계발</p>
					    </a>
					</div>	
					<div class="col-sm-2 interest-nav" data-interest-id="5">			    
			      		<a href="#" class="interest-nav-a">			    
				      		<i class="fa-brands fa-sketch" style="color:#558257;"></i>   			    
						    <p>기타</p>
					    </a>
					</div>					  		
				</div>			
				
				<div id="groupDeatilsByInterest" class="row">
					<!-- Ajax로 받아온 관심사별 모임 정보 내용 -->
				</div>		
			</div>			
		</section>		
	</main>
	<%@ include file="/WEB-INF/views/mainpage/mainFooter.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
  crossorigin="anonymous"
></script>
<script
  src="https://kit.fontawesome.com/2c827c8cca.js"
  crossorigin="anonymous"
></script>
<script src="<c:url value='/js/mainpage/mainLogin.js'/>"></script>
</body>
</html>