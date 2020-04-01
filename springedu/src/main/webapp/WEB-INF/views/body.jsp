<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
   
   <head>
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
		var statusa = document.getElementsByClassName("statusa");
		console.log(statusa);
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
	        document.getElementById('dialogboxhead').innerHTML = "인사말 보기";
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
                                <li><a href="<c:url value='/board/list/NOTICE'/>">공지사항</a></li>
                      				 <li><a href="<c:url value='/board/list/RESULT'/>">경기결과</a></li>
                      				 <li><a href="<c:url value='/board/list/BLACKLIST'/>">블랙리스트</a></li>
                                
                                
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="middlemenu1">
                <input type="radio" id="tab01" name="tabmenu" checked>
                <label for="tab01">매치 현황</label>
                <input type="radio" id="tab02" name="tabmenu">
                <label for="tab02">용병 현황</label>	

                <div class="conbox con1">
                 <c:forEach var = "rec" items="${list3 }">
                    <div id="con1wrapper1">
                        <div id="con1-1"><a class = "statusa" href="${pageContext.request.contextPath}/board4/view/${rec.bnum }">${rec.matchstatus }</a></div>
                        <div id="con1-2">
                            <p class="month">${rec.mdate }</p>
                            <p class="time">${rec.stime } ~ ${rec.etime }</p>
                            <p class="where">${rec.matchregion }</p>
                        </div>
                        <div id="con1-3">
                            <p class="match">매치 방식</p>
                            <p class="number">${rec.matchmethod }</p>
                        </div>
                        <div id="con1-4">
                            <p class="money">참 가 비</p>
                            <p class="moneyprice">${rec.money }</p>
                        </div>
                        <div id="con1-5">
                            <p class="comment">${rec.bcontent }
                            </p>
                        </div>
                        <div id="con1-6">
                            <p class="rank">실력</p>
                            <p class="rank2">${rec.skill }</p>
                        </div>
                        <div id="con1-7">
                            <p class="manner">매너</p>
                            <p class="manner2">${rec.manner }</p>
                        </div>
                    </div>
                    </c:forEach>
                </div>
                <div class="conbox con2">
                		 <c:forEach var = "rec" items="${list2 }">
                    <div id="con2wrapper1">
                        <div id="con2-1"><a target ="_blank" href = "${pageContext.request.contextPath}/board3/view/${rec.bnum }"
    		onClick="window.open(this.href, '', 'width=500, height=230');">
    		<c:if test = "${!empty rec.fname }">
    			<img src="${pageContext.request.contextPath }/member/file/${rec.bid}"></a>
    		</c:if>
    		<c:if test = "${empty rec.fname }">
    			<img src = "<c:url value='/resources/img/익명.png'/>"></a>
    		</c:if>
    		</div>
                        <div id="con2-2">
                            <p class="playername">${rec.bname }</p>
                            <p class="possible">가능 지역 : ${rec.region }</p>
                            <p class="skill">실력 : ${rec.skill }</p>
                            <p class="skill2">매너 : ${rec.manner }</p>
                            <p class="phonenumber">하고싶은말 : 
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
                    </div>
                    </c:forEach>
                   
                </div>
            </div>
            <div id="middlemenu2">
                <div id="title">
                    <p>회원 모집</p>
                </div>
                <div id="banner"></div>

            </div>
            <div id="middlemenu3">
                <div id="title">
                    <p>금일 성사된 매치</p>
                </div>
                <div id=menu3box1>
                    <div id="menu3con1">
                        <div id="imglogo"><img src="<c:url value='/resources/img/범호축구단.png'/>"></div>
                        <div id="teamname"><a href="#">범호 축구단</a></div>
                        <div id="winlose"><a href="#">0승 0무 0패</a></div>
                    </div>
                    <div id="menu3con2">
                        <div id="vs"><a href="#">vs</a></div>
                    </div>
                    <div id="menu3con3">
                        <div id="imglogo2"><img src="<c:url value='/resources/img/맹호축구단.png'/>"></div>
                        <div id="teamname"><a href="#">맹호 축구단</a></div>
                        <div id="winlose"><a href="#">0승 0무 0패</a></div>
                    </div>
                </div>
                <div id=menu3box2>
                    <div id="box2con1">
                        <p>장소 : 울산 야음동 홈플러스</p>
                    </div>
                    <div id="box2con1">
                        <p>날짜 : 2019년 12월 25일</p>
                    </div>
                    <div id="box2con1">
                        <p>시간 : 오후 18시 50분</p>
                    </div>


                </div>
            </div>
            <div id="middlemenu4">
                <div id="title">
                    <p>경기 결과</p>
                </div>
                <div id="contentwrap4">
                    <c:forEach var = "rec" items="${RESULT }">
                        <ul type="circle" class="matchresult">
                            <div class="list_wrap">
                                <li> 		
                                	
			                         <a href="${pageContext.request.contextPath}/board/view/${rec.boardCategoryVO.cname }/${rec.bnum }">
			                          <div id = "freecontent">
			                          <c:forEach begin="1" end="${rec.bindent }">&nbsp;&nbsp;</c:forEach>
																<c:if test="${rec.bindent > 0 }">
																<i class="fas fa-reply" style = "position:relative;">&nbsp;&nbsp;</i>															
																</c:if>
			                          <span style ="color:red; padding-right:15px;">경기 결과</span><span style ="padding-right:10px; color:#8181F7;"><i class="fas fa-futbol"></i></span>${rec.btitle }                              
			                          </div><span id="result_date" ><fmt:formatDate value="${rec.bcdate }" pattern="yyyy-MM-dd"/></span></a></li>
                            </div>
                        </ul>
                    </c:forEach>
                </div>
            </div>
            <div id="middlemenu5">
            		
                <!-- <div id="title">
                    <p>풋살 대회</p>
                </div>
                <div id="banner2"></div> -->
            </div>
             <div id="middlemenu6">
                <div id="title">
                    <p>풋살 동영상</p>
                </div>
                <div id="videowrap">					
                    <div id="video1">
                     <iframe class="imgvideo" width="253px" height="210px" src="https://www.youtube.com/embed/YEsltTBmkss" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                    <div id="video1">
										 <iframe class="imgvideo" width="253px" height="210px" src="https://www.youtube.com/embed/0ZCfceDeq4g" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>                    </div>
                    <div id="video1">
                    	<iframe class="imgvideo" width="253px" height="210px" src="https://www.youtube.com/embed/ggL3uDpaioI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                    <div id="video1">
                    	<iframe class="imgvideo" width="253px" height="210px" src="https://www.youtube.com/embed/Su8rTK50qnk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen ></iframe>
                   <!--  <video controls src = "" poster = "https://img.youtube.com/vi/3MrDPHMx3yg/0.jpg" width="253px" height="210px" id="imgvideo1">
                    </video> --></div>
               
                    <div id="videotitle"><span>▶ 풋살 고급 기술</span></div>
                    <div id="videotitle"><span>▶ 풋살 기본기</span></div>
                    <div id="videotitle"><span>▶ 풋살 고급 전술</span></div>
                    <div id="videotitle"><span>▶ 풋살 하이라이트</span></div>
                </div>
            </div> 
            <div id="middlemenu7">
                <div id="title">
                    <p>공지사항</p>
                </div>
                <div id="contentwrap4">
                <c:forEach var = "rec" items="${NOTICE }">
                     <c:if test = "${rec.boardCategoryVO.cid == 1001}">
                    <ul type="circle" class="matchresult">
                        <div class="list_wrap">
                                <li> 		
                                	
			                           <a href="${pageContext.request.contextPath}/board/view/${rec.boardCategoryVO.cname }/${rec.bnum }">
			                          <div id = "freecontent">
			                          <c:forEach begin="1" end="${rec.bindent }">&nbsp;&nbsp;</c:forEach>
																<c:if test="${rec.bindent > 0 }">
																<i class="fas fa-reply" style = "position:relative;">&nbsp;&nbsp;</i>															
																</c:if>
			                       
			                       <span style="padding-right:10px;"><i class="fas fa-bullhorn" style="color:red;"></i></span>${rec.btitle }                              
			                          </div><span id="result_date" ><fmt:formatDate value="${rec.bcdate }" pattern="yyyy-MM-dd"/></span></a></li>
                            </div>
                    </ul>
                   </c:if>
                    </c:forEach> 
                </div>
             </div>
                <div id="middlemenu8">
                    <div id="title">
                        <p>블랙리스트</p>
                    </div>
                    <div id="contentwrap4">
                 
                   <c:forEach var = "rec" items="${BLACK }">
							
                        <ul type="circle" class="matchresult">
                            <div class="list_wrap">
                                <li> 		
                                		
			                           <a href="${pageContext.request.contextPath}/board/view/${rec.boardCategoryVO.cname }/${rec.bnum }">
			                          <div id = "freecontent">
			                          <c:forEach begin="1" end="${rec.bindent }">&nbsp;&nbsp;</c:forEach>
																<c:if test="${rec.bindent > 0 }">
																<i class="fas fa-reply" style = "position:relative;">&nbsp;&nbsp;</i>															
																</c:if>
			                          ${rec.btitle }                              
			                          </div><span id="result_date" ><fmt:formatDate value="${rec.bcdate }" pattern="yyyy-MM-dd"/></span></a></li>
                            </div>
                        </ul>
                  
                    </c:forEach>
                    
                    </div>                                  
                </div>
        </nav>
    </div>
    <%-- <div id="visualwrap">
        <div class="visual">
            <div id="visual1"><img src="<c:url value='/resources/img/크리스마스4.png'/>"></div>
            <div id="visual2"><img src="<c:url value='/resources/img/하단배너.png'/>"></div>
            <div id="visual3"><img src="<c:url value='/resources/img/하단배너2.png'/>"></div>
            <div id="visual4"><img src="<c:url value='/resources/img/하단배너3.png'/>"></div>
        </div>
    </div> --%>
    <script>
        $('.visual').slick();
    </script>
