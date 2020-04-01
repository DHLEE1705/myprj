window.addEventListener("load", init, false);
function init() {
    
    var deleteBtn = window.document.getElementById("deleteBtn");
    
    console.log(deleteBtn);
    deleteBtn.addEventListener("click", function (e) {
        e.preventDefault();
        var result = checkLogin();
        if(result){
        	var msg = confirm('정말로 삭제하시겠습니까? 되돌릴수없습니다.!!');
        	if (msg == true){
        	document.getElementById("DeleteForm").submit();
        	
        	}
        	else {
        		alert("취소되었습니다.");
        	}
        }
        
    }, false);
}
function checkLogin() {
    var pwTag = document.getElementById("pw");
    var pwValue = pwTag.value;
    var flag = true;

    if (pwValue.trim().length == 0) {
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
    

}