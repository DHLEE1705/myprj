<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
 <link rel="stylesheet" href="<c:url value ='/resources/css/writeForm.css'/>">
 
 <script src="<c:url value='/resources/js/common.js'/>"></script>
 <script>
	window.addEventListener("load",init, false);

	function init(){
		//등록 버튼 클릭시
		writeBtn.addEventListener("click", function(e){
			e.preventDefault();
			//유효성 체크
			//게시글 작성 전송
			document.getElementById("boardVO").submit();			
			},false);

		//취소 버튼 클릭시
		/* cancelBtn.addEventListener("click", function(e){
			e.preventDefault();
			document.getElmentById("boardVO").reset();
			},false); */

		//목록 버튼 클릭시
		listBtn.addEventListener("click", function(e){
			e.preventDefault();
			let returnPage = e.target.getAttribute('data-returnPage');
			location.href=getContextPath()+"/board/list/"+returnPage;
			},false);
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
       <div id = "writeboardwrap">
       <form:form action = "${pageContext.request.contextPath }/board/reply/${returnPage }" 
        						 enctype = "multipart/form-data"
        						 method = "post" 
        						 modelAttribute="boardVO">
        <form:hidden path="boardCategoryVO.cid" value="${boardVO.boardCategoryVO.cid }"/>
        <form:hidden path="bgroup" value="${boardVO.bgroup }"/>
        <form:hidden path="bindent" value="${boardVO.bindent }"/>
        <form:hidden path="bstep" value="${boardVO.bstep }"/>
        <div id ="writeboard">
        <!--  dafault는 post -->   	 
        	<div id = "top">답글쓰기</div>
        	<div id = "selectboard">
        		<div id = "titleselectboard">게시판</div>
        		<!-- <div id = "selectb">
        			<select class = "" name="selectb" >style = "color: #696969; font-size:18px;"
  							<option value="	">종합게시판</option>
  							<option value="">경기게시판</option>
 						  	<option value="">블랙리스트</option>
  							<option value="">공지사항</option>
					</select>
						</div> -->	
						<div id ="titlecategory" style="position:relative; right:15px;">${boardVO.boardCategoryVO.cname }</div>
						<div id = "selectc">
        			<%-- <form:select class = "col-2" path="boardCategoryVO.cid" disable="true">
  							<option value ="0">&nbsp;==선택 ==</option>
  							<form:options path="boardCategoryVO.cid" 
  														items ="${boardCategoryVO}"
  														itemValue="cid"
  														itemLabel="cname"/>
							</form:select>					
								<form:errors path="boardCategoryVO.cid" cssClass="error"></form:errors> --%> 						
						</div>
						<div id = "bin">dsad</div>	
        	</div>
        	
        <div id ="titleboard">
        	<div id = "titlename">제목</div>
        	<div id = "titlecont"><form:input type="text" path="btitle" placeholder = "제목을 입력하세요" /></div>
        	<form:errors path="btitle" cssClass = "error"></form:errors>
        </div>
         <div id ="idboard">
        	<div id = "idname">작성자</div>
        	<div id = "idcont">${sessionScope.member.id}</div>
        	<form:errors path="bid"></form:errors>
        </div>
        <div id ="textboard">
        	<div id = "textname">내용</div>
        	<div id = "textcont">
        		<form:textarea id ="bcontent" path = "bcontent"></form:textarea>
        	</div>
        	<div id ="errdiv">
        		<form:errors path="bcontent"></form:errors>
        	</div>
        </div>
        <div id ="fileboard">
        	<div id = "filename">첨부</div>
        	<div id = "filecont"></div>
        	<div id = "fileupload"><form:input type ="file" path = "files" multiple="multiple"  style = "font-size:18px;"/></div>
					<form:errors path="files"></form:errors>
        </div>
			</div>
								
			 <div id = "bottom">
				<div id = "register"><form:button class="btn" id="writeBtn" style = "background-color:#A4A4A4; color:#FFFFFF; font-size:16px; padding:5px;">등록</form:button></div>
				<div id = "cancel"><input type="reset" class="btn" id="cancelBtn" value = "취소" style = "background-color:#A4A4A4; color:#FFFFFF; font-size:16px; padding:5px;"/></div>
				<div id = "list"><form:button class="btn" id="listBtn" style = "background-color:#A4A4A4; color:#FFFFFF; font-size:16px; padding:5px;">목록</form:button></div>			
			 </div>
			 
			 </div>
			 </form:form>
   </nav>
   
   
  </div>
</html>