<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<link rel="stylesheet" href="<c:url value ='/resources/css/list7.css'/>">

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
           <div id ="entirewrap">
           	
      			<input type="radio" id="tab01" name="tabmenu" checked>
                <label for="tab01" id = "tab01label">울산 구장</label>
             
            	 <input type="radio" id="tab02" name="tabmenu">
                <label for="tab02" id = "tab01label2">부산 구장</label>
		 
		    
		    	<div class="conbox con1">
					<div class = "con1-header">
						<div id = "headercon1">
							<div id = "con1s">
							<img src = "<c:url value='/resources/img/필그린.jpg'/>">
							</div>
							<div id = "con1ss">
								<p id ="p1">울산 남구 야음동 필그린</p>
								<ul style="list-style-type: circle;">
									<li class = "li1">전화번호 <span>010-8933-8310</span></li>
									<li class = "li2">이용가능요일<span>일주일 내내 24시간</span></li>
									<li class = "li3"><a href= "http://www.fieldgreen.kr/bbs/content.php?co_id=price" target="_blank">구장이용료 확인하기</a></li>
								</ul>
							</div>
						</div>
						<div id = "headercon2">
							<div id="map"></div>
							<div id="mapinfo">
								<span id ="spann1">
									주소
								</span>
								<p id = "pp1">도로명<br> <span> 울산광역시 남구화합로 81(야음동)</span></p>
								<p id = "pp2">지번주소 <br><span style="color:#585858;"> 울산광역시 남구 야음동 1-2번지</span></p>
							</div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=551d147fe1ec2714aac6922bd74159ec"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.5322911, 129.3386791), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(35.5322911, 129.3386791); 

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
					</div>
					<div class = "con1-header">
						<div id = "headercon1">
							<div id = "con1s">
							<img src = "<c:url value='/resources/img/HM.jpg'/>">
							</div>
							<div id = "con1ss">
								<p id ="p1">울산 북구 신답로 HM풋살파크</p>
								<ul style="list-style-type: circle;">
									<li class = "li1">전화번호 <span>010-2477-1380</span></li>
									<li class = "li2">이용가능요일<span>일주일 내내 24시간</span></li>
									<li class = "li3"><a href= "http://hmfutsalpark.com/?NaPm=ct%3Dk7czro6o%7Cci%3D0z00002YjzXsPX9r5fpu%7Ctr%3Dsa%7Chk%3D37f1b7e5135367f70ce394ea3ac2e96b9f0a2bce" target="_blank">구장이용료 확인하기</a></li>
								</ul>
							</div>
						</div>
						<div id = "headercon2">
							<div id="map2"></div>
							<div id="mapinfo">
								<span id ="spann1">
									주소
								</span>
								<p id = "pp1">도로명<br> <span> 울산광역시 북구 성안동 신답로</span></p>
								<p id = "pp2">지번주소 <br><span style="color:#585858;"> 상안동 322-9 (우) 44209</span></p>
							</div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=551d147fe1ec2714aac6922bd74159ec"></script>
<script>
var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.6301898, 129.3427353), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(35.6301898, 129.3427353); 

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
					</div>
					<div class = "con1-header">
						<div id = "headercon1">
							<div id = "con1s">
							<img src = "<c:url value='/resources/img/삼산풋살.jpg'/>">
							</div>
							<div id = "con1ss">
								<p id ="p1">울산 남구  삼산풋살경기장</p>
								<ul style="list-style-type: circle;">
									<li class = "li1">전화번호 <span>052-226-0962</span></li>
									<li class = "li2">이용가능요일<span>평일 및 주말  06~22</span></li>
									<li class = "li3"><a href= "http://crs.uncmc.or.kr/sports_facilities/facility_view.jsp?mem_id=B0000001&item_id=T0000237" target="_blank">구장이용료 확인하기</a></li>
								</ul>
							</div>
						</div>
						<div id = "headercon2">
							<div id="map3"></div>
							<div id="mapinfo">
								<span id ="spann1">
									주소
								</span>
								<p id = "pp1">도로명<br> <span> 울산광역시 남구 돋질로 (삼산동)</span></p>
								<p id = "pp2">지번주소 <br><span style="color:#585858;"> 울산광역시 남구 삼산동 삼산고등학교 옆</span></p>
							</div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=551d147fe1ec2714aac6922bd74159ec"></script>
<script>
var mapContainer = document.getElementById('map3'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.5452107, 129.3388623), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(35.5452107, 129.3388623); 

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
					</div>
					<div class = "con1-header">
						<div id = "headercon1">
							<div id = "con1s">
							<img src = "<c:url value='/resources/img/야음동.jpg'/>">
							</div>
							<div id = "con1ss">
								<p id ="p1">울산 야음동 홈플러스 풋살장</p>
								<ul style="list-style-type: circle;">
									<li class = "li1">전화번호 <span>010-8933-8310</span></li>
									<li class = "li2">이용가능요일<span>일주일 내내 24시간</span></li>
									<li class = "li3"><a href= "http://hmfutsalpark.com/?NaPm=ct%3Dk7czro6o%7Cci%3D0z00002YjzXsPX9r5fpu%7Ctr%3Dsa%7Chk%3D37f1b7e5135367f70ce394ea3ac2e96b9f0a2bce" target="_blank">구장이용료 확인하기</a></li>
								</ul>
							</div>
						</div>
						<div id = "headercon2">
							<div id="map4"></div>
							<div id="mapinfo">
								<span id ="spann1">
									주소
								</span>
								<p id = "pp1">도로명<br> <span> 울산 남구 수암로 148 홈플러스 5층</span></p>
								<p id = "pp2">지번주소 <br><span style="color:#585858;"> 야음동 789-91 (우) 44750</span></p>
							</div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=551d147fe1ec2714aac6922bd74159ec"></script>
