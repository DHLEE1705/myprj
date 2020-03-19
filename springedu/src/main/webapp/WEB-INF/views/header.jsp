<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <%
	String id = (String)session.getAttribute("id");
	String mypage = (String)session.getAttribute("mypage");
	String name = (String)session.getAttribute("name");
 %> --%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Anton|Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="<c:url value ='/resources/css/main.css' />">
    
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="<c:url value ='/resources/js/main.js'/>"></script>
    <script src="<c:url value='/resources/js/common.js'/>"></script>
    <title>Hello Foot Ball</title>
  <script>
  window.addEventListener("load",init,false);

	function init(){
		//검색버튼 클릭시
		searchBtn.addEventListener("click", function(e){
		e.preventDefault();
		console.log("검색");
		// 검색어 입력값이 없을때
		if(keyword.value.trim().length == 0){
			alert('검색어를 입력하세요!');
			keyword.value = "";
			keyword.focus();
			return false;
		}

		let stype = searchType.value; //검색유형
		let kword = keyword.value;    //검색어

		location.href = getContextPath() + "/board4/list3/" + stype + "/" + kword;
	},false);
	}	
  </script>
</head>
<body>
<c:set var="contextRoot" value = "${pageContext.request.contextPath }"/>
    <div id="headerwrap">
        <header>
            <div id="player"><img src="<c:url value='/resources/img/player.png'/>"></div>
            <c:if test="${empty member }" >
            <div id="logo"><a href="<c:url value='/'/>">Hello FooT Ball</a></div>
            </c:if>
            <c:if test="${!empty member }" >
            <div id="logo"><a href="<c:url value='#'/>">Hello FooT Ball</a></div>
            </c:if>
              <div id="search">
              	<form>
              		<select name="searchType" id = "searchType" style = "color: #696969;">
              		<option value="A" 
  								<c:out value="${searchType == 'A' ? 'selected' :'' }" />>전체</option>
  								
  								<%-- <option value="P" 
  								<c:out value="${searchType == 'P' ? 'selected' :'' }" />>경기 일자</option>
  						
 						  		<option value="R"
 						 	 <c:out value="${searchType == 'R' ? 'selected' :'' }" />>경기 장소</option>
 						  
  						<option value="S"
  						<c:out value="${searchType == 'S' ? 'selected' :'' }" />>참가비</option>	 --%>				
						</select>
                	<input type="search" name="keyword" value = "${keyword }" id="keyword" placeholder="지역, 일자, 구장비 등으로 매치 검색"/>
                	<input id ="searchBtn" type="image" src="<c:url value='/resources/img/ball.png'/>">
            		</form>								
            	</div> 

			<c:choose>
			<%-- <% if (id == null) { %> --%>
			<%-- <c:if test="${empty member }" > --%>
			<c:when test="${empty member }">
            <div id="right">
                <div id="login"><a href="<c:url value='/loginForm' />"><span id="log">로그인</span></a></div>
                <div id="join"><a href="<c:url value='/member/joinForm'/>"><span id="jo">회원가입</span></a></div>
                <div id="customer"><a href="#"><span id="cus">고객센터</span></a></div>
            </div>
      <%-- </c:if> --%>
      </c:when>
      <%-- <% } else if (id.equals("admin@naver.com")){ %> --%>
      <%--  <c:if test="${member.id eq 'admin@naver.com'}" > --%>
      <c:when test="${member.id eq 'admin@naver.com'}" >
      		    <div id="right">
                <div id="login"><a href="<c:url value='/logout'/>">로그아웃</span></a></div>
                <div id="join"><a href="<c:url value='/member/modifyForm/${sessionScope.member.id }'/>"><span id="jo">회원정보수정</span></a></div>
                <div id="customer"><a href="<c:url value='/admin/memberList'/>"><span id="cus">회원목록</span></a></div>
                <%-- <div id="customer"><a href="<c:url value='/member/outForm'/>"><span id="cus">회원탈퇴</span></a></div> --%>
                
            </div>
       <%-- </c:if>   --%>
       </c:when> 
       <%-- <% }else { %>  --%>
       <%-- <c:if test="${!empty member }" > --%>
       <c:when test="${!empty member }" >
           <div id="right">
                <div id="login"><a href="<c:url value='/logout'/>"><span id="log">로그아웃</span></a></div>
                <div id="join"><a href="<c:url value='/member/modifyForm/${sessionScope.member.id }'/>">회원정보수정</span></a></div>
                <div id="customer"><a href="#"><span id="cus">고객센터</span></a></div>
                
            </div>
      <%--  </c:if> --%>
      </c:when>
     </c:choose>
        <%-- <%} %>   --%>  
        </header>
    </div>
    <div id="headernav">
        <div id="topMenu">
            <ul>
                <li><a href="#">용병</a>
                    <ul>
                        <li><a href="<c:url value='/board3/list4'/>">용병 모집</a></li>
                        <li><a href="<c:url value='/board3/list5'/>">용병 신청</a></li>
                        <li><a href="<c:url value='/board3/list6'/>">용병 현황</a></li>
                    </ul>
                </li>
                <li><a href="#">매치</a>
                    <ul>
                        <li><a href="<c:url value='/board4/list2'/>">매치 등록</a></li>
                        <li><a href="<c:url value='/board4/list3'/>">매치 현황</a></li>

                    </ul>
                </li>
                <li><a href="#">구장</a>
                    <ul>
                        <!--<li><a href="#">구장 예약</a></li>-->
                        <li><a href="<c:url value='/board3/list7'/>">구장 살펴보기</a></li></li>
                    </ul>
                </li>
                <li><a href="#">커뮤니티</a>
                    <ul>
                        <li><a href="<c:url value='/board/list'/>">종합게시판</a></li>
                        
                        
                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <div id="header2wrap">
        <div id="header2">
            <div id ="imgheader1p">
                <img class="header1p" src="<c:url value='/resources/img/그림2.png'/>">
            </div>
            <div id ="headerpwrap">
                <p class="header2p">실시간 용병 현황 및 실시간 매치 현황</p>
                <p class="header3p"><b>HELLO FOOTBALL</b> 에서 확인하세요</p>
                <p class="header4p">상대팀을 구한다거나, 혼자인데 축구를 하고 싶은 분들은 <b>Hello FOOTBALL</b>을 이용해주세요.
                다양한 서비스를 제공해드립니다. </p>
            </div>
           <%-- <% if (id == null) { %> --%>
            <c:if test="${empty member }" >
            <div id="headerlogin">
                <form id = "loginForm" action="<c:url value='/login?reqURI=${reqURI }' />" method="post">
                    <div id="divId1">
                        <input type="text" placeholder="아이디" value="" id="member_id" name="id">
                    </div>
                    <div id="divPw1">
                        <input type="password" placeholder="비밀번호" value="" id="member_password" name="pw">
                    </div>
                    <div><span id="pwMsg" class =" errmsg"><c:if test="${!empty svr_msg }">${svr_msg }</c:if></span></div>
                    <button class="loginclass" type="submit" value="로그인" id="loginBtn2">로그인</button>
                    <div id="boxing">
                        <div id="boxing1-1"><a href="<c:url value='/member/findIDForm'/>">아이디 찾기</a></div>
                        <div id="boxing1-2"><a href="<c:url value='/member/findPWForm'/>">비밀번호 찾기</a></div>
                        <div id="boxing1-3"><a href="<c:url value='/member/joinForm'/>">회원가입</a></div>
                    </div>
                </form>
            </div>
            </c:if>
           <c:if test="${!empty member }" >
           <%--  <% }else { %> --%> 
            		 <div style = "background-color:transparent; letter-spacing:5px; text-shadow: 8px 4px 8px gray; color:#FAFAFA; font-size:33px; font-weight:bold; position:relative; left:60px; line-height:50px;" id="headerlogin">
            		 <a  href ="<c:url value='/member/modifyForm/${sessionScope.member.id }'/>" style = "color:#FAFAFA;">${member.name }님 환영합니다.</a></div>
            		
           <%--  <%} %> --%> 
       		</c:if>
        </div>
    </div>
