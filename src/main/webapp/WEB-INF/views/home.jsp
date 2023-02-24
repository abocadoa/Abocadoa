<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.fakeimg {
  height: 730px;
  background: #aaa;
}
</style>
<script>
    function popup(){
        var url = "Membership.jsp";
        var name = "join membership";
        var option = "width = 500, height = 500, top = 100, left = 200, location = no"
        window.open(url, name, option);
    }
</script>
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
	        <a class="nav-link" href="">로그인</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">예매확인/취소</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="javascript:popup()"
	        	target = "_blank">회원가입</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	
	<div class="p-5 bg-primary text-white text-center">
	  <h1>국내 4대 프로스포츠 통합 티켓 예매처</h1>
	  <p>(야구, 축구, 농구, 배구)</p> 
	</div>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <div class="container-fluid">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link active" href="/">홈</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="baseball.jsp">야구</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="soccer.jsp">축구</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="basketball.jsp">농구</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="volleyball.jsp">배구</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link">ㅣ</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="board.jsp">자유게시판</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="qna.jsp">고객센터</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	
	<!-- main영역 -->
	<div class="container mt-5">
	  <div class="row">
	    <div class="col-sm-12">
	      <h2>지금껏 듣지도 보지도 못한 획기적인 웹 페이지가 왔다!</h2>
	      <h5>그건 바로 스포츠 통합 예매 사이트!!!</h5>
	      <div class="fakeimg">
	      	<img src="스포츠.png" alt="" />
	      </div>
	      <p>최고의 서비스로 모시겠습니다.</p>
	    </div>
	  </div>
	</div>
	
	<!-- footer영역 -->
	<div class="mt-5 p-4 bg-dark text-white text-center">
	  <p>※본 페이지는 개인이 제작한 것이며, 실제 티켓 판매 페이지가 아닙니다.</p>
	</div>
</body>
</html>