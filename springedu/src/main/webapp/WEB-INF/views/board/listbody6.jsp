<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>"></script>


<link rel="stylesheet" href="<c:url value ='/resources/css/list6.css'/>">

<style>
#dialogoverlay{
	display: none;
	opacity: .8;
	position: fixed;
	top: 0px;
	left: 0px;
	background: #FFF;
	width: 100%;
	z-index: 10;
}
#dialogbox{
	display: none;
	position: fixed;
	background: #000;
	border-radius:7px; 
	width:550px;
	z-index: 10;
}
#dialogbox > div{ background:#FFF; margin:8px; }
#dialogbox > div > #dialogboxhead{ background: #666; font-size:19px; padding:10px; color:#CCC; }
#dialogbox > div > #dialogboxbody{ background:#333; padding:20px; color:#FFF; }
#dialogbox > div > #dialogboxfoot{ background: #666; padding:10px; text-align:right; }
</style>

<script>
	window.addEventListener("load",init,false);


	function init(){
		//검색버튼 클릭시
		searchBtn.addEventListener("click", function(e){
		e.preventDefault();
		console.log("검색1");
		// 검색어 입력값이 없을때
		if(keyword.value.trim().length == 0){
			alert('검색어를 입력하세요!');
			keyword.value = "";
			keyword.focus();
			return false;
		}

		let stype = searchType.value; //검색유형
		let kword = keyword.value;    //검색어

		location.href = getContextPath() + "/board3/list6/" + stype + "/" + kword;

		
	},false);
		
		searchBtn2.addEventListener("click", function(e){
			e.preventDefault();
			console.log("검색2");
			// 검색어 입력값이 없을때
			if(keyword2.value.trim().length == 0){
				alert('검색어를 입력하세요!');
				keyword2.value = "";
				keyword2.focus();
				return false;
			}

			let stype2 = searchType2.value; //검색유형
			let kword2 = keyword2.value;    //검색어

			location.href = getContextPath() + "/board3/list7/" + stype2 + "/" + kword2;
		},false);

		var statusa = document.getElementsByClassName("statusa");

		for(i = 0; i<statusa.length; i++){	
			if (statusa[i].innerHTML == "완료"){
			 statusa[i].style.backgroundColor = "#A4A4A4";
			}
		} 	
			
}

	function CustomAlert(){
	    this.render = function(dialog){
	        var winW = window.innerWidth;
	        var winH = window.innerHeight;
	        var dialogoverlay = document.getElementById('dialogoverlay');
	        var dialogbox = document.getElementById('dialogbox');
	        dialogoverlay.style.display = "block";
	        dialogoverlay.style.height = winH+"px";
	        dialogbox.style.left = (winW/2) - (550 * .5)+"px";
	        dialogbox.style.top = "100px";
	        dialogbox.style.display = "block";
	        document.getElementById('dialogboxhead').innerHTML = "인사말";
	        document.getElementById('dialogboxbody').innerHTML = dialog;
	        document.getElementById('dialogboxfoot').innerHTML = '<button onclick="Alert.ok()">확인</button>';
	    }
		this.ok = function(){
			document.getElementById('dialogbox').style.display = "none";
			document.getElementById('dialogoverlay').style.display = "none";
		}
	}
	var Alert = new CustomAlert();
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
       
      <span id = "topfont" ><img src = "<c:url value='/resources/img/용병.png'/>">용병 지원 목록</span>
      <div id = "searchbar">
        	<select name="searchType" id = "searchType" style = "color: #696969;">
  						<option value="TC" 
  						<c:out value="${searchType == 'TC' ? 'selected' :'' }" />>가능 일자</option>
  						
 						  <option value="T"
 						  <c:out value="${searchType == 'T' ? 'selected' :'' }" />>지역</option>
 						  
  						<option value="C"
  						<c:out value="${searchType == 'C' ? 'selected' :'' }" />>실력</option>					
						</select>
        			<input type ="search" name="keyword" value = "${keyword }" id="keyword" placeholder="검색어를 입력하세요"> <button style = "padding-right:5px; padding-left:5px; background-color:#848484; color:white" id ="searchBtn">검색</button>        
        </div>
      <div id = "help">
      <c:forEach var = "rec" items="${list }">
    	<div id = "conbox1">  						
    		
    		<div id = "playerimg">
    		<a target ="_blank" href = "${pageContext.request.contextPath}/board3/view/${rec.bnum }"
    		onClick="window.open(this.href, '', 'width=500, height=230');">
    		<c:if test = "${!empty rec.fname }">
    			<img src="${pageContext.request.contextPath }/member/file/${rec.bid}"></a>
    		</c:if>
    		<c:if test = "${empty rec.fname }">
    			<img src="<c:url value='/resources/img/익명.png'/>"></a>
    		</c:if>
    		</div>			
    	
    		<div id = "playername">
    			<span style = "color:">${rec.bname}</span> 
    			<div id="dialogoverlay"></div>
					<div id="dialogbox">
					  <div>
					    <div id="dialogboxhead"></div>
					    <div id="dialogboxbody"></div>
					    <div id="dialogboxfoot"></div>
					  </div>
					</div>
    			<button id = "commentBtn" onclick="Alert.render('${rec.bcontent}')">인사말 보기</button>
    		</div>
    		<div id = "playerregion">
    			${rec.region } 
    		</div>
    		
    		<div id = "playerskill">
    			실력 : <span style= "color:red;"> ${rec.skill } </span>
    		</div>
    		<div id = "playermanner">
    			매너 : <span style= "color:red;"> ${rec.manner }</span>
    		</div>
    		<div id = "playerdate">
    			가능 일자 : <span style= "color:red;"> ${rec.pdate } </span>
    		</div>
    		
    	</div>
    	 </c:forEach>
      </div>
      

	<span id = "topfont2">용병 모집</span>
	<div id = "searchbar">
        	<select name="searchType2" id = "searchType2" style = "color: #696969;">
  						<option value="P" 
  						<c:out value="${searchType2 == 'P' ? 'selected' :'' }" />>경기 일자</option>
  						
 						  <option value="R"
 						  <c:out value="${searchType2 == 'R' ? 'selected' :'' }" />>경기 장소</option>
 						  
  						<option value="S"
  						<c:out value="${searchType2 == 'S' ? 'selected' :'' }" />>참가비</option>					
						</select>
        			<input type ="search" name="keyword2" value = "${keyword2 }" id="keyword2" placeholder="검색어를 입력하세요"> <button style = "padding-right:5px; padding-left:5px; background-color:#848484; color:white" id ="searchBtn2">검색</button>        
        </div>
      <div id = "entirewrap">
      <c:forEach var = "rec" items="${list2 }">
     <c:if test = "${rec.cnt > 0 }"><span style ="float:left; position:relative; top:10px;">댓글 ${rec.cnt }개</span></c:if>
		<div id = "bigbox">
			<div id = "con1">
				<a class = "statusa"href="${pageContext.request.contextPath}/board3/view2/${rec.bnum }">${rec.matchstatus }</a>
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
				필요 용병 수
				</div>
				<div id = "howcont">
				${rec.wantc }
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
