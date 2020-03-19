window.addEventListener("load",init,false); // true 이면 Capturing  ,false 이면 Bubling 방식으로 이벤트가 전달된다.

//버블링 방식은 이벤트가 맨아래 자식부터 부모까지 차례대로 진행된다.
//캡처링은 그 반대이다
function init(){
  joinBtn.addEventListener("click",function(e){
    e.preventDefault(); //브라우저의 다른 행동을 막기위해 
    checkValid();
   document.getElementById("memberjoinForm").submit();
  },false);

}

function checkValid(){
  // alert('호출됨');
  // 사용자 입력값 읽어오기
  var idEle = document.getElementById('id');
  var pwEle = document.getElementById('pw');
  var pwChkEle = document.getElementById('pwChk');
  var telEle = document.getElementById('tel');
  var regionEle = document.getElementById('region');
  var genderEle = document.getElementsByName('gender');
  var nameEle = document.getElementById('name');
  var birthEle = document.getElementById('birth');

  var flag = true; /* 회원가입 유효성 체크 유무 */


  //1) 이메일 주소 체크
    if(!isEmail(idEle.value)) {
      id_errmsg.innerHTML = "이메일 정보가 잘못되었습니다.";
      flag = flag && false;
    }else{
      id_errmsg.innerHTML = "";
    }
  //2) 비밀번호 체크
    if(!isPassword(pwEle.value)) {
      pw_errmsg.innerHTML = "비밀번호가 잘못되었습니다.(6~15)자리 영문,숫자 특수문자 포함";
      flag = flag && false;    
    }else{
      pw_errmsg.innerHTML = "";
    }
  //3) 비밀번호 재확인
    //3-1)비밀번호 패턴 체크
    if(!isPassword(pwChkEle.value)) {
      pwChk_errmsg.innerHTML = "비밀번호가 잘못되었습니다.(6~15)자리 특수문자, 영문, 숫자 조합";
      flag = flag && false;
    }else{
      pwChk_errmsg.innerHTML = "";
    }
    //3-2)비밀번호 일치 체크
    if(pwEle.value != pwChkEle.value ) {
      pwChk_errmsg.innerHTML = "비밀번호가 일치하지 않습니다.";
      flag = flag && false;
    }else {
      pwChk_errmsg.innerHTML = "";
    }
  //4) 전화번호
    if(!isTel(telEle.value)) {
      tel_errmsg.innerHTML = "전화번호가 잘못되었습니다. -포함해서 입력하세요";
      flag = flag && false;
    }else{
      tel_errmsg.innerHTML = "";
    }    
  //5) 지역
    if(regionEle.selectedIndex == 0){
      region_errmsg.innerHTML = "지역을 선택해주세요!";
      flag = flag && false;
    }else{
      region_errmsg.innerHTML = "";
    }
  //6) 성별
    var status = false;
    for(var gender of genderEle) {
      if(gender.checked) {
        status = true;
        break;
      }
    }
    if(!status) {
      gender_errmsg.innerHTML = "성별을 선택해주세요!";
      flag = flag && false;
    }else{
      gender_errmsg.innerHTML = "";
    }

    //7)이름
    if(!isName(nameEle.value)) {
        name_errmsg.innerHTML = "이름은 2~4글자 입니다";
        flag = flag && false;
      }else{
        name_errmsg.innerHTML = "";
      }
    
    if(!isBirth(birthEle.value)) {
    	birth_errmsg.innerHTML = "생년월일이 올바르지 않습니다.";
       flag = flag && false;
   }
   
   else{
   	birth_errmsg.innerHTML = "";
   }
    
//    if(birthEle.value ==""){
//    	birth_errmsg.innerHTML = "생년월일이 올바르지 않습니다."
//    }
    
    

  //8) 유효성 통과하면 메인화면으로 이동
      
//   return flag;
    
    if(flag){
    	document.getElementById("memberjoinForm").submit();
    	alert('가입이 완료되었습니다. 로그인해주세요!!');
   }

    
}
// 이메일 체크 정규식
function isEmail(asValue) {
  var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴	
}

// 핸드폰 번호 체크 정규식
function isTel(asValue) {
  var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

//비밀번호 체크 정규식
function isPassword(asValue) {
    
  var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,15}$/; //  6 ~ 15자 특수문자, 영문, 숫자 조합
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

//이름 정규식
function isName(asValue){
    var reg = /^[가-힣]{2,4}$/;
    return reg.test(asValue);// 한글 이름 2~4자 이내
}

function isBirth(asValue){
	var regExp = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
	return regExp.test(asValue);
}



