<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<script src="<c:url value ='/resources/js/common.js' />"></script>
	<script src="<c:url value ='/resources/js/findPW.js' />"></script>
	<link rel="stylesheet" href="<c:url value ='/resources/css/findPW.css' />">

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

  <table>
    <caption><h2>Hello FOOT BALL</h2></caption>
    <colgroup>
      <col width="30%">
      <col width="70%">
    </colgroup>
    <thead>
      <tr>
        <th>아 이 디</th>
        <td><input type="text" name="id" id="id"></td>
      </tr>
      <tr><td colspan="2" id="id_errmsg"></td></tr>
      <tr>
        <th>전화번호</th>
        <td><input type="tel" name="tel" id="tel"></td>
      </tr>
      <tr><td colspan="2" id="tel_errmsg"></td></tr>
      <tr>
        <th>생년월일</th>
        <td><input type="date" name="birth" id="birth"></td>
      </tr>
      <tr><td colspan="2" id="birth_errmsg"></td></tr>
      <tr class="hide">
        <th>비밀번호</th>
        <td><input type="password" name="pw" id="pw" placeholder ="새로운 비밀번호"></td>
      </tr>
      <tr class="hide"><td colspan="2" id="pw_errmsg"> </td></tr>
      <tr class="hide">
        <th>비밀번호확인</th>
        <td><input type="password" name="pwChk" id="pwChk" placeholder ="비밀번호 확인"></td>
      </tr>
      <tr class="hide"><td colspan="2" id="pwChk_errmsg"> </td></tr>
      <tr>
        <td colspan="2"><button id="findBtn">비밀번호 찾기</button></td>
      </tr>
    </thead>    
  </table>
  </div>
                        <div id = "middles">
                        	<div id = "idfind"><a href = "<c:url value='/member/findIDForm'/>">아이디 찾기</a></div>
                        	<div id = "pwfind"><a href = "<c:url value='/member/findPWForm'/>">비밀번호 찾기</a></div>
                        	<div id = "joinmember"><a href = "<c:url value='/member/joinForm'/>">회원가입</a></div>
                        </div>
                    

    </nav>