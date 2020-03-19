<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
	<link rel="stylesheet" href="<c:url value ='/resources/css/membermodify.css'/>">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
    <script src="<c:url value ='/resources/js/membermodify.js'/>"></script>
    
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
        });

      //첨부파일 1건 삭제 : Ajax로 구현함.
		let fileList = document.getElementById('fileList');
		if(fileList != null ){
			fileList.addEventListener("click",function(e){
				console.log("타겟" + e.target); //이벤트가 발생된 요소
				console.log(e.currentTarget);//이벤트가 등록된 요소
				console.log(e.target.tagName);//선택된 요소가
				if(e.target.tagName != 'I') return false;			
				if(!confirm('삭제하시겠습니까?')) return false;
				//실제 이벤트가 발생한요소의 data-del_file속성값 읽어오기
				let id = e.target.getAttribute('data-del_file');
				console.log(id);
			  //AJAX 사용
			  //1) XMLHttpRequest객체 생성	
			  var xhttp = new XMLHttpRequest();
			  
			  //2) 서버응답처리
			  xhttp.addEventListener("readystatechange",ajaxCall,false);
			  function ajaxCall(){
				  if (this.readyState == 4 && this.status == 200) {
					  console.log(this.responseText);
					  if(this.responseText == "success"){
					  	console.log('성공!!');
					  	//삭제대상 요소 찾기
 					  	let delTag = e.target.parentElement.nextElementSibling;
 					  	//부모요소에서 삭제대상 요소 제거
					  	fileList.removeChild(delTag); 
					  	
					  }else{
					  	console.log('실패!!');
					  }
				  }
			  }
			 	  			  
			  //post방식
			  xhttp.open("DELETE","http://localhost:9080/portfolio/member/file/"+id ,true);
			  xhttp.send();
			},false);  
		}
        } 
        </script>
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
            <div class="allcontainer">
                <form:form id ="modifyForm" 
                enctype = "multipart/form-data"
                method = "post" modelAttribute="mvo" 
                action ="${pageContext.request.contextPath }/member/modify">
                    
                    <div class="container1"><span>프로필 사진<b id="bp">(선택)</b></span>
             
                   
                        <div class="img_wrap" id="fileList">
                        		<a href="#none"><i class="fas fa-times" data-del_file="${mvo.id }" style="float:left; position:relative;
                        	  left: 70px; top:20px;"></i></a>	
                        	  <c:if test="${!empty mvo.fname}">
                             	<img src="${pageContext.request.contextPath }/member/file/${mvo.id }" alt=""/> 
                             <%-- 	<img src="${pageContext.request.contextPath }/board/file/${file.fid }" alt=""/> --%>
                            </c:if>
                        </div>               
                   			<div class="file_input">
											    <label>
											        사진 변경
											        <form:input type ="file" path = "file" multiple="multiple" id = "input_img" onchange="javascript:document.getElementById('file_route').value=this.value"/>
											       
											       <!--  <input type="file" id = "input_img" onchange="javascript:document.getElementById('file_route').value=this.value"> -->
											    </label>

											    <input type="text" readonly="readonly" style="text-align:center;" value="${mvo.fname }" placeholder="변경시 삭제 후 등록 바람" title="File Route" id="file_route">
												</div>
                   </div>
                    <div class="container">

                        <div class="content">

                            <div>
                                <h2 class="join-title">회원정보수정</h2>
                            </div>
                            <div class="join-bottom">
                                
                            </div>
                            
                            <div id="idtext"><form:label path="id" id="">아이디</form:label></div>
                            <div id ="iddiv"><form:input type="text" path="id" readonly ="true" placeholder="이메일 형식"/><i
                                    class="far fa-envelope fa-lg"></i><button type="button" id = "checkid" style ="visibility:hidden"></button></div>
                            <div>
                            	<span class="errmsg" id="id_errmsg"></span>
                            	<form:errors path ="id" cssClass="errmsg"></form:errors>
                            </div>
                          	
                          	
                            <div><form:label path="pw">비밀번호</form:label></div>
                            <div><form:input type="password" path="pw" id="pw"/><i class="fas fa-lock fa-lg"></i></div>
                            <div>
                            	<span class="errmsg" id="pw_errmsg"></span>
                            	<form:errors path = "pw" cssClass="errmsg"></form:errors>
                            </div>
                          	                           
                            <div><form:label path="name">이름</form:label></div>
                            <div><form:input type="text" path="name" id="name" placeholder="2~4글자" /></div>
                            <div>
                            	<span class="errmsg" id="name_errmsg"></span>
                            	<form:errors  path = "name" cssClass="errmsg"></form:errors>
                            </div>
                                               
                            <div id="birthTag"><form:label path="birth">생년월일</form:label></div>
                            <div><form:input type="date" path="birth" id="birth" placeholder="yyyy-mm-dd"/></div>
                            <div>
                            	<span class="errmsg" id="birth_errmsg"></span>
                            	<form:errors path="birth" cssClass="errmsg"></form:errors>
                            </div>
                                                       
                            <div><form:label path="tel">전화번호</form:label></div>
                            <div><form:input type="tel" path="tel" id="tel" placeholder="-포함 입력하세요"/><i
                                    class="fas fa-mobile-alt fa-lg"></i></div>
                            <div>
                            	<span class="errmsg" id="tel_errmsg"	></span>
                            	<form:errors path = "tel" cssClass="errmsg"></form:errors>
                            </div>                         
                            
                            <div><form:label path="region">활동 지역</form:label></div>
                            <div>
															<form:select path="region" style = "position:relative; right:10px;">
            										<option value="0">== 선 택 ==</option>
            										<form:options path="region" items="${region }" itemValue="code" itemLabel="label" />
          										</form:select>
                            </div>
                            <div>
                            	<span class="errmsg" id="region_errmsg"></span>
                            	<form:errors path = "region" cssClass="errmsg"></form:errors>
                            </div>
                                                                                    
                            <div id="radioname">
                                <form:radiobuttons path="gender" items="${gender }" itemValue="code" itemLabel="label"/>
                            </div>
                            <div>
                            	<span class="errmsg" id="gender_errmsg"></span>
                            	<form:errors path="gender" cssClass="errmsg"></form:errors>
                            </div>
                            
                            <div><button type="submit" id="modifyBtn">수 정 하 기</button></div>
                        		<div id ="deleteBtn" style = "background-color:red;"><a href="<c:url value='/member/outForm'/>"><span id="del">회원탈퇴</span></a></div>
                        </div>															
                    </div>
                </form:form>
               </div>
    </nav>