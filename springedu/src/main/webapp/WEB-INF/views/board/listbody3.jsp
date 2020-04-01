<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link rel="stylesheet" href="<c:url value ='/resources/css/list3.css'/>">
<script src="<c:url value='/resources/js/common.js'/>"></script>
<script>
	window.addEventListener("load",init,false);


	function init(){
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

		location.href = getContextPath() + "/board4/list3/" + stype + "/" + kword;
	},false);

		var statusa = document.getElementsByClassName("statusa");
		console.log(statusa);
		for(i = 0; i<statusa.length; i++){	
			if (statusa[i].innerHTML == "완료"){
			 statusa[i].style.backgroundColor = "#A4A4A4";
			}
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
                             <li><a href="<c:url value='/board/list/NOTICE'/>">공지사항</a></li>
                      <li><a href="<c:url value='/board/list/RESULT'/>">경기결과</a></li>
                      <li><a href="<c:url value='/board/list/BLACKLIST'/>">블랙리스트</a></li>
                            
                            
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        
      <span id = "topfont2">매치 현황</span>
	<div id = "searchbar">
        	<select name="searchType" id = "searchType" style = "color: #696969;">
        			<option value="A" 
  						<c:out value="${searchType == 'A' ? 'selected' :'' }" />>전체</option>
  						<option value="P" 
  						<c:out value="${searchType == 'P' ? 'selected' :'' }" />>경기 일자</option>
  						
 						  <option value="R"
 						  <c:out value="${searchType == 'R' ? 'selected' :'' }" />>경기 장소</option>
 						  
  						<option value="S"
  						<c:out value="${searchType == 'S' ? 'selected' :'' }" />>참가비</option>					
						</select>
        			<input type ="search" name="keyword" value = "${keyword }" id="keyword" placeholder="검색어를 입력하세요"> <button style = "padding-right:5px; padding-left:5px; background-color:#848484; color:white" id ="searchBtn">검색</button>        
        </div>
      <div id = "entirewrap">
      <c:forEach var = "rec" items="${list }"> 
      <c:if test = "${rec.cnt > 0 }"><span style ="float:left; position:relative; top:10px;">댓글 ${rec.cnt }개</span></c:if>
		<div id = "bigbox">
			<div id = "con1">
				<a class = "statusa" href="${pageContext.request.contextPath}/board4/view/${rec.bnum }">${rec.matchstatus }</a>
			</div>
			<div id = "con2">
				<div id = "date">
					${rec.mdate}
				</div>
				<div id = "time">
					${rec.stime }~ ${rec.etime }
				</div>
				<div id = "where">
					${rec.matchregion }
				</div>
			</div>
			<div id = "con3">
				<div id = "how">
				매치 방식
				</div>
				<div id = "howcont">
				${rec.matchmethod }
				</div>
			</div>
			<div id = "con3">
				<div id = "how">
				매너
				</div>
				<div id = "howcont">
				${rec.manner }
				</div>
			</div>
			<div id = "con4">
				<div id  = "moneyt">
				참가비
				</div>
				<div id ="moneycont">
				${rec.money }
				</div>
			</div>
			<div id = "con5">
				<div id  = "con5-1">
				${rec.bcontent }
				</div>
			</div>
			<div id = "con6">
				<div id  = "con6-1">
				원하는 실력
				</div>
				<div id  ="con6-2">
				${rec.skill }
				</div>
			</div>
			<div id = "con7">
				<div id  = "con7-1">
				연락처
				</div>
				<div id  ="con7-2">
				${rec.btel }
				</div>
			</div>	
		</div>
		</c:forEach>
		</div>      
       </nav>
      </div>