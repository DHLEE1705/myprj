<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<script src="<c:url value ='/resources/js/login.js'/>"></script>

</head>
	<nav>
        <div id="tapmenu">
            <input type="checkbox" id="menuicon">
            <label for="menuicon">
                <span></span>
                <span></span>
                <span></span>
            </label>
            <div class="sidebar">
                <ul class="navi">
                    <li>
                        <a href="#">용병</a>
                        <ul>
                            <li><a href="<c:url value='/board3/list4'/>">용병 모집</a></li>
                            <li><a href="<c:url value='/board3/list5'/>">용병 신청</a></li>
                            <li><a href="<c:url value='/board3/list6'/>">용병 현황</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">매칭</a>
                        <ul>
                            <li><a href="<c:url value='/board4/list2'/>">매치 등록</a></li>
                            <li><a href="<c:url value='/board4/list3'/>">매치 현황</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">구장</a>
                        <ul>
                            <!--<li><a href="#">구장 예약</a></li>-->
                            <li><a href="<c:url value='/board3/list7'/>">구장 살펴보기</a></li></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">커뮤니티</a>
                        <ul>
                             <li><a href="<c:url value='/board/list/NOTICE'/>">공지사항</a></li>
                      <li><a href="<c:url value='/board/list/RESULT'/>">경기결과</a></li>
                      <li><a href="<c:url value='/board/list/BLACKLIST'/>">블랙리스트</a></li>
                            
                            
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="container">
            <div class="login-wrapper">
							<form id = "loginForm" action="<c:url value='/login?reqURI=${reqURI }' />" method="post">
                    <div class="login-title">
                        <h3>Hello FOOT BALL</h3>
                    </div>
                    <div class="login-content">
                        <div><input type="text" name="id" id="id" placeholder="아이디"></div>
                        <div><span id="idMsg"></span></div>
                        <div><input type="password" name="pw" id="pw" placeholder="비밀번호"></div>
                        <div><span id="pwMsg" class =" errmsg"><c:if test="${!empty svr_msg }">${svr_msg }</c:if></span></div>
                        <div><input type="submit" name="" id="loginBtn" value="로그인"></div>
                        <!-- <div><input type="submit" name="" id="loginBtnnaver" value="네이버 계정으로 로그인"></div>
                       	<div><input type="submit" name="" id="loginBtngoogle" value="구글 계정으로 로그인"></div> -->
                        <div id = "middles">
                        	<div id = "idfind"><a href = "<c:url value='/member/findIDForm'/>">아이디 찾기</a></div>
                        	<div id = "pwfind"><a href = "<c:url value='/member/findPWForm'/>">비밀번호 찾기</a></div>
                        	<div id = "joinmember"><a href = "<c:url value='/member/joinForm'/>">회원가입</a></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </nav>