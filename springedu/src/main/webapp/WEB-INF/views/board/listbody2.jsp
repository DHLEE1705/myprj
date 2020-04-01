<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
<link rel="stylesheet" href="<c:url value ='/resources/css/list2.css'/>">
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<script src="<c:url value='/resources/js/common.js'/>"></script>
<script>

window.addEventListener("load",init,false);

function init(){
    var search2 = document.getElementById('search2');
    var map_wrap = document.getElementById('map_wrap');

     search2.addEventListener("click",function(e){
        console.log('클릭됨');
        //버킷항목 입력값 읽어오기
            map_wrap.style.visibility = "visible";
   },false);

     regBtn.addEventListener("click", function(e){
 		e.preventDefault();
 		console.log('클릭됨reg');
 		if(checkValid()){
		      document.getElementById("boardVO4").submit(); 
		  }
 		},false);  

     mapBtn.addEventListener("click", function(e){
   		e.preventDefault();
   		console.log('클릭됨mapBtn');
   		//유효성 체크
   		//게시글 작성 전송
   		searchPlaces(); return false; 
   		},false); 
}

function checkValid(){
	 var mdateEle = document.getElementById('mdate');
	 var stimeEle = document.getElementById('stime');
	 var etimeEle = document.getElementById('etime');
	 var flag = true; /* 회원가입 유효성 체크 유무 */

	 if(!ismdate(mdateEle.value)) {
		 mdate_errmsg.innerHTML = "경기일자를 입력하세요";
	       flag = flag && false;
	   }

	 else{
		 mdate_errmsg.innerHTML = "";
  }

	 if(!isstime(stimeEle.value)) {
		 stime_errmsg.innerHTML = "시작시간을  입력해주세요";
	       flag = flag && false;
	   }

	 else{
		 stime_errmsg.innerHTML = "";
  }

	 if(!isetime(etimeEle.value)) {
		 etime_errmsg.innerHTML = "종료시간을 입력해주세요";
	       flag = flag && false;
	   }

	 else{
		 etime_errmsg.innerHTML = "";
  }

		 return flag;

		 if(flag){
		    	document.getElementById("boardVO4").submit();
		    	alert('작성이 완료되었습니다.');
		 }   
}

