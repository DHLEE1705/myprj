<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>제출한 데이터</h3>
	<span>$person</span>${person }
	<span>$per</span>	${per }
	
	<p>person.name: ${person.name }
	<p>person.age: ${person.age }
	<p>per.name: ${per.name }
	<p>per.age: ${per.age }
	
	<%-- <p>name : ${person.name }</p>
	<p>age : ${person.age }</p> --%>
</body>
</html>