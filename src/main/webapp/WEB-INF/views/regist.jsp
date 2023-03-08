<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	        <a class="nav-link" href="ticket.do">예매확인/취소</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link active" href="regist.do">회원가입</a>
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
	      <h2>회원가입</h2>
			<!-- 등록폼에서 post로 전송시 컨트롤러에서 insert처리를 한다. -->
			<form action="regist.do" method="post">
				<table border="1">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" value=""/></td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input type="text" name="pass" value=""/></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" value=""/></td>
					</tr>
				</table>
				<input type="submit" value="전송하기"/>
			</form>
	    </div>
	  </div>
	</div>
	
	<!-- footer영역 -->
	<div class="mt-5 p-4 bg-dark text-white text-center">
	  <p>※본 페이지는 개인이 제작한 것이며, 실제 티켓 판매 페이지가 아닙니다.</p>
	</div>
</body>
</html>