<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
<link rel="stylesheet" href="/css/kkirikkiri.css" />

<!-- 구글 로그인 -->
<meta name ="google-signin-client_id" content="592800938088-7p3at2tql9q7fandc48m3fllfolbkd78.apps.googleusercontent.com">

<script src="/jquery-3.7.1.min.js"></script>   
<script>
$(document).ready(function(){	
	
});
</script>    
</head>
<body>
<header class="header-nav">
	<div class="header-nav-left">
		<a href="#" class="logo">
			<img src="/images/kkirikkiri_logo.png" alt="끼리끼리 로고" class="logo">
		</a>	
		<form action="/groupsearch" method="get" class="search-area" style="margin-top:20px;"> 	       
	       <input type="text" class="first-input" id="search-input-keyword" name="keyword" placeholder="검색어 입력" /><!--  
	       --><input type="text" class="second-input" id="search-input-region" name="region" placeholder="지역 입력" /><!--
	       --><button id="search-button">
	       <i class="fa-solid fa-magnifying-glass fa-thin" style="cursor: pointer; font-size: 18px; color:white"></i>
	       </button>       	
        </form>    
	</div>
	
	<div class="before-login-header-nav-right">
		<button id="login-button">로그인</button>
		<button id="signup-button">회원가입</button>
	</div>	
</header>

<!-- 로그인 모달 -->
<div id="login-modal" class="modal">
  <div class="modal-content" style="padding-bottom:30px;">
  	<div class="modal-content-container">
	    <span class="modal-close">&times;</span><br>
	    <img src="/images/kkirikkiri_logo.png" alt="끼리끼리 로고" style="width:50px; height:50px">  	    
	    <h2><b>로그인</b></h2>
	    <div class="signup-suggestion">
		    <h6 style="margin-right:7px">아직 계정이 없다면?</h6>
		    <a href="#" style="color:#3b5f3e"><b>계정 만들기</b></a>
	    </div>
	    <form id="login-modal-form">
		    <div class="email-login" style="margin-top: 25px">
			    <h6 style="margin-right:290px"><b>이메일</b></h6>
			    <input type="text" id="userEmail" name="userEmail" required>
			    <h6 style="margin-right:270px; margin-top: 15px"><b>비밀번호</b></h6>
			    <input type="password" id="userPw" name="userPw" required>
			    <div id="errorMessage" style="color: red; margin-top:5px; text-align:left; margin-left:50px;"><!-- 로그인 실패 메시지 --></div>
		    </div>	    		    
		    <button type="button" id="login-modal-button" class="login-modal-button">로그인</button>	  
	    </form>  
	    <div style="display:flex; align-items:center; justify-content:space-between; padding: 0 10px; margin:20px 0">
		    <div style="flex: 1; border-top: 1px solid #e4e2dd;"></div>
		    <span style="margin: 0 10px;">또는</span>
		    <div style="flex: 1; border-top: 1px solid #e4e2dd;"></div>
	    </div>
	    <!-- 카카오 로그인 -->
	    <div onclick="kakaoLogin();">
		    <a href="javascript:void(0)">
		    	<img src="/images/kakao_login_medium_wide.png" alt="카카오톡 로그인 버튼" style="width: 80%">
		    </a>	
	    </div>
	    <!-- 구글 로그인-->  
		<div id="GgCustomLogin" style="height: 100px; padding:0px">
			<a href="javascript:void(0)">
				<img src="/images/google_login.png" alt="구글 로그인 버튼" style="width:350px; margin-top: 13px;">
			</a>
		</div>	
		<a href="#" style="text-decoration:underline; margin-top:0px;">로그인에 어려움이 있으신가요?</a>     		
  	</div>       
  </div>
</div>

<!-- 회원가입 모달 -->
<div id="signup-modal" class="modal">
  <div class="modal-content" style="padding-bottom:40px;">
  	<div class="modal-content-container">
	    <span class="modal-close">&times;</span><br><br>
	    <img src="/images/kkirikkiri_logo.png" alt="끼리끼리 로고" style="width:50px; height:50px">  	    
	    <h2><b>회원가입</b></h2>
	    <div class="signup-suggestion">
		    <h6 style="margin-right:7px">이미 회원이신가요?</h6>
		    <a href="#" style="color:#3b5f3e"><b>로그인 하기</b></a>
	    </div>
		<!-- 카카오 회원가입 -->
	    <div onclick="kakaoLogin();">
		    <a href="javascript:void(0)">
		    	<button class="signup-button" style="margin-top:25px; background-color:#F7E600"><i class="fa-solid fa-comment" style="margin-right:10px;"></i>카카오로 계속하기</button>  
		    </a>	
	    </div>
	    <!-- 구글 회원가입 -->
		<div id="GgCustomLogin" >
			<a href="javascript:void(0)">
				<button class="signup-button"><img src="/images/google_logo.png" alt="구글 로고" style="margin-right:15px;">구글로 계속하기</button>  
			</a>
		</div>	
		<button class="signup-button" id="open-email-signup-modal"><i class="fa-solid fa-envelope" style="margin-right:10px;"></i>이메일로 가입하기</button>   
  	</div>
  </div>
</div>

