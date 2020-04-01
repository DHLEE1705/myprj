<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
	<link rel="stylesheet" href="<c:url value ='/resources/css/memberjoin.css'/>">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content"">
    <script src="<c:url value ='/resources/js/memberjoin.js'/>"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
        <script>
        window.addEventListener("load",init2,false); 

        function init2(){
        	var upload = document.querySelector('#input_img');
        	var preview = document.querySelector('.img_wrap');
     
        upload.addEventListener('change',function (e) {
            var get_file = e.target.files;
     
            var image = document.createElement('img');
     
            /* FileReader 객체 생성 */
            var reader = new FileReader();
     
            /* reader 시작시 함수 구현 */
            reader.onload = (function (aImg) {
                console.log(1);
     
                return function (e) {
                    console.log(3);
                    /* base64 인코딩 된 스트링 데이터 */
                    aImg.src = e.target.result
                }
            })(image)
     
            if(get_file){
                /* 
                    get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
                    onload 에 설정했던 return 으로 넘어간다.
                    이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
                */
                reader.readAsDataURL(get_file[0]);
                console.log(2);
            }
     
            preview.appendChild(image);
        })
        } 
        </script>
            <div class="allcontainer">						
                <form:form id ="memberjoinForm" 
                					 enctype = "multipart/form-data"
                					 method = "post" modelAttribute="mvo" 
                					 action ="${pageContext.request.contextPath }/member/join">
                					 
                    <div class="container1"><span>프로필 사진<b id="bp">(선택)</b></span>
                        <div class="img_wrap">
                        	
                        </div>
                       
                   			<div class="file_input">
											    <label>
											        업로드
											        <form:input type ="file" path = "file" multiple="multiple" id = "input_img" onchange="javascript:document.getElementById('file_route').value=this.value"/>
											       <!--  <input type="file" id = "input_img" onchange="javascript:document.getElementById('file_route').value=this.value"> -->
											    </label>
											    
											    <input type="text" readonly="readonly" title="File Route" id="file_route">
												</div>
                   </div>
                    <div class="container">

                        <div class="content">

                            <div>
                                <h2 class="join-title">회 원 가 입</h2>
                            </div>
                            <div class="join-bottom">
                                <h5><b>*</b>표기된 항목은 필수입력입니다.</h5>
                            </div>
                            <div id="idtext"><form:label path="id">아이디<b>*</b></form:label></div>
                            <div id ="iddiv"><form:input type="text" path="id" placeholder="이메일 형식"/><i
                                    class="far fa-envelope fa-lg"></i><button type="button" id = "checkid" style="visibility: hidden;"></button></div>
                            <div>
                            	<span class="errmsg" id="id_errmsg"></span>
                            	<form:errors path = "id" cssClass="errmsg"></form:errors>
                            </div>                        
                            <div><form:label path="pw">비밀번호</form:label></div>
                            <div><form:input type="password" path="pw" placeholder="특수문자, 영문, 숫자 6~15자리"/><i
                                    class="fas fa-lock fa-lg"></i></div>
                            <div>
                            	<span class="errmsg" id="pw_errmsg"></span>
                            	<form:errors path = "pw" cssClass="errmsg"></form:errors>
                            </div>       
                            <div><label for="pwChk">비밀번호 재확인</label></div>
                            <div><input type="password" name="pwChk" id="pwChk" ><i class="fas fa-lock fa-lg"></i></div>
                            <div><span class="errmsg" id="pwChk_errmsg"></span></div>       
                            <div><form:label path="name">이름<b>*</b></form:label></div>
                            <div><form:input type="text" path="name" placeholder="2~4글자"/></div>
             								<div>
             									<span class="errmsg" id="name_errmsg">
             									<form:errors path = "name" cssClass="errmsg"></form:errors>
             								</div>                             
                            <div><form:label path="birth">생년월일<b>*</b></form:label></div>
                            <div><form:input type="date" path="birth" placeholder="yyyy-mm-dd"/></div>
                            <div>
                            	<span class="errmsg" id="birth_errmsg"></span>
                            	<%-- <form:errors path = "birth" cssClass="errmsg"></form:errors> --%>
                            </div>                             
                            <div><form:label path="tel">전화번호<b>*</b></form:label></div>
                            <div><form:input type="tel" path="tel" placeholder="-포함 입력하세요"/><i
                                    class="fas fa-mobile-alt fa-lg"></i></div>
                            <div>
                              <span class="errmsg" id="tel_errmsg"	></span>        
                            	<form:errors path = "tel" cssClass="errmsg"></form:errors>
                            </div>
                            <div><form:label path="region">활동 지역<b>*</b></form:label></div>
                            <div>
                                <form:select path="region">
                                    <option value="0">== 선 택 ==</option>
                                    <form:options path="region" items="${region }" itemValue="code" itemLabel="label"/>
                                </form:select>
                            </div>
                           <div>
                           	<span class="errmsg" id="region_errmsg"></span>
                           	<form:errors path = "region" cssClass="errmsg"></form:errors>
                           </div>
                           	<!-- <div><span class="errmsg" id="region_errmsg"></span></div> -->
                            <div><form:label path="gender">성별<b>*</b></form:label></div>
                            <div id="radioname">
                                <form:radiobuttons path="gender" items="${gender }" itemValue="code" itemLabel="label"/>
                            </div>
                            <div>
                            	<span class="errmsg" id="gender_errmsg"></span>
                            	<form:errors path = "gender" cssClass="errmsg"></form:errors>
                            </div>
                          	<div style="color:#f00; font-weight:bold; font-size:0.8rem;">${svr_msg }</div>
                            <div><button type="submit" id="joinBtn">가 입 하 기</button></div>
                        </div>
                    </div>
                </form:form>
               </div>
    </nav>