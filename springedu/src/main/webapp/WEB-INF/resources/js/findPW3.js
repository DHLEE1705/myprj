window.addEventListener("load",init,false);

function init(){
	findIDBtn.addEventListener("click", function(e){
		var result = checkFindID();
		
		if(result){
			var xhttp = new XMLHttprequest();
			
			xhttp.addEventListener("readystatechange",ajaxCall,false);
			
			function ajaxCall(){
				console.log("ajaxCall");
				if(this.readyState == 4 && this.status == 200){
					var jsonObj = JSON.parse(this.responseText);
					if(jsonObj.error == null ){
						document.getElementById("id").value = jsonObj.id;
						docuemnt.getElementById("birthMsg").innerHTML = "";    
					}
					else{
						document.getElementById("id").value = "";
						docuemnt.getElementById("birthMsg").innerHTML = jsonObj.error;
					}
					
					
					
				}
			}
		}
		
		
	},false);
	
}