<!-- 이메일 회원가입 모달 -->
<div id="email-signup-modal" class="modal">
  <div class="modal-content" style="padding-bottom:40px;">
  	<div class="modal-content-container">
	    <span class="modal-close">&times;</span><br><br>
	    <img src="/images/kkirikkiri_logo.png" alt="끼리끼리 로고" style="width:50px; height:50px">  
	    
	    
	    <form id="email-signup-modal-form">
		    <div class="email-login" style="margin-top: 25px">
			    <h6 style="margin-right:290px"><b>이메일</b></h6>
			    <input type="text" id="email-signup-modal-userEmail" name="userEmail" required>
			    <div class="email-signup-form" id="email-signup-modal-userEmail-confirm"><!--이메일 중복 결과창  --></div> 
			    <h6 style="margin-right:270px; margin-top: 15px;"><b>비밀번호</b></h6>	  	    
			    <div class="password-input-container">
				  <input type="password" placeholder=" 비밀번호를 입력하세요" id="email-signup-modal-userPw" name="userPw" required>
				  <i class="fa-regular fa-eye-slash"></i>
				</div>		    	
			    <input type="password" placeholder=" 비밀번호 재입력" id="email-signup-modal-userPw-confirm">
			    <div class="email-signup-form" id="email-signup-modal-userPw-confirm-result"><!--비밀번호 일치 결과창  --></div> 	    
		    </div>
		    <div class="email-signup-form" style="margin-top:20px;">
		    	<input type="checkbox" name="age" value="rightAge" class="email-signup-form-checkbox"> 
		    	<span style="font-size:17px; margin-left:10px;">저는 18세 이상입니다.</span>
		    </div>	    		    
			<div class="email-signup-form" id="email-signup-modal-form-result"><!--전체 입력이 안됐을시 보여지는 창  --></div> 
		    <button type="button" class="login-modal-button" id="open-signup-set-myprofile-modal">회원가입</button>  	    
	    </form>
	    
	    
	    <div class="signup-suggestion" style="margin-top: 25px;">
		    <h6 style="margin-right:7px">이미 회원이신가요?</h6>
		    <a href="#" style="color:#3b5f3e"><b>로그인 하기</b></a>
	    </div>		   
  	</div>
  </div>
</div>


<!-- 회원가입 내정보설정 모달 -->
<div id="signup-set-myprofile-modal" class="modal">
  <div class="modal-content" style="padding-bottom:40px;">
  	<div class="modal-content-container">
	    <span class="modal-close">&times;</span><br><br>
	    <img src="/images/kkirikkiri_logo.png" alt="끼리끼리 로고" style="width:50px; height:50px">  
	    <h4><b>끼리끼리</b>에 오신 것을 환영합니다!</h4>
	    <p>나에게 꼭 맞는 모임을 찾기 위해 <br>지금 '내 정보 설정'을 해 보세요.</p>	    
	    <!-- 프로필 사진 업로드 -->
	    <form class="signup-myprofile-img" method="post" enctype="multipart/form-data">
	    	<div class="signup-myprofile-add-img" id="signup-myprofile-show-img">
	    	<!-- 이미지가 보여지는 공간 -->
	    	</div>
	    	<div class="file-input-container">
            	<label class="custom-file-label" for="file-upload">사진 업로드</label>
            	<input type="file" id="file-upload" class="file-input" accept="image/*" onchange="loadFile(this)">
        	</div>		 
	    </form>
	    
	    <div class="email-login" style="margin-top: 25px">
		    <h6 style="margin-right:290px"><b>내 별명</b></h6>
		    <input type="text" required>
		    <div class="email-signup-form">별명 중복 결과창</div> 
		    <h6 style="margin-right:270px; margin-top: 15px;"><b>내 위치</b></h6>	  	    
		    <div>
		    	
				<select id="city" required>
			    	<option value="" disabled selected>도시 선택</option>
			    	<option value="">도시</option>
			    </select>
		    </div>
		    <div>
			    <select id="district">
			    	<option value="" disabled selected>구/동 선택</option>
			    	<option value=""></option>
			    </select>			  
			</div>		    	
		    <div class="email-signup-form">비밀번호 일치 결과창</div> 	 
	    </div>
	    	<h6 style="margin-right:290px"><b>내 관심사</b></h6>
		    <form action="" style="border:1px solid red; margin-left: 45px;width:80%; height:100px;">			  
			  <!--  <div class="col-3">-->
			  <input type="checkbox" id="cultureArt" name="setProfileInterest" value="cultureArt">
			  <label for="vehicle1">문화예술</label> 	
			  <!--</div>  -->	
			  <!--  <div class="col-3">--> 
			  <input type="checkbox" id="activity" name="setProfileInterest" value="activity">
			  <label for="vehicle2">액티비티</label>
			   <!--</div>  -->	
			  
			  <!--  <div class="col-3">-->
			  <input type="checkbox" id="foodDrink" name="setProfileInterest" value="foodDrink">
			  <label for="vehicle3">푸드&드링크</label><br>
			   <!--</div>  -->	
			  
			 <!--  <div class="col-3">-->
			<div style="display:flex; justify-content:space-around;margin-top:50px;">
			 <span>
			  <input type="checkbox" id="selfStudy" name="setProfileInterest" value="selfStudy">
			  <label for="vehicle3">자기계발</label>
			  </span>
			   <!--</div>  -->	
			  
			  <!--  <div class="col-3">-->
			  <span>
			  <input type="checkbox" id="etc" name="setProfileInterest" value="etc">
			  <label for="vehicle3">기타</label>
			  </div>
			</span>  
			   <!--</div>  -->	
			</form>
		    
		    <h6 style="margin-right:290px"><b>내 소개</b></h6>
		    <textarea style="width:80%;"id="setProfileBio" name="setProfileBio" rows="4" placeholder="Enter your message"></textarea>
		    
		    
		    
	    
	       		    
		<div class="email-signup-form">전체 입력이 안됐을시 보여지는 창</div> 
	    <button class="login-modal-button">내 정보 등록하기</button>  	    	   
  	</div>
  </div>
</div>






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
<!-- 카카오톡 api -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 구글 api-->
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script src="<c:url value='/js/mainpage/mainHeader.js'/>"></script>
</body>
</html>