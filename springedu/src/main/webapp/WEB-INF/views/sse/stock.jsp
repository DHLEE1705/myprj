<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function init() {
		var source = new EventSource(
				"http://localhost:9080/portfolio/sse/stockServer");
		source.addEventListener("open",function(){
			console.log('서버와 연결되었습니다.');
		},false);

		source.addEventListener("error",function(e){
			console.log('오류발생');
		},false);		
		
		source.addEventListener("message", function(event) {
			var data = event.data.split("\n");
			var symbol = data[0];
			var delta = parseInt(data[1], 10);
			var cell = document.getElementById(symbol);
			var currentValue = parseInt(cell.textContent, 10);
			cell.textContent = currentValue + delta;
		}, false);
	}
</script>
</head>
<body onload="init()">
	<h1>Server-Sent Event 예제</h1>
	<p>서버에서 보내온 데이터를 표시하고 있습니다.</p>
	<table>
		<tr>
			<th>Samsung</th>
			<th>LG</th>
			<th>ConSolution</th>
		</tr>
		<tr>
			<td id="Samsung">55</td>
			<td id="LG">70</td>
			<td id="SK">100</td>
		</tr>
	</table>
</body>

</html>