<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>테스트페이지</h3>
	<form action ="/portfolio/test/t11" method = "post"> <!-- default 값 get -->
		<label for = "name">이름</label><input type = "text" name = "name" value = "${per.name }">
		<label for = "age">나이</label><input type = "text" name = "age" value = "${per.age }">
	<input type = "submit" value = "전송"/>
	</form>
</body>
</html>