<script>
var mapContainer = document.getElementById('map4'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.526407, 129.3205033), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(35.526407, 129.3205033); 

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
					</div>
					
            	</div>
            	
                  
           		<div class="conbox con2">		
     				<div class = "con1-header">
						<div id = "headercon1">
							<div id = "con1s">
							<img src = "<c:url value='/resources/img/정관.jpg'/>">
							</div>
							<div id = "con1ss">
								<p id ="p1">부산 정관 실내풋살장</p>
								<ul style="list-style-type: circle;">
									<li class = "li1">전화번호 <span>010-8933-8310</span></li>
									<li class = "li2">이용가능요일<span>일주일 내내 24시간</span></li>
									<li class = "li3"><a href= "https://sapofutsal.modoo.at/?link=3zd8fmzr" target="_blank">구장이용료 확인하기</a></li>
								</ul>
							</div>
						</div>
						<div id = "headercon2">
							<div id="map6"></div>
							<div id="mapinfo">
								<span id ="spann1">
									주소
								</span>
								<p id = "pp1">도로명<br> <span> 부산광역시 기장군 정관읍 매학리 751-2</span></p>
								<p id = "pp2">지번주소 <br><span style="color:#585858;"> 부산 정관읍 구연3로 17</span></p>
							</div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=551d147fe1ec2714aac6922bd74159ec"></script>
<script>
var mapContainer = document.getElementById('map6'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.3222537, 129.1793524), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(35.3222537, 129.1793524); 

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
					</div>
					<div class = "con1-header">
						<div id = "headercon1">
							<div id = "con1s">
							<img src = "<c:url value='/resources/img/연제.jpg'/>">
							</div>
							<div id = "con1ss">
								<p id ="p1">부산 연제 풋살장</p>
								<ul style="list-style-type: circle;">
									<li class = "li1">전화번호 <span>010-7543-6526</span></li>
									<li class = "li2">이용가능요일<span>일주일 내내 24시간</span></li>
									<li class = "li3"><a href= "https://yjfutsal.modoo.at/" target="_blank">구장이용료 확인하기</a></li>
								</ul>
							</div>
						</div>
						<div id = "headercon2">
							<div id="map7"></div>
							<div id="mapinfo">
								<span id ="spann1">
									주소
								</span>
								<p id = "pp1">도로명<br> <span> 부산 연제구 연안로 19</span></p>
								<p id = "pp2">지번주소 <br><span style="color:#585858;">연산동 420-8 (우) 47567</span></p>
							</div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=551d147fe1ec2714aac6922bd74159ec"></script>
<script>
var mapContainer = document.getElementById('map7'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.189471, 129.1046106), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(35.189471, 129.1046106); 

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
					</div>
					<div class = "con1-header">
						<div id = "headercon1">
							<div id = "con1s">
							<img src = "<c:url value='/resources/img/해운대.jpg'/>">
							</div>
							<div id = "con1ss">
								<p id ="p1">부산 플레이짐 풋살 센터</p>
								<ul style="list-style-type: circle;">
									<li class = "li1">전화번호 <span>051-743-3360</span></li>
									<li class = "li2">이용가능요일<span>매일 06:00~02:00</span></li>
									<li class = "li3"><a href= "http://www.fieldgreen.kr/bbs/content.php?co_id=price" target="_blank">구장이용료 확인하기</a></li>
								</ul>
							</div>
						</div>
						<div id = "headercon2">
							<div id="map8"></div>
							<div id="mapinfo">
								<span id ="spann1">
									주소
								</span>
								<p id = "pp1">도로명<br> <span> 부산 해운대구 좌동순환로249번길 </span></p>
								<p id = "pp2">지번주소 <br><span style="color:#585858;"> 부산 해운대구 좌동 1431 9층</span></p>
							</div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=551d147fe1ec2714aac6922bd74159ec"></script>
<script>
var mapContainer = document.getElementById('map8'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.5322911, 129.3386791), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(35.5322911, 129.3386791); 

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
					</div>
					<div class = "con1-header">
						<div id = "headercon1">
							<div id = "con1s">
							<img src = "<c:url value='/resources/img/부산HM.jpg'/>">
							</div>
							<div id = "con1ss">
								<p id ="p1">부산 HM풋살파크 가야점</p>
								<ul style="list-style-type: circle;">
									<li class = "li1">전화번호 <span>010-3682-9992</span></li>
									<li class = "li2">이용가능요일<span>10:00~24:00</span></li>
									<li class = "li3"><a href= "http://hmfutsalpark.com/rese/rese_form.asp?branch_code=HM0007&NaPm=ct%3Dk7d0cf3k%7Cci%3D0yS00026kzXslaNx%2Dvlr%7Ctr%3Dsa%7Chk%3Da1cad14aedd36a6216116b4e794d323298ca789e" target="_blank">구장이용료 확인하기</a></li>
								</ul>
							</div>
						</div>
						<div id = "headercon2">
							<div id="map9"></div>
							<div id="mapinfo">
								<span id ="spann1">
									주소
								</span>
								<p id = "pp1">도로명<br> <span> 부산 부산진구 가야대로 506</span></p>
								<p id = "pp2">지번주소 <br><span style="color:#585858;"> 부산 부산진구 가야동 624-7 7층</span></p>
							</div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=551d147fe1ec2714aac6922bd74159ec"></script>
<script>
var mapContainer = document.getElementById('map9'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.1199145, 128.7850586), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(35.1199145, 128.7850586); 

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
					</div>               
            	</div>
           </div> 
       </nav>
      </div>
