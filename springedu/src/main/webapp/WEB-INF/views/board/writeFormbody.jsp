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
		listBtn.addEventListener("click",function(e){
				e.preventDefault();
				let returnPage = e.target.getAttribute('data-returnPage');
				let category = e.target.getAttribute('data-category');
				location.href=getContextPath()+"/board/list/"+category + "/" + returnPage;
				
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
                             <li><a href="<c:url value='/board/list/NOTICE'/>">공지사항</a></li>
                      <li><a href="<c:url value='/board/list/RESULT'/>">경기결과</a></li>
                      <li><a href="<c:url value='/board/list/BLACKLIST'/>">블랙리스트</a></li>
                            
                            
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
       <div id = "writeboardwrap">
       <form:form action = "${pageContext.request.contextPath }/board/write/${category}/${returnPage }" 
        						 enctype = "multipart/form-data"
        						 method = "post" 
        						 modelAttribute="boardVO">
        <div id ="writeboard">
        <!--  dafault는 post -->   	 
        	<div id = "top">글쓰기</div>
        	<div id = "selectboard">
        			
						<div id ="titlecategory" style="margin-left:20px;">게시판</div>
						<div id = "selectc">
        			<form:select class = "col-2" path="boardCategoryVO.cid">
  							<option value ="0">&nbsp;==선택 ==</option>
  							<form:options path="boardCategoryVO.cid" 
  														items ="${boardCategoryVO}"
  														itemValue="cid"
  														itemLabel="cname"/>
							</form:select>					
								<form:errors path="boardCategoryVO.cid" cssClass="error"></form:errors>						
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
        		<div id="error123div"><form:errors path="bcontent" cssClass = "error123"></form:errors></div>
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
				<div id = "list"><form:button class="btn" id="listBtn" data-returnPage="${returnPage }" data-category="${category }" style = "background-color:#A4A4A4; color:#FFFFFF; font-size:16px; padding:5px;">목록</form:button></div>			
			 </div>		
			 
			 </div>
			 </form:form>
   </nav>
   
   
  </div>
</html>