window.addEventListener("load", init, false);
        function init() {
            var idTag = document.getElementById("member_id");
            var pwTag = document.getElementById("member_password");
            var loginBtn2 = document.getElementById("loginBtn2");
            
            console.log(loginBtn2);
            loginBtn2.addEventListener("click", function (e) {
                e.preventDefault();
                var result = checkLogin();
                if(result){
                	document.getElementById("loginForm").submit();
                }
                
            }, false);
        }
        function checkLogin() {
            var idTag = document.getElementById("member_id");
            var idValue = idTag.value;
            var pwTag = document.getElementById("member_password");
            var pwValue = pwTag.value;
            var flag = true;
            var logout = document.getElementById("log");
            var mypage = document.getElementById("jo");
            var afterlogin = document.getElementById("headerlogin");
            
//            const ID = 'admin@naver.com';
//            const PW = '*qwer1234';

            if (idValue.trim().length == 0) {
                alert('아이디를 입력하세요!');
                flag = false;
                return flag;
            }

            if (pwValue.trim().length == 0) {
                alert('비밀번호를 입력하세요!');
                flag = false;
                return flag;
            }
            return flag;
//            console.log(idValue.trim(), pwValue.trim());
//            //2) 회원 존재유무체크
//            if (idValue.trim() == ID && pwValue.trim() == PW) {
//                alert('로그인 되었습니다.');
//                //메인 페이지로 이동
//                logout.innerHTML = "로그아웃";
//                mypage.innerHTML = "마이페이지";
//                afterlogin.style.color = "#FA5858";
//                afterlogin.style.backgroundColor = "transparent ";
//                afterlogin.style.fontWeight = "bold";
//                afterlogin.style.fontSize = "23px";
//                afterlogin.style.textAlign = "center";
//                afterlogin.style.lineHeight = "100px";
//                afterlogin.innerHTML = ID + "님 환영합니다."
//            }
//            else {
//                alert('가입하지 않은 아이디이거나, 잘못된 비밀번호 입니다.');
//                // pwMsg.innerHTML = "가입하지 않은 아이디이거나, 잘못된 비밀번호 입니다.";
//                // pwMsg.style.color = "red";
//                // pwMsg.style.fontSize = '0.7rem';
//                // pwMsg.style.fontWeight = 'bold';
//                // pwMsg.focus();
//                return;
//            }
        }