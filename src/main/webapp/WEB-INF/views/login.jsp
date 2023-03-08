<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
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
	
	<!-- 아이디, 패스워드 입력 여부를 확인하기 위한 스크립트 -->
	<script type="text/javascript">
	function loginValidate(f)
	{
		if(f.id.value==""){
			alert("아이디를 입력하세요");
			f.id.focus();
			return false;
		}
		if(f.pass.value==""){
			alert("패스워드를 입력하세요"); 
			f.pass.focus();
			return false;
		} 
	}
	</script>
	
	<!-- header영역 -->
	<nav class="navbar navbar-expand-sm bg-danger navbar-dark">
	  <div class="container-fluid justify-content-end">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link active" href="login.do">로그인</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="ticket.do">예매확인/취소</a>
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
	      <h3>로그인</h3> 
		<!-- 로그인이 된 경우 회원정보와 로그아웃 버튼을 출력한다. -->
		<c:choose>
			<c:when test="${not empty sessionScope.siteUserInfo }">
				<div class="row" style="border:2px solid #cccccc;padding:10px;">			
					<!-- 로그인에 성공한 경우 DTO객체에 회원정보를 저장한 후
					세션영역에 저장할것 이므로, 출력시에는 getter()를
					사용하기 위해 멤버변수로 접근한다.
					EL에서는 멤버변수명 만으로 getter()에 접근할 수 있다. -->
					<h4>아이디:${sessionScope.siteUserInfo.id }</h4>
					<h4>이름:${sessionScope.siteUserInfo.name }</h4>
					<br /><br />
					<button class="btn btn-danger" 
						onclick="location.href='logout.do';">
						로그아웃</button>
					&nbsp;&nbsp;
					<button class="btn btn-primary" 
						onclick="location.href='/';">
						홈으로가기</button>
				</div>
			</c:when>
			<c:otherwise>
				<!-- 로그아웃 상태에서는 로그인폼을 출력한다. -->
				<!-- 로그인에 실패한 경우 에러메세지를 출력하는 부분 -->
				<span style="font-size:1.5em; color:red;">${LoginNG }</span>
				<form name="loginForm" method="post" action="./loginAction.do" onsubmit="return loginValidate(this);">
					<!-- 로그인에 성공한 경우 돌아갈 페이지의
					경로를 파라미터로 받아온다.
					네이버와 같은 포털사이트에는 이미
					이와같은 처리가 되어있다. -->
					<input type="hidden" name="backUrl" value="${param.backUrl }"/>
					<table class="table-bordered" style="width:50%;">
						<tr>
							<td><input type="text" class="form-control" name="id" placeholder="아이디" tabindex="1"></td>
							<td rowspan="2" style="width:80px;"><button type="submit" class="btn btn-primary" style="height:77px; width:77px;"  tabindex="3">로그인</button></td>
						</tr>
						<tr>
							<td><input type="password" class="form-control" name="pass" placeholder="패스워드" tabindex="2"></td>
						</tr>
					</table>
				</form>
			</c:otherwise>
		</c:choose>
	    </div>
	  </div>
	</div>
	
	<!-- footer영역 -->
	<div class="mt-5 p-4 bg-dark text-white text-center">
	  <p>※본 페이지는 개인이 제작한 것이며, 실제 티켓 판매 페이지가 아닙니다.</p>
	</div>
</body>
</html>