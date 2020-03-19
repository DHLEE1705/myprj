<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
<link rel="stylesheet" href="<c:url value ='/resources/css/list5.css'/>">
<script src="<c:url value='/resources/js/common.js'/>"></script>
<script>


window.addEventListener("load",init,false);

function init(){
	regBtn.addEventListener("click", function(e){
		e.preventDefault();
		console.log('클릭됨reg');
		if(checkValid()){
		      document.getElementById("boardVO3").submit(); 
		  }
		},false);	
}
function checkValid(){
	 var pdateEle = document.getElementById('pdate');
	
	 var flag = true; /* 회원가입 유효성 체크 유무 */

	 if(!ispdate(pdateEle.value)) {
		 pdate_errmsg.innerHTML = "가능일자를 입력하세요";
	       flag = flag && false;
	   }

	 else{
		 pdate_errmsg.innerHTML = "";
  }
		 return flag;

		 if(flag){
		    	document.getElementById("boardVO2").submit();
		    	alert('작성이 완료되었습니다.');
		 }   
}

//경기일자 정규식
function ispdate(asValue){
	var regExp = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
	return regExp.test(asValue);
}

</script>
</head>

<div id="navwrap">
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
      <span id = "topfont">용병 신청</span>
      <form:form action = "${pageContext.request.contextPath }/board3/write"
   				enctype = "multipart/form-data"
        		method = "post" 
        		modelAttribute="boardVO3">
        		<form:hidden path="bid"/>
   				<form:hidden path="bname"/>
   				<form:hidden path="btel"/>
   				
      <div id = "writeboard"> 
      	<div id = "categorytitle">
      		<div id = "selecttitle" class = "selecttitle">
      		 활동 지역
      		</div>
      		<div id = "selecttitle2" class = "selecttitle">
      		 실력
      		</div>
      		<div id = "selecttitle3" class = "selecttitle">
      		매너
      		</div>
      	</div>
      	<div class ="categoryselect">
    		<div class = "selectcont" id = "selectcont">
    			<form:select path="region" cssClass = "selectc">
                <option value="0">== 선 택 ==</option>
                <form:options path="region" items="${region }" itemValue="code" itemLabel="label"/>
               </form:select>
              <form:errors path="region" cssClass="error"></form:errors> 
    		</div>
    		
    		<div class = "selectcont" id = "selectcont2">
    			<form:select path="skill" cssClass = "selectc">
                                    <option value="0">== 선 택 ==</option>
                                    <form:options path="skill" items="${skill }" itemValue="code" itemLabel="label"/>
                                </form:select>
                                 <form:errors path="skill" cssClass="error3"></form:errors> 
    		</div>
    		<div class = "selectcont" id = "selectcont3">
    			<form:select path="manner" cssClass = "selectc">
                                    <option value="0">== 선 택 ==</option>
                                    <form:options path="manner" items="${manner }" itemValue="code" itemLabel="label"/>
                                </form:select>
                                <form:errors path="manner" cssClass="error4"></form:errors> 
    		</div>
    		
      	</div>
      	<div id = "categorytitle">
      		<div class = "selecttitle" id = "selecttitle5">
      		가능 일자
      		</div>
      		<div class = "selecttitle" id = "selecttitle6" style="color:#F5F5F5;">
      		게시판 
      		</div>
      	</div>
   
      	<div class = "selectcont" id = "selectcont7">
      		<form:input type="date" cssClass="dateselect" path="pdate" placeholder="yyyy-mm-dd"/>
      		<p id="pdate_errmsg"></p>
      	</div>
      	<div class = "selectcont" id = "selectcont8" style="background-color:transparent;">	
      	</div>
      	
      	
      	<div id = "contentinput">
      		<div id = "toptitle">
      			<span id ="conspan">하고싶은말(인사말)</span>
      		</div>
      		<div id = "textareacon">
      			<form:textarea id ="cont" path = "bcontent"></form:textarea>
      		</div>
      		
      	</div>
      	<form:errors path="bcontent" cssClass="error2"></form:errors>
      	<div id = "bottom">
      		<input type = "reset" value="취소"/ id = "cancelBtn">
      		<form:button class="btn" id="regBtn">작성 완료</form:button>
      	</div>
	  </div>
	 	
	  </form:form>
       </nav>
      </div>

</html>