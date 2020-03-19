<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/resources/js/common.js'/>"></script>
<script>
		window.addEventListener("load",init, false);
		function init(){
			//삭제
		      if(deleteBtn != null){
					deleteBtn.addEventListener("click",function(e){
						e.preventDefault();
							console.log("삭제"+e.target.getAttribute('data-bnum'));
							if(confirm("삭제하시겠습니까?")){
			 	 				let bnum = e.target.getAttribute('data-bnum');
								location.href = getContextPath()+"/board3/delete/"+bnum;
								self.close();
							}
						},false);
		      }
		}
</script>
<style>
#playerimg{
	height:210px;
	float:left;
}
#playername{
	float:left;
	color:#A4A4A4;
	margin-top:20px;
	font-size: 20px;
}

#playerregion{
	font-size:16px;
	color:black;
	font-weight:bold;
	margin-top:10px;
		
}
#playernumber{
	font-size:14px;
	color:black;
	font-weight:bold;
	margin-top:10px;
		
}
#playerskill{
font-size:16px;
color:black;
	font-weight:bold;
	margin-top:10px;
}
#playermanner{
font-size:16px;
color:black;
	font-weight:bold;
	margin-top:10px;
}
#playerdate{
font-size:16px;
	color:black;
	font-weight:bold;
	margin-top:10px;
}


</style>
</head>
<body>
<form:form  enctype="multipart/form-data"
			method="post"
		    modelAttribute="boardVO3">
    		<div id = "playerimg">
    		<c:if test = "${!empty boardVO3.fname }">
    			<a href="#"><img width = "190px" height="200px" style = "padding-right:10px; padding-left:10px;" src="${pageContext.request.contextPath }/member/file/${boardVO3.bid}"></a>
    		</c:if>
    		<c:if test = "${empty boardVO3.fname }">
    			<img width = "190px" height="200px" style = "padding-right:10px; padding-left:10px;" src="<c:url value='/resources/img/익명.png'/>"></a>
    		</c:if>
    		</div>
    		<div id = "playername">
    			<span> ${boardVO3.bname }</span>
    			<c:if test="${sessionScope.member.id == boardVO3.bid }">
    			<form:button class="btn umode" id="deleteBtn" data-bnum ="${boardVO3.bnum }"
    			>삭제</form:button> 
    			</c:if>
    		<div id = "playerregion">
    			${boardVO3.region }
    		</div>
    		<div id = "playernumber">
    			연락처 :  ${boardVO3.btel}
    		</div>
    		<div id = "playerskill">
    			실력 : <span style= "color:red;"> ${boardVO3.skill } </span>
    		</div>
    		<div id = "playermanner">
    			매너 : <span style= "color:red;"> ${boardVO3.manner }</span>
    		</div>
    		<div id = "playerdate">
    			가능 일자 : <span style= "color:red;"> ${boardVO3.pdate } </span>
    		</div>
 </form:form>
</body>
</html>