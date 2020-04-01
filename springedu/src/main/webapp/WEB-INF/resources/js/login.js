window.addEventListener("load", init, false);
function init() {
    var idTag = document.getElementById("id");
    var pwTag = document.getElementById("pw");
    var loginBtn = window.document.getElementById("loginBtn");
    
    console.log(loginBtn);
    loginBtn.addEventListener("click", function (e) {
        e.preventDefault();
        var result = checkLogin();
        if(result){
        	document.getElementById("loginForm").submit();
        }
        
    }, false);
}
function checkLogin() {
    var idTag = document.getElementById("id");
    var idValue = idTag.value;
    var pwTag = document.getElementById("pw");
    var pwValue = pwTag.value;
    var flag = true;
    var logout = document.getElementById("log");
    var mypage = document.getElementById("jo");
    var afterlogin = document.getElementById("headerlogin");
//    const ID = 'admin@naver.com';
//    const PW = '*qwer1234';
    //로그인 유효성 체크
    //1) 아이디, 비밀번호 빈문자열 체크
    if (idValue.trim().length == 0) {
        //   alert('아이디를 입력하세요!');
        document.getElementById("idMsg");
        idMsg.innerHTML = "아이디를 입력하세요!";
        idMsg.style.color = "red";
        idMsg.style.fontSize = '0.7rem';
        idTag.focus();
        flag = false;
        return flag;
    }

    if (pwValue.trim().length == 0) {
        //   alert('아이디를 입력하세요!');
        idMsg.innerHTML = "";
        document.getElementById("pwMsg");
        pwMsg.innerHTML = "비밀번호를 입력하세요!";
        pwMsg.style.color = "red";
        pwMsg.style.fontSize = '0.7rem';
        pwMsg.style.fontWeight = 'bold';
        pwMsg.focus();
        flag = false;
        return flag;
    }
    return flag;
//    console.log(idValue.trim(), pwValue.trim());
//    //2) 회원 존재유무체크
//    if (idValue.trim() == ID && pwValue.trim() == PW) {
//        alert('로그인 되었습니다.')
//        //메인 페이지로 이동
//        document.location.href = "afterloginmain.html";
//    }
//    else {
//        pwMsg.innerHTML = "가입하지 않은 아이디이거나, 잘못된 비밀번호 입니다.";
//        pwMsg.style.color = "red";
//        pwMsg.style.fontSize = '0.7rem';
//        pwMsg.style.fontWeight = 'bold';
//        pwMsg.focus();
//        return;
//    }

}