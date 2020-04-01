<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
	table{
		width:1100px;
		border-radius:5px;
		margin:0 auto;
		text-align:center;
		border-collapse: collapse;
	}
	
	th{
		background-color:black;
		opacity:0.8;
		color:white;
	}
	
	td{
		color: black;
		font-weight:bold;}
	
	
	img {
		width:30px;
	}
	
	#tablediv{
		margin-top:60px;
		overflow-y: scroll;
		height:500px;
		margin-bottom:150px;
	}
	
	@media screen and (min-width:320px) and (max-width:767px) {
		#tablediv{
			width:320px;
			margin:0 auto;
			overflow-x: scroll;
			
		}
				
		table{
			width:768px;
			font-size:10px;
		}
		
		tr{
			font-size:12px;
		}
		}
		
	@media screen and (min-width:768px) and (max-width:1099px) {
		table{
			width:768px;
			font-size:10px;
		}
		
		tr{
			font-size:12px;
		}
		
		
	}
</style>
</head>

<%-- <h3>회원목록</h3>
<a href = "<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a>
<hr /> --%>
<div id = "tablediv"><table border="1">
 <caption> <h3>회원 목록 리스트 </h3></caption>
 
 <colgroup>
 	<col width="12%"/>
 	<col width="12%"/>
 	<col width="12%"/>
 	<col width="12%"/>
 	<col width="4%"/>
 	<col width="7%"/>
 	<col width="10%"/>
 	<col width="10%"/>
 	<col width="10%"/>
 <thead>
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>전화번호</th>
		<th>이름</th>
		<th>성별</th>
		<th>활동지역</th>
		<th>생년월일</th>
		<th>생성일자</th>
		<th>변경일자</th>
		
		
		
	</tr>
 </thead>
 <tbody>
	<c:forEach var="rec" items="${memberList }"> <!-- AdminController에서 model.addAttribute("memberList",list)값 -->
	<tr>
		<td>${rec.id }</td>
		<td>${rec.pw }</td>
		<td>${rec.tel }</td>
		<td>${rec.name}</td>
		<td>${rec.gender }</td>
		<td>${rec.region }</td>
		<td>${rec.birth }</td>
		<td>${rec.cdate }</td>
		<td>${rec.udate }</td>
		
		
	</tr>
	</c:forEach>
 </tbody>
</table>
</div>

</body>
</html>