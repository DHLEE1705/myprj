<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Anton|Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel = "stylesheet" href="<c:url value ='/resources/css/login.css'/>">
   <!--  <script src="js/login.js"></script> -->
    <title>HELLO Foot Ball 로그인</title>
</head>
<body>
<c:set var="contextRoot" value = "${pageContext.request.contextPath }"/>
 <div id="headerwrap">
    <header>					
        <div id="player"><img src="<c:url value='/resources/img/player.png'/>"></div>
        <div id="logo"><a href="<c:url value='/'/>">Hello FooT Ball</a></div>

        <%-- <div id="search">
            <form>
                <input type="text" value="" placeholder="팀명, 구장, 지역 검색">
                <input type="image" src="<c:url value='/resources/img/ball.png'/>">
            </form>
        </div> --%>
  <c:choose>  
  	<c:when test="${empty member }">    
	<%-- <% if (request.getRequestURL().toString().split("/")[5].equals("modifyForm.jsp")){ %> --%>
       <div id="right">
                <div id="login"><a href="<c:url value='/loginForm'/>"><span id="log">로그인</span></a></div>
                <div id="join"><a href="<c:url value='/member/joinForm'/>"><span id="jo">회원가입</span></a></div>
                <div id="customer"><a href="#"><span id="cus">고객센터</span></a></div>
            </div>
     </c:when>
     <c:when test="${member.id eq 'admin@naver.com'}" >
       <%-- <% }else { %> --%> 
       	<div id="right">
                <div id="login"><a href="<c:url value='/logout'/>">로그아웃</span></a></div>
                <div id="join"><a href="<c:url value='/member/modifyForm/${sessionScope.member.id }'/>">회원정보수정</span></a></div>
                <div id="customer"><a href="<c:url value='/admin/memberList'/>"><span id="cus">회원목록</span></a></div>
            </div>
        <%-- <%} %>  --%>
       </c:when>
       <c:when test="${!empty member }" >
           <div id="right">
                <div id="login"><a href="<c:url value='/logout'/>"><span id="log">로그아웃</span></a></div>
                <div id="join"><a href="<c:url value='/member/modifyForm/${sessionScope.member.id }'/>">회원정보수정</span></a></div>
                <div id="customer"><a href="#"><span id="cus">고객센터</span></a></div>
            </div>
        </c:when>
       </c:choose>
    </header>
</div>
<div id = "headernavwrap">  
    <div id="headernav">
        <div id="topMenu">
            <ul>
                <li><a class="menuLink" href="#">용병</a>
                  <ul>
                      <li><a href="<c:url value='/board3/list4'/>">용병 모집</a></li>
                      <li><a href="<c:url value='/board3/list5'/>">용병 신청</a></li>
                      <li><a href="<c:url value='/board3/list6'/>">용병 현황</a></li>
                  </ul>
              </li>
                <li><a class="menuLink" href="#">매치</a>
                  <ul>
                      <li><a href="<c:url value='/board4/list2'/>">매치 등록</a></li>
                      <li><a href="<c:url value='/board4/list3'/>">매치 현황</a></li>
                  </ul>
              </li>
                <li><a class="menuLink" href="#">구장</a>
                  <ul>
                      <!--<li><a href="#">구장 예약</a></li>-->
                      <li><a href="<c:url value='/board3/list7'/>">구장 살펴보기</a></li></li>
                  </ul>
              </li>
                <li><a class="menuLink" href="#">커뮤니티</a>
                  <ul>
                      <li><a href="<c:url value='/board/list'/>">종합게시판</a></li>
                      
                      
                  </ul>
              </li>
            </ul>
        </div>
    </div>
</div>
	  		<%-- <%=request.getRequestURL().toString().split("/")[7]%>  --%>
  		  <%-- <%=	request.getRequestURI()%>  --%>
