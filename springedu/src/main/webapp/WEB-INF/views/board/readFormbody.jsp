<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
 <link rel="stylesheet" href="<c:url value ='/resources/css/readForm.css'/>">
 
 <script src="<c:url value='/resources/js/common.js'/>"></script>

 <script>
		window.addEventListener("load",init, false);
		function init(){
			changeMode(false);

			let modifyBtn = document.getElementById('modifyBtn');
			let deleteBtn = document.getElementById('deleteBtn');
			
      //답글
			replyBtn.addEventListener("click",function(e){
				e.preventDefault();
				console.log("답글");
				console.log(getContextPath());
				let returnPage = e.target.getAttribute('data-returnPage');				
 				let bnum = e.target.getAttribute('data-bnum');
				location.href = getContextPath()+"/board/replyForm/"+returnPage+"/"+bnum;
			},false);
			
      //수정
      if(modifyBtn != null){
			modifyBtn.addEventListener("click",function(e){
				e.preventDefault();
				/* console.log("수정"); */
				changeMode(true);
			},false);
     }
      //삭제
      if(deleteBtn != null){
			deleteBtn.addEventListener("click",function(e){
				e.preventDefault();
					console.log("삭제"+e.target.getAttribute('data-bnum'));
					
					/* if (e.target.tagName != 'i') return false; */
					if(confirm("삭제하시겠습니까?")){
						let returnPage = e.target.getAttribute('data-returnPage');
	 	 				let bnum = e.target.getAttribute('data-bnum');
						location.href = getContextPath()+"/board/delete/"+returnPage+"/"+bnum;
					}
				},false);
      }
      //취소(수정모드->읽기모드)
			cancelBtn.addEventListener("click",function(e){
				e.preventDefault();
				console.log("취소");
				changeMode(false);
			},false);
			
      //저장	
			saveBtn.addEventListener("click",function(e){
				e.preventDefault();
				console.log("저장");
				//유효성 체크
				document.getElementById('boardVO').submit();
			},false);      

      //목록
			listBtn.addEventListener("click",function(e){
				e.preventDefault();
				console.log("목록");
				let returnPage = e.target.getAttribute('data-returnPage');
				location.href=getContextPath()+"/board/list/"+returnPage;
			},false);     

			//첨부파일 1건 삭제 : Ajax로 구현함.
			let fileList = document.getElementById('fileList');
			if(fileList != null ){
				fileList.addEventListener("click",function(e){
					console.log(e.target); //이벤트가 발생된 요소
					console.log(e.currentTarget);//이벤트가 등록된 요소
					console.log(e.target.tagName);//선택된 요소가
					if(e.target.tagName != 'I') return false;			
					if(!confirm('삭제하시겠습니까?')) return false;
					//실제 이벤트가 발생한요소의 data-del_file속성값 읽어오기
					let fid = e.target.getAttribute('data-del_file');
	
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
						  	let delTag = e.target.parentElement.parentElement.parentElement;
	 					  	//부모요소에서 삭제대상 요소 제거
						  	fileList.removeChild(delTag); 
						  }else{
						  	console.log('실패!!');
						  }
					  }
				  }
				 	  			  
				  //post방식
				  xhttp.open("DELETE","http://localhost:9080/portfolio/board/file/"+fid,true);
				  xhttp.send();
				},false);  
			}
		}

		//읽기 모드 , 수정모드
		function changeMode(flag){						
				let rmodes = document.getElementsByClassName("rmode");
				let umodes = document.getElementsByClassName("umode");
			//수정모드	
			if(flag){
				//제목변경 => 게시글 보기
				/* document.getElementById("title").textContent = '게시글 수정'; */
				//분류,필드 제목,내용 필드
				/* document.getElementById("boardCategoryVO.cid").removeAttribute("disabled"); */			
				document.getElementById("btitle").removeAttribute("readOnly");			
				document.getElementById("bcontent").removeAttribute("readOnly");			
				//수정모드버튼 활성화
				Array.from(rmodes).forEach(e=>{e.style.display="none";});
				Array.from(umodes).forEach(e=>{e.style.display="block";});
			//읽기모드	
			}else{
				//제목변경 => 게시글 보기
				/* document.getElementById("title").textContent = '게시글 보기'; */
				//분류,필드 제목,내용 필드
				/* document.getElementById("boardCategoryVO.cid").setAttribute("disabled",true); */						
				document.getElementById("btitle").setAttribute("readOnly",true);
				document.getElementById("bcontent").setAttribute("readOnly",true);	
				//읽기모드버튼 활성화				
				Array.from(rmodes).forEach(e=>{e.style.display="block";});
				Array.from(umodes).forEach(e=>{e.style.display="none";});
			}
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
    <!--  <div id = "readboardwrap"> -->
     <form:form action="${pageContext.request.contextPath }/board/modify/${returnPage }" 
					    					 enctype="multipart/form-data"
					    					 method="post"
					    					 modelAttribute="boardVO">
				<form:hidden path="bnum"/>
				<form:hidden path="bgroup"/>
        <form:hidden path="boardCategoryVO.cid"/>
        <div id ="readboard">
					<div id ="readtitle">
						<div id ="contitle">
							<form:input class="col-2" type="text" path="btitle" readOnly="true"/><%-- ${boardVO.btitle } --%>
						</div>
						<div id = "condatetext">
						작성 일자
						</div>
						<div id = "condate">
							<fmt:formatDate value="${boardVO.bcdate }" pattern="yyyy-MM-dd"/>
						</div>
					</div>
					<div id = "readid">
						<div id ="idtext">작성자</div>
						<div id ="conid">
						 ${boardVO.bid }
						</div>
					</div>	
					<div id = "contentbox">				
								
						<div id = "contenttext" class="row">
								<form:textarea class="col-3" rows="10" path="bcontent" readOnly="true"></form:textarea>
					      <form:errors path="bcontent"/></div>
					</div>
					<div id = "filebox" >
						<div id = "filetext">
						 첨부 파일
						</div>
						<div id = "file">
							 <c:if test="${!empty files}">
					    <div class="row" style= "background-color:white;">
					    	<!-- <div class="col-1" path="" style= "background-color:white;">첨부목록</div> -->
					    	<div class="col-2" id="fileList" style= "background-color:white; width:100%;">
					    		<c:forEach var="file" items="${files }">
					    		<p style="display:flex">
						    		<a class="fileList" href="${contextRoot}/board/file/${file.fid }">${file.fname }</a>
						    	<%-- 	<img src="${pageContext.request.contextPath }/board/file/${file.fid }" alt=""/> --%>
						    		<span style="margin-left:10px; color:black">(${file.fsize/1000 } kb)</span>
						    		<span class="umode" style="margin-left:10px">
						    			<a href="#none"><i class="fas fa-backspace" data-del_file="${file.fid }"></i></a>
						    			
						    		</span>
						    	</p>		
						    												    		
						    	</c:forEach>
					    	</div>
					    </div>
					    </c:if>
						</div>
					</div>
				<div id = "chumbu" class="umode">
					<div id = "chumbutext">첨부</div>
					<div id = "chumbucontent" class="umode">
						<form:input type ="file" path = "files" multiple="multiple"  style = "font-size:18px;"/>
						<form:errors path="files"/>
					</div>
				</div>
				<div id = "vote">
					<div id ="good"><img id = "goodimg" src="<c:url value='/resources/img/좋다.png'/>"></div>
					<div id ="notgood"><img id = "notgoodimg" src="<c:url value='/resources/img/싫다.png'/>"></div>
				</div>
				<div id = "countwrap">
					<div id = "goodcount">110</div>
					<div id = "notgoodcount">3</div>
				</div>
				
				<div id ="comment">				
					<%@ include file="rereply.jsp"%>
				</div>
				
				</div>						       	

        <div id = "newcontent" class="row">
        	<div id = "modify" class="row btns">
        				<form:button class="btn rmode" id="replyBtn" data-returnPage = "${returnPage }"  data-bnum ="${boardVO.bnum }">답글</form:button>
					        <!-- 작성자만 수정, 삭제 가능 -->
					        <c:if test="${sessionScope.member.id == boardVO.bid }">
					        <form:button class="btn rmode" id="modifyBtn">수정</form:button>
					        <form:button class="btn umode" id="deleteBtn" data-returnPage = "${returnPage }" data-bnum ="${boardVO.bnum }">삭제</form:button>
					        </c:if>
					        <!-- 작성자만 수정, 삭제 가능 끝 -->
					        
					        <form:button class="btn umode" id="cancelBtn">취소</form:button>
					        <form:button class="btn umode" id="saveBtn">저장</form:button>
        	</div>	
        <%-- 	<div id ="write">
        	<a href="<c:url value='/board/writeForm'/>">글쓰기</a>
        	</div> --%>
        	<div id = "listview">
        		<form:button class="btn" id="listBtn" data-returnPage="${returnPage }" style="padding:10px; background-color:#A4A4A4; color:white;">목록</form:button>
        		<%-- <a href="<c:url value='/board/list'/>" style="margin-left:3px;">목록 보기</a> --%>
        	</div>
       </div>
		 </form:form>
   </nav> 
  </div> 