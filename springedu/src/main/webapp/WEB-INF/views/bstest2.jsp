<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
 <link rel="stylesheet" 
 			 href="${pageContext.request.contextPath }/webjars/bootstrap/4.4.1-1/css/bootstrap.css">
<title>Insert title here</title>
<style>
	.container, .container-fluid{
		background-color:red;
	}
</style>
</head>
<body>
		<script src="${pageContext.request.contextPath }/webjars/jquery/3.4.1/jquery.js"></script>
	  <script src="${pageContext.request.contextPath }/webjars/popper.js/2.0.2/dist/umd/popper.js"></script>
    <script src="${pageContext.request.contextPath }/webjars/bootstrap/4.4.1-1/js/bootstrap.js"></script>

	<div class="container">
  <div class="row">
    <div class="col-sm">
      One of three columns
    </div>
    <div class="col-sm">
      One of three columns
    </div>
    <div class="col-sm">
      One of three columns
    </div>
  </div>
</div>
</body>
</html>