<% if (request.getRequestURL().toString().split("/")[7].equals("joinForm.jsp")){ %>
<div id="header2wrap">
    <div id="header2">
    
        <div id="fontwrap"><span id="loginfont">회원가입</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo">회원가입</span></div>
    </div>
</div>
<% }else if (request.getRequestURL().toString().split("/")[7].equals("modifyForm.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">회원정보수정</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo">회원정보수정</span></div>
    </div>
</div>

<% }else if (request.getRequestURL().toString().split("/")[7].equals("outForm.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">회원탈퇴</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo">회원탈퇴</span></div>
    </div>
</div>

<% }else if (request.getRequestURL().toString().split("/")[7].equals("findIDForm.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">아이디 찾기</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo">아이디 찾기</span></div>
    </div>
</div>

<% }else if (request.getRequestURL().toString().split("/")[7].equals("findPWForm.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">비밀번호 찾기</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo">비밀번호 찾기</span></div>
    </div>
</div>	

 <% }else if (request.getRequestURI().equals("/portfolio/WEB-INF/views//admin/memberList.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">회원목록</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo">회원목록</span></div>
    </div>
</div>																				
<% }else if (request.getRequestURI().equals("/portfolio/WEB-INF/views/board/list.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">종합 게시판</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo1">커뮤니티 &nbsp;&nbsp;</span></div>
        <div id="fontmenu"><span id="fontlo">종합 게시판</span></div>
    </div>
</div>

<% }else if (request.getRequestURI().equals("/portfolio/WEB-INF/views//board/readForm.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">종합 게시판</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo1">커뮤니티 &nbsp;&nbsp;</span></div>
        <div id="fontmenu"><span id="fontlo">종합 게시판</span></div>
    </div>
</div>
<% }else if (request.getRequestURI().equals("/portfolio/WEB-INF/views//board/replyForm.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">종합 게시판</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo1">커뮤니티 &nbsp;&nbsp;</span></div>
        <div id="fontmenu"><span id="fontlo">종합 게시판</span></div>
    </div>
</div>


<% }else if (request.getRequestURI().equals("/portfolio/WEB-INF/views//board/writeForm.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">종합 게시판</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo1">커뮤니티 &nbsp;&nbsp;</span></div>
        <div id="fontmenu"><span id="fontlo">종합 게시판</span></div>
    </div>
</div>

<% }else if (request.getRequestURI().equals("/portfolio/WEB-INF/views//board/list2.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">매치 등록</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo1">매치 &nbsp;&nbsp;</span></div>
        <div id="fontmenu"><span id="fontlo">매치 등록</span></div>
    </div>
</div>

<% }else if (request.getRequestURI().equals("/portfolio/WEB-INF/views/board/list3.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">매치 현황</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo1">매치 &nbsp;&nbsp;</span></div>
        <div id="fontmenu"><span id="fontlo">매치 현황</span></div>
    </div>
</div>
<% }else if (request.getRequestURI().equals("/portfolio/WEB-INF/views//board/list4.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">용병 모집</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo1">용병 &nbsp;&nbsp;</span></div>
        <div id="fontmenu"><span id="fontlo">용병 모집</span></div>
    </div>
</div>	
<% }else if (request.getRequestURI().equals("/portfolio/WEB-INF/views//board/list5.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">용병 신청</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo1">용병 &nbsp;&nbsp;</span></div>
        <div id="fontmenu"><span id="fontlo">용병 신청</span></div>
    </div>			
</div>																	
<% }else if (request.getRequestURI().equals("/portfolio/WEB-INF/views/board/list6.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">용병 현황</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo1">용병 &nbsp;&nbsp;</span></div>
        <div id="fontmenu"><span id="fontlo">용병 현황</span></div>
    </div>
</div>
<% }else if (request.getRequestURI().equals("/portfolio/WEB-INF/views//board/list7.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">구장 살펴보기</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo1">구장 &nbsp;&nbsp;</span></div>
        <div id="fontmenu"><span id="fontlo">구장 살펴보기</span></div>
    </div>
</div>	
<% }else if (request.getRequestURI().equals("/portfolio/WEB-INF/views//board/readForm2.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">용병 모집</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo1">용병 &nbsp;&nbsp;</span></div>
        <div id="fontmenu"><span id="fontlo">용병 모집</span></div>
    </div>
</div>
<% }else if (request.getRequestURI().equals("/portfolio/WEB-INF/views//board/readForm3.jsp")){ %>
	<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">매치 현황</span></div>
    </div>
</div>

<div id="navmenuwrap">
    <div id="navmenu">			
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo1">매치 &nbsp;&nbsp;</span></div>
        <div id="fontmenu"><span id="fontlo">매치 현황</span></div>
    </div>
</div>

	

<% }else { %> 
<div id="header2wrap">
    <div id="header2">
        <div id="fontwrap"><span id="loginfont">로그인</span></div>
    </div>
</div>
<div id="navmenuwrap">					
    <div id="navmenu">						
        <div id="homemenu"><a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/home.png'/>"></a></div>
        <div id="fontmenu"><span id="fontlo">로그인</span></div>
    </div>
</div>  
<%} %>   