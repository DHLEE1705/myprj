<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

 <!-- Bootstrap CSS -->
 <link rel="stylesheet" 
 			 href="${pageContext.request.contextPath }/webjars/bootstrap/4.4.1-1/css/bootstrap.css">
 			 
 			 
<title>Insert title here</title>
</head>
<body>
		<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="${pageContext.request.contextPath }/webjars/jquery/3.4.1/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/webjars/popper.js/2.0.2/dist/umd/popper.js"></script>
    <script src="${pageContext.request.contextPath }/webjars/bootstrap/4.4.1-1/js/bootstrap.js"></script>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" ></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2" class="active"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active" data-interval="2000" >
      <img src="${pageContext.request.contextPath }/resources/img/포스터1.jpg" height="700px" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item"  data-interval="2000" >
      <img src="${pageContext.request.contextPath }/resources/img/포스터2.jpg"  height="700px"  class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item" data-interval="2000" > 
      <img src="${pageContext.request.contextPath }/resources/img/포스터3.jpg" height="700px"  class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</body>
</html>