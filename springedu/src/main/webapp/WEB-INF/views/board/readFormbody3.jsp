 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link rel="stylesheet" href="<c:url value ='/resources/css/readForm3.css'/>">
 <script src="<c:url value='/resources/js/common.js'/>"></script>
<script>


window.addEventListener("load",init, false);
function init(){
	changeMode(false);

	let modifyBtn = document.getElementById('modifyBtn');
	let deleteBtn = document.getElementById('deleteBtn');
	
	if(modifyBtn != null){
		modifyBtn.addEventListener("click",function(e){
			e.preventDefault();
			changeMode(true);
		},false);
	}
	//수정
    if(modifyBtn != null){
			modifyBtn.addEventListener("click",function(e){
				e.preventDefault();
				/* console.log("수정"); */
				changeMode(true);
			},false);
   }
  //취소(수정모드->읽기모드)
	cancelBtn.addEventListener("click",function(e){
		e.preventDefault();
		console.log("취소");
		changeMode(false);
	},false); 

	var statusa = document.getElementById("statusa");
	console.log(statusa);	
	if (statusa.innerHTML == "완료"){
		 statusa.style.backgroundColor = "#A4A4A4";
		} 	
	
    //삭제
    if(deleteBtn != null){
			deleteBtn.addEventListener("click",function(e){
				e.preventDefault();
					console.log("삭제"+e.target.getAttribute('data-bnum'));
					
					/* if (e.target.tagName != 'i') return false; */
					if(confirm("삭제하시겠습니까?")){
						
	 	 				let bnum = e.target.getAttribute('data-bnum');
	 	 				location.href = getContextPath()+"/board4/delete/"+bnum;
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
				document.getElementById('boardVO4').submit();
			},false);      
	
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
		document.getElementById("matchstatus").removeAttribute("disabled");			
		/* document.getElementById("btitle").removeAttribute("readOnly");	 */		
		document.getElementById("bcontent").removeAttribute("readOnly");			
		//수정모드버튼 활성화
		Array.from(rmodes).forEach(e=>{e.style.display="none";});
		Array.from(umodes).forEach(e=>{e.style.display="block";});
	//읽기모드	
	}else{
		//제목변경 => 게시글 보기
		/* document.getElementById("title").textContent = '게시글 보기'; */
		//분류,필드 제목,내용 필드
		document.getElementById("matchstatus").setAttribute("disabled",true); 						
		/* document.getElementById("btitle").setAttribute("readOnly",true); */
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
      <div id = "entirewrap">
       <form:form action="${pageContext.request.contextPath }/board4/modify/" 
					    					 enctype="multipart/form-data"
					    					 method="post"
					    					 modelAttribute="boardVO4">
			 	<form:hidden path="bnum"/>
			 	<form:hidden path="bid"/>
				<form:hidden path="bname"/>
				<form:hidden path="btel"/>
				<form:hidden path="skill"/>
				<form:hidden path="boardCategoryVO.cid"/>
				
        		
     	<div id = "regid">
      		<div id = "regtext"><b>작성자</b></div>
      		<div id = "regcont">${boardVO4.bid }</div>
      	</div>				
		<div id = "bigbox">
			<div id = "con1">
				<a id ="statusa"href="#">${boardVO4.matchstatus }</a>
			</div>
			<div id = "con2">
				<div id = "date">
					${boardVO4.mdate }
				</div>
				<div id = "time">
					${boardVO4.stime }~${boardVO4.etime }
				</div>
				<div id = "where">
					${boardVO4.matchregion }
				</div>
			</div>
			<div id = "con3">
				<div id = "how">
				매치 방식
				</div>
				<div id = "howcont">
				${boardVO4.matchmethod }
				</div>
			</div>
			<div id = "con3">
				<div id = "how">
				매너
				</div>
				<div id = "howcont">
				${boardVO4.manner }
				</div>
			</div>
			<div id = "con4">
				<div id  = "moneyt">
				참가비
				</div>
				<div id ="moneycont">
				${boardVO4.money }
				</div>
			</div>
			<div id = "con5">
				<div id  = "con5-1">
				${boardVO4.bcontent }
				</div>
			</div>
			<div id = "con6">
				<div id  = "con6-1">
				원하는 실력
				</div>
				<div id  ="con6-2">
				${boardVO4.skill }
				</div>
			</div>
			<div id = "con7">
				<div id  = "con7-1">
				연락처
				</div>
				<div id  ="con7-2">
				${boardVO4.btel }
				</div>
			</div>	
		</div>
   		<div id = "content1">
   			<div id ="textareadiv">
   					<form:textarea class="col-3" rows="10" path="bcontent" readOnly="true"></form:textarea>
   			</div>
   			<div id = "mapdiv">
   				<div id  = "mapcon">
   					지도표시
   				</div>
   			</div>
   			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=551d147fe1ec2714aac6922bd74159ec"></script>
   			<script>
var mapContainer = document.getElementById('mapdiv'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${boardVO4.longitude},${boardVO4.latitude}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${boardVO4.longitude},${boardVO4.latitude}); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>
   		</div>
   		
   		
   		<div id = "status1" style ="margin-top:20px;" >
   			<div id = "statustitle1" class="btn umode" style="float:left; width:80px; padding:15px; border:1px solid #ccc;">매치 상태</div>
   			<div id = "statuss1" class="btn umode" style="width:130px; float:left; padding:15px; border:1px solid #ccc;">
					      <form:select class="btn umode" path="matchstatus" style="width:130px;" >
					        <option value="0">=== 선택 ===</option>
									<form:options path="matchstatus" 
																items="${matchstatus}"
																itemValue="code" 
																itemLabel="label"/>
					      </form:select></div>
   		</div>
   		<div id = "status2">
   			<div id = "statustitle2" class="btn umode" style="float:left; width:80px; padding:15px; border:1px solid #ccc;">경기 일자</div>
   			<div id = "statuss2" class="btn umode" style="float:left; width:130px;   padding:15px;   border:1px solid #ccc;">
					      <form:input type="date" style = "font-size:15px; width:130px; border:none;" cssClass="btn umode" path="mdate" placeholder="yyyy-mm-dd"/>
   			</div>
   		</div>
   		<div id = "status3" >
   			<div id = "statustitle3" class="btn umode" style="float:left;  width:80px; padding:15px; border:1px solid #ccc;">매치 방식</div>
   			<div id = "statuss3" class="btn umode" style="float:left; width:130px; padding:15px; border:1px solid #ccc;">
					      <form:select class="btn umode" path="matchmethod" style="width:130px;">
					        <option value="0">=== 선택 ===</option>
									<form:options path="matchmethod" 
																items="${matchmethod}"
																itemValue="code" 
																itemLabel="label"/>
					      </form:select></div>
   		</div>
   		<div id = "status4" style = "clear:both;" >
   			<div id = "statustitle4" class="btn umode" style = "width:80px; float:left; padding:15px; border:1px solid #ccc;">매치 장소</div>
   			<div id = "statuss4" class="btn umode" style="float:left; width:130px; padding:15px; border:1px solid #ccc;">
					  <form:input type="text" cssClass="btn umode" path="matchregion" style="width:130px;"/>     
   			</div>
   		</div>
   		<div id = "status5">
   			<div id = "statustitle5" class="btn umode" style="float:left; width:80px; padding:15px; border:1px solid #ccc;">참가비</div>
   			<div id = "statuss5" class="btn umode" style="float:left; width:130px; border:1px solid black; color:white; padding:15px; border:1px solid #ccc;">
					      <form:input type="text" style = "font-size:15px; width:130px; border:none;" cssClass="btn umode" path="money" placeholder="yyyy-mm-dd"/>
   			</div>
   		</div>
   		<div id = "status6">
   			<div id = "statustitle5" class="btn umode" style="float:left; width:80px; padding:15px; border:1px solid #ccc;">시작 시간</div>
   			<div id = "statuss5" class="btn umode" style="float:left; width:130px; border:1px solid black; color:white; padding:15px; border:1px solid #ccc;">
					      <form:input type="time" style = "font-size:15px; width:130px; border:none;" cssClass="btn umode" path="stime" placeholder="yyyy-mm-dd"/>
   			</div>
   		</div>
   		<div id = "status7">
   			<div id = "statustitle5" class="btn umode" style="float:left; width:80px; padding:15px; border:1px solid #ccc;">종료 시간</div>
   			<div id = "statuss5" class="btn umode" style="float:left; width:130px; border:1px solid black; color:white; padding:15px; border:1px solid #ccc;">
					      <form:input type="time" style = "font-size:15px; width:130px; border:none;" cssClass="btn umode" path="etime" placeholder="yyyy-mm-dd"/>
   		</div>
   		</div>
   		<div id = "status8">
   			<div id = "statustitle6" class="btn umode" style="float:left; width:80px; padding:15px; border:1px solid #ccc;">매너</div>
   			<div id = "statuss6" class="btn umode" style="float:left; width:130px; border:1px solid black; color:white; padding:15px; border:1px solid #ccc;">
					      <form:select class="btn umode" path="manner" style="width:130px;">
					        <option value="0">=== 선택 ===</option>
									<form:options path="manner" 
																items="${manner}"
																itemValue="code" 
																itemLabel="label"/>
					      </form:select></div>
   		</div>
   		<div id = "status9">
   			<div id = "statustitle7" class="btn umode" style="float:left; width:80px; padding:15px; border:1px solid #ccc;">게시판</div>
   			<div id = "statuss7" class="btn umode" style="float:left; width:130px; border:1px solid black; color:white; padding:15px; border:1px solid #ccc;">
					      <form:select class="btn umode" path="boardCategoryVO.cid" disabled="true" style="width:130px;">
					        <option value="0"></option>
									<form:options path="boardCategoryVO.cid" 
																items="${boardCategoryVO}"
																itemValue="cid"
																itemLabel="cname"/>
					      </form:select></div>
   		</div>
   	</div>
   		 

   		<div id ="comment">
				<%@ include file="rereply3.jsp"%>
			</div>
				<div id = "newcontent" class="row">
        			<div id = "modify" class="row btns">
        				
					        <!-- 작성자만 수정, 삭제 가능 -->
					       <c:if test="${sessionScope.member.id == boardVO4.bid }">
					        	<form:button class="btn rmode" id="modifyBtn" style="position:relative; right:30px;" >수정</form:button>
					        	<form:button class="btn umode" id="deleteBtn" style="position:relative; right:30px;" data-bnum ="${boardVO4.bnum }">삭제</form:button>
					       </c:if>
					        <!-- 작성자만 수정, 삭제 가능 끝 -->
					        
					        <form:button class="btn umode" id="cancelBtn" style="position:relative; right:30px;">취소</form:button>
					        <form:button class="btn umode" id="saveBtn" style="position:relative; right:30px;">저장</form:button>
        			</div>
     
        	
       </div>
      </form:form>
       </nav>
      </div>

</html>