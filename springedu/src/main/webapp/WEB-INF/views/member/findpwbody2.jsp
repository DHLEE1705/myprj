<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<script src="../js/findPW.js"></script>
	<link rel="stylesheet" href="../css/findPW.css"/>

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
                            <li><a href="<c:url value='/board/list'/>">종합게시판</a></li>
                            
                            
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="container">
            <div class="login-wrapper">
							<form id ="changePWForm" method = "post" action ="<c:url value = '/member/changePW'/>">
                    <div class="login-title">
                        <h3>Hello FOOT BALL</h3>
                    </div>
                    <div class="login-content">
                        <div><input type="text" name="id" id="id" value =""placeholder="아이디"></div>
                        <div><span id="idMsg"></span></div>
                         <div><input type="tel" name="tel" id="tel" value ="" placeholder="전화번호"></div>
                        <div><span id="telMsg"></span></div>
                        <div><input type="date" name="birth" id="birth" placeholder="생년월일"></div>
                        <div><span id="birthMsg" class =" errmsg"></span></div>
                        <div><input type="password" name="newpw" id="newpw" placeholder="새로운 비밀번호"></div>
                        <div><span id="pw_errmsg" class =" errmsg"></span></div>
                        <div><input type="password" name="chkpw" id="chkpw" placeholder="비밀번호 재확인"></div>
                        <div><span id="pwChk_errmsg" class =" errmsg"></span></div>
                        
                        
                        
                        <div><input type="button" name="" id="findPWBtn" value="비밀번호 찾기"></div>
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