<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
 <link rel="stylesheet" href="<c:url value ='/resources/css/list.css'/>">
 <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
<script src="<c:url value='/resources/js/common.js'/>"></script>
<script>
	window.addEventListener("load",init,false);


	function init(){
		//글쓰기 버튼 클릭시
		writeBtn.addEventListener("click", function(e){
			e.preventDefault();
			let returnPage = e.target.getAttribute('data-returnPage');
			let category= e.target.getAttribute('data-category');
			location.href=getContextPath()+"/board/writeForm/"+category+"/"+returnPage;
			},false);
			

		//검색버튼 클릭시
		searchBtn.addEventListener("click", function(e){
		e.preventDefault();
		console.log("검색");
		// 검색어 입력값이 없을때
		if(keyword.value.trim().length == 0){
			alert('검색어를 입력하세요!');
			keyword.value = "";
			keyword.focus();
			return false;
		}

		let stype = searchType.value; //검색유형
		let kword = keyword.value;    //검색어
		let category = e.target.getAttribute('data-category');
		console.log(category);

		location.href = getContextPath() + "/board/list/" + category + "/1/" + stype + "/" + kword;
		
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
        <div id ="freeboard">
        	<div id = "searchbar">
        		<form>
        		<select name="searchType" id = "searchType" style = "color: #696969;">
        				<option value="A" 
  						<c:out value="${pc.fc.searchType == 'A' ? 'selected' :'' }" />>전체</option>
  						 						
  						<option value="TC" 
  						<c:out value="${pc.fc.searchType == 'TC' ? 'selected' :'' }" />>제목+내용</option>
  						
 						  <option value="T"
 						  <c:out value="${pc.fc.searchType == 'T' ? 'selected' :'' }" />>제목</option>
 						  
  						<option value="C"
  						<c:out value="${pc.fc.searchType == 'C' ? 'selected' :'' }" />>내용</option>
  						
  						<option value="I"
  						<c:out value="${pc.fc.searchType == 'I' ? 'selected' :'' }" />>작성자</option>						
						</select>
        			<input type ="search"  name="keyword" value = "${pc.fc.keyword }" id="keyword" placeholder="검색어를 입력하세요"> <button type="button" data-category = "${category }" style = "padding-right:5px; padding-left:5px; background-color:#848484; color:white" id ="searchBtn" >검색</button>
        		</form>
        	</div>
        	<div id = "boardtitle" >
        		<div id ="no">번호</div>
        		<div id ="bcategory">분류</div>
        		<div id ="btitle" style="text-align:center;">제목</div>
        		<div id ="bid">작성자</div>
        		<div id ="bcdate">작성일</div>
        		<div id ="bhit">조회수</div>
        	</div>
        	<c:forEach var = "rec" items="${list }">
        	<ul class = "list_freecontent">
        		<li class = "listcontent">
	        		<div id ="no"><a href = "${pageContext.request.contextPath}/board/view/${category}/${pc.rc.reqPage}/${rec.bnum }">${rec.bnum }</a></div>
	        		<div id ="bcategory" class = "bcategorycon"><a href = "${pageContext.request.contextPath}/board/view/${category}/${pc.rc.reqPage}/${rec.bnum }">${rec.boardCategoryVO.cname}</a></div>
	        		<div id ="btitle">
	        			<c:forEach begin="1" end="${rec.bindent }">&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
										<c:if test="${rec.bindent > 0 }">
										<i class="fas fa-reply" style = "color:#FFBF00; padding-right:10px;"></i>
											<%-- <img src="${contextRoot }/resources/img/icon_reply.gif"/> --%>
										</c:if>
			        		<a href = "${pageContext.request.contextPath}/board/view/${category}/${pc.rc.reqPage}/${rec.bnum }">${rec.btitle }<c:if test="${rec.fid > 0 }"><i class="fas fa-paperclip" style="padding-left:10px;"></i></c:if><c:if test = "${rec.cnt > 0 }"><span style="padding-left:10px;">[${rec.cnt }]</span></c:if></a>	       			      
	        		</div>
	        		
	        		<div id ="bid"><a href = "${pageContext.request.contextPath}/board/view/${category}/${pc.rc.reqPage}/${rec.bnum }">${rec.bid}</a></div>        		
	        		<div id ="bcdate"><fmt:formatDate value="${rec.bcdate }" pattern="yyyy-MM-dd"/></div>
	        		<div id ="bhit">${rec.bhit}</div>	        		
        		</li>
        	</ul>       
        	</c:forEach>
        </div>
       
       
        <div id = "newcontent">
        	 <div class="paging">
						<!--  처음페이지 / 이전페이지 이동 -->
						<c:if test="${pc.prev }" >
        	 	<a href="${pageContext.request.contextPath }/board/list/${category}/1" id ="first"><i class="fas fa-angle-double-left"></i></a>
        	 	<a href="${pageContext.request.contextPath }/board/list/${category}/${pc.startPage-1}/${pc.fc.searchType}/${pc.fc.keyword}" id ="previus"><i class="fas fa-angle-left"></i></a>
        	 	</c:if>
        	 	<c:forEach var="pageNum" begin="${pc.startPage }" end="${pc.endPage }">
        		<!-- 현재페이지와 요청페이지가 다르면 -->
						<c:if test = "${pc.rc.reqPage != pageNum }">					
        		<a class="select" href="${pageContext.request.contextPath }/board/list/${category}/${pageNum}/${pc.fc.searchType}/${pc.fc.keyword}">${pageNum }</a>
						</c:if>
						<!-- 현재페이지와 요청페이지가 같으면 -->
						<c:if test = "${pc.rc.reqPage == pageNum }">
						<a class="select" style = "background-color:#FA5882;" href="${pageContext.request.contextPath }/board/list/${category}/${pageNum}/${pc.fc.searchType}/${pc.fc.keyword}">${pageNum }</a>
						</c:if>
        		</c:forEach> 		
        	<!-- 다음페이지 / 최종페이지 이동  -->
        	<c:if test="${pc.next }">
        		<a href="${pageContext.request.contextPath }/board/list/${category}/${pc.endPage+1}/${pc.fc.searchType}/${pc.fc.keyword}" id ="previus"><i class="fas fa-angle-right"></i></a>
        		<a href="${pageContext.request.contextPath }/board/list/${category}/${pc.finalEndPage}" id ="first"><i class="fas fa-angle-double-right"></i></a>
    			</c:if>
    			</div>
        	<div id = "writebutton">
        		<%-- <a href="<c:url value='/board/writeForm'/>">글쓰기</a> --%>
        		<button style="padding:5px; color:white; background-color:#A4A4A4;" id="writeBtn" data-category="${category }" data-returnPage="${pc.rc.reqPage }">글쓰기</button>
        	</div>
   			</div>
   	  			
   </nav>
   
   
  </div>
</html>