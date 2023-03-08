<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매확인/취소</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="로고.png" rel="shortcut icon" type="image/x-icon">
<style>

</style>
</head>
<body>
	<!-- <h2>스프링 부트 프로젝트</h2>
	<ul>
		<li><a href="/">루트</a></li>
	</ul> -->
	
	<!-- header영역 -->
	<nav class="navbar navbar-expand-sm bg-danger navbar-dark">
	  <div class="container-fluid justify-content-end">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="login.do">로그인</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link active" href="ticket.do">예매확인/취소</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="regist.do">회원가입</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="list.do">회원리스트(관리자)</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	
	<div class="p-5 bg-primary text-white text-center">
	  <h1>TICKETPARK</h1>
	  <p>국내 4대스포츠 통합 티켓 예매처(야구, 축구, 농구, 배구)</p>
	</div>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <div class="container-fluid">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="/">홈</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="baseball.do">야구</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="soccer.do">축구</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="basketball.do">농구</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="volleyball.do">배구</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link">ㅣ</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="board.do">자유게시판</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="qna.do">고객센터</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	
	<!-- main영역 -->
	<div class="container mt-5">
	  <div class="row">
	    <div class="col-sm-12">
	      
	    </div>
	  </div>
	</div>
	
	<!-- footer영역 -->
	<div class="mt-5 p-4 bg-dark text-white text-center">
	  <p>※본 페이지는 개인이 제작한 것이며, 실제 티켓 판매 페이지가 아닙니다.</p>
	</div>
</body>
</html>