//경기일자 정규식
function ismdate(asValue){
	var regExp = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
	return regExp.test(asValue);
}
function isstime(asValue){
	var regExp = /^([01][0-9]|2[0-3]):([0-5][0-9])$/;
	return regExp.test(asValue);
}
function isetime(asValue){
	var regExp = /^([01][0-9]|2[0-3]):([0-5][0-9])$/;
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
                             <li><a href="<c:url value='/board/list/NOTICE'/>">공지사항</a></li>
                      <li><a href="<c:url value='/board/list/RESULT'/>">경기결과</a></li>
                      <li><a href="<c:url value='/board/list/BLACKLIST'/>">블랙리스트</a></li>
                            
                            
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
      <span id = "topfont">매치 등록</span>
     <form:form action = "${pageContext.request.contextPath }/board4/write" 
   				enctype = "multipart/form-data"
        		method = "post" 
        		modelAttribute="boardVO4">
        		<form:hidden path="bid"/>
   				<form:hidden path="bname"/>
   				<form:hidden path="btel"/>
   				<form:hidden path="matchstatus"/>
      <div id = "writeboard"> 
      	<div id = "categorytitle">
      		<div id = "selecttitle" class = "selecttitle">
      		 경기 장소
      		</div> 
      		<div id = "selecttitle2" class = "selecttitle">
      		매치 방식
      		</div>
      		<div  id = "selecttitle3" class = "selecttitle">
      		원하는 실력
      		</div>
      		<div  id = "selecttitle4" class = "selecttitle">
      		매너
      		</div>
      	</div>
      	<div class ="categoryselect">
    		 <div class = "selectcont" id = "selectcontdiv">
    			<form:input type = "text" path = "matchregion" cssClass = "selectc"/>
             	<form:errors path="matchregion" cssClass="error"></form:errors>
    		</div>
    		<div class = "selectcont" id = "selectcontdiv2">
    			<form:select path="matchmethod" cssClass = "selectc">
                                    <option value="0">== 선 택 ==</option>
                                    <form:options path="matchmethod" items="${matchmethod }" itemValue="code" itemLabel="label"/>
                                </form:select>
                                 <form:errors path="matchmethod" cssClass="error2"></form:errors> 
    		</div>
    		<div class = "selectcont" id = "selectcontdiv3">
    			<form:select path="skill" cssClass = "selectc">
                                    <option value="0">== 선 택 ==</option>
                                    <form:options path="skill" items="${skill }" itemValue="code" itemLabel="label"/>
                                </form:select>
                                <form:errors path="skill" cssClass="error3"></form:errors>
    		</div>
    		<div class = "selectcont" id = "selectcontdiv4">
    			<form:select path="manner" cssClass = "selectc">
                                    <option value="0">== 선 택 ==</option>
                                    <form:options path="manner" items="${manner }" itemValue="code" itemLabel="label"/>
                                </form:select>
                                <form:errors path="manner" cssClass="error4"></form:errors>
    		</div>
      	</div>
      	<div id = "categorytitle">
      		<div id = "selecttitle5" class = "selecttitle">
      		경기 일자
      		</div>
      		<div id = "selecttitle6" class = "selecttitle">
      		경기 시작 시간
      		</div>
      		<div id = "selecttitle7" class = "selecttitle">
      		경기 종료 시간
      		</div>
      		<div id = "selecttitle8" class = "selecttitle" style = "color:#F5F5F5;">
      		게시판
      		</div>
      	</div>
      	<div class = "selectcont" id = "selectcontdiv5">
      		<form:input type="date" cssClass="dateselect" path="mdate" placeholder="yyyy-mm-dd"/>
      		<span class="error5" id="mdate_errmsg"></span>
      	</div>
      	<div class = "selectcont" id = "selectcontdiv6">
      		<form:input type="time" cssClass="dateselect" path="stime" />
      		<span class="error5" id="stime_errmsg"></span>
      	</div>
      	<div class = "selectcont" id = "selectcontdiv7">
      		<form:input type="time" cssClass="dateselect" path="etime" />
      		<span class="error5" id="etime_errmsg"></span>
      	</div>
      	<div class = "selectcont" id = "selectcontdiv8" style = "background-color:transparent;">
      		
      	</div>
      	
      	<div id = "categorytitle2" id = "selecttitle8">
      		<div class = "titleca">
      			경기장
      		</div>
      		<div id = "searchcan">				
      		<form:input type ="text"  readonly = "true" cssClass = "mapregion" path ="mapregion" style = "width:100%; height:100%; font-size:14px;"/>
      		</div><button id = "search2" type ="button" style = "height:55px;">검색</button>
      		<form:input type = "text" cssClass = "latitude"  path = "latitude" style = "display:none;"/>
      		<form:input type = "text" cssClass = "longitude" path = "longitude" style ="display:none;"/>
      		
      	</div>
      	
      	<div id = "mapdiv">
      		<div class="map_wrap" id = "map_wrap" style="visibility:hidden;">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                
                    키워드 : <input type="text" value="" id="keyword" size="15"> 
                    <button id = "mapBtn" type="submit">검색하기</button> 
                
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=551d147fe1ec2714aac6922bd74159ec&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        /* alert('키워드를 입력해주세요!'); */
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        console.log("x = " + JSON.stringify(data[0].x));
		console.log("y = " + JSON.stringify(data[0].y));
		console.log("mapregion = " + JSON.stringify(data[0].place_name));
		
		var latitude = document.getElementById('latitude');
		var longitude = document.getElementById('longitude');
		var mapregion = document.getElementById('mapregion');
		
		var x = JSON.stringify(data[0].x);
		var y = JSON.stringify(data[0].y);
		var place_name = JSON.stringify(data[0].place_name);
	
		mapregion.value = place_name.replace(/\"/g, "");
		latitude.value = x.replace(/\"/g, "");
		longitude.value = y.replace(/\"/g, "");
		
        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
      	</div> 	
      	<div class = "selecttitle" id = "selecttitle9">
      			참가비
      	</div>
      	<div class = "selectcont" id = "selectcontdiv9">
      		<form:input type = "text" path = "money"/>
      	</div>
      	<form:errors path="money" cssClass="error6"></form:errors>

      	<div id = "contentinput">
      		<div id = "toptitle">
      			<span id ="conspan">내용</span>
      		</div>
      		<div id = "textareacon">
      			<form:textarea id ="cont" path = "bcontent"></form:textarea>
      		</div>
      	</div>
      	<form:errors path="bcontent" cssClass="error7"></form:errors>
      	<div id = "bottom">
      		<input type = "reset" value="취소" id = "cancelBtn">
      		<form:button class="btn" id="regBtn">작성 완료</form:button>
      	</div>
	  </div>	
	
	  </form:form>
       </nav>
      </div>

</html>