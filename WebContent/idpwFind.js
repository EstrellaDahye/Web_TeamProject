var status = true;

$(document).ready(function() {

	$("#forgotid").click(function(){
		idcheckIt();
		
		if(status){
			var query = {mail:$("#mail").val(),
						tel:$("#tel").val()};
			$.ajax({
				type : "post",
				url:"id_find_Pro.jsp",
				data:query,
				success:function(data){
					if(data!="") { 
						window.location.href("id_search.jsp?id="+data);
					}
				}
				
			});
		}
	});
	
	$("#forgotpw").click(function() {
		pwcheckIt();
		
		if(status){
			var query = {id:$("#id").val(),
						birth:$("#birth").val()};
			$.ajax({
				type : "post",
				url:"pw_find_Pro.jsp",
				data:query,
				success:function(data){
					if(data!="") { 
						window.location.href("pw_search.jsp?passwd="+data);
					}
				}
				
			});
		}
	});

});


function idcheckIt(){
	status = true;

	if(!$("#mail").val()){
		alert("이메일을 입력하세요");
		$("#mail").focus();
		status=false;
		return false;
	}
	
	if(!$("#tel").val()){
		alert("휴대폰번호를 입력하세요");
		$("#tel").focus();
		status=false;
		return false;
	}

}

function pwcheckIt(){
	status = true;

	if(!$("#id").val()){
		alert("아이디를 입력하세요");
		$("#id").focus();
		status=false;
		return false;
	}
	
	if(!$("#birth").val()){
		alert("생년월일을 입력하세요");
		$("#birth").focus();
		status=false;
		return false;
	}

}

function cancle() {
	alert("메인 화면으로 돌아갑니다.");
	window.location.href("main.jsp");
}


/*function findcheck() {
if(!document.frm.mail.value) {
	alert("이메일을 입력하세요.");
	document.frm.mail.focus();
	return false;
}
if(!document.frm.tel.value) {
	alert("휴대폰번호를 입력하세요.");
	document.frm.tel.focus();
	return false;
}
}

function cancle() {
window.location.href("main.jsp");
}*/