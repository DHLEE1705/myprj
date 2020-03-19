<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head><c:url value='../index.jsp'/>
	<link rel="stylesheet" href="<c:url value ='/resources/css/memberjoin.css'/>">
    <script src="<c:url value ='/resources/js/memberjoin.js'/>"></script>
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

                    <li>
                        <a href="#">이벤트</a>
                        <ul>
                            <li><a href="#">이벤트1</a></li>
                            <li><a href="#">이벤트2</a></li>
                            <li><a href="#">이벤트3</a></li>
                        </ul>
                    </li>
                    <li>
                      <a href="#">공지사항</a>
                      <ul>
                          <li><a href="#">공지사항1</a></li>
                          <li><a href="#">공지사항2</a></li>
                          <li><a href="#">공지사항3</a></li>
                      </ul>
                  </li>
                </ul>
            </div>
        </div>
            <div class="allcontainer">
                <form id ="memberjoinForm" method = "post" action ="<c:url value = '/member/join'/>">
                    <div class="container1"><span>프로필 사진<b id="bp">(선택)</b></span>
                        <div id="profile"><img src="<c:url value='/resources/img/football-player.png'/>"></div>
                        <div id="camera"><a href="#"><img src="<c:url value='/resources/img/camera.png'/>"></a></div>
                    </div>
                    <div class="container">

                        <div class="content">

                            <div>
                                <h2 class="join-title">회 원 가 입</h2>
                            </div>
                            <div class="join-bottom">
                                <h5><b>*</b>표기된 항목은 필수입력입니다.</h5>
                            </div>
                            <div id="idtext"><label for="id">아이디<b>*</b></label></div>
                            <div id ="iddiv"><input type="text" name="id" id="id" placeholder="이메일 형식"><i
                                    class="far fa-envelope fa-lg"></i><button type="button" onclick = "alert('사용가능한아이디입니다.');" id = "checkid" >검사</button></div>
                            <div><span class="errmsg" id="id_errmsg"></span></div>
                          
                            <div><label for="pw">비밀번호</label></div>
                            <div><input type="password" name="pw" id="pw"  placeholder="특수문자, 영문, 숫자 6~15자리"><i
                                    class="fas fa-lock fa-lg"></i></div>
                            <div><span class="errmsg" id="pw_errmsg"></span></div>
                            <div><label for="pwChk">비밀번호 재확인</label></div>
                            <div><input type="password" id="pwChk" ><i class="fas fa-lock fa-lg"></i></div>
                            <div><span class="errmsg" id="pwChk_errmsg"></span></div>
                            <div><label for="name">이름<b>*</b></label></div>
                            <div><input type="text" name="name" id="name" placeholder="2~4글자"></div>
                            <div><span class="errmsg" id="name_errmsg"></span></div>
                             
                            <div id="birthTag"><label for="birthTag">생년월일<b>*</b></label></div>
                            <div><input type="date" name="birth" id="birth" placeholder="yyyy-mm-dd"></div>
                            <div><span class="errmsg" id="birth_errmsg"></span></div>
                            
                            <div><label for="tel">전화번호<b>*</b></label></div>
                            <div><input type="tel" name="tel" id="tel"  placeholder="-포함 입력하세요"><i
                                    class="fas fa-mobile-alt fa-lg"></i></div>
                            <div><span class="errmsg" id="tel_errmsg"	></span></div>
                            <div><label for="region">활동 지역<b>*</b></label></div>
                            <div>
                                <select name="region" id="region">
                                    <option value="">== 선 택 ==</option>
                                    <option value="서울" selected ="selected">서울</option>
                                    <option value="경기">경기</option>
                                    <option value="대구">대구</option>
                                    <option value="부산">부산</option>
                                    <option value="울산">울산</option>
                                </select>
                            </div>
                            <div><span class="errmsg" id="region_errmsg"></span></div>
                            <div><label for="men">성별<b>*</b></label></div>
                            <div id="radioname">
                                <input type="radio" name="gender" id="men" value = "남" checked="checked"><label for="men">
                                    <p id="men">남</p>
                                </label>
                                <input type="radio" name="gender" id="women" value = "여"><label for="women">
                                    <p id="woman">여</p>
                                </label>
                            </div>
                            <div><span class="errmsg" id="gender_errmsg"></span></div>
                            <div><button type="submit" id="joinBtn">가 입 하 기</button></div>
                        </div>
                    </div>
                </form>
               </div>
    </nav>