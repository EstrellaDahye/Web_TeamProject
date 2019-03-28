var status = true;

$(document).ready(function(){

	
	$("#checkId").click(function(){
		if($("#id").val()){
			
			var query={id:$("#id").val()};
			
			$.ajax({
				type:"post",
				url:"confirmId.jsp",
				data:query,
				success:function(data){
					if(data==1){
						alert("사용 할 수 없는 아이디 입니다.");
						$("#id").val("");
					}else if(data == -1)
						alert("사용 할 수 있는 아이디입니다.");
					}
				});
		}else{
			alert("사용 할 아이디를 입력해 주십시오.");
			$("#id").focus();
		}
	});
	
	
	
	
	$("#process").click(function(){
		checkIt();
		
		if(status){
			var query = {id:$("#id").val(),
						passwd:$("#passwd").val(),
						name:$("#name").val(),
						mail:$("#mail").val(),
						birth:$("#birth").val(),
						gender:$("#gender:checked").val(),
						tel:$("#tel").val(),
						agreecheck:$("#agreecheck").val()};
			$.ajax({
				type : "post",
				url:"registerPro.jsp",
				data:query,
				success:function(data){
					alert("회원가입을 축하합니다!");
					history.back();
				}
			});
		}
	});
	
	
	$("#cancle").click(function(){
		history.back();
	});
	
});


function checkIt(){
	status = true;
	
	if(!$("#id").val()){
		alert("아이디를 입력하세요");
		$("#id").focus();
		status = false;
		return false;
	}
	
	if(!$("#passwd").val()){
		alert("비밀번호를 입력하세요");
		$("#passwd").focus();
		status=false;
		return false;
	}
		
	if($("#passwd").val() != $("#repass").val()){
		alert("비밀번호를 동일하게 입력하세요");
		$("#repass").focus();
		status = false;
		return false;
	}
	
	if(!$("#name").val()){
		alert("사용자 이름을 입력하세요");
		$("#name").focus();
		status = false;
		return false;
	}
	
	if(!$("#mail").val()){
		alert("메일 주소를 정확하게 입력하세요");
		$("#mail").focus();
		status = false;
		return false;
	}
	
	if(!$("#birth").val()){
		alert("생년월일을 정확하게 입력하세요");
		$("#birth").focus();
		status = false;
		return false;
	}
	
	if(!$(":input:radio[name=gender]:checked").val()){
		alert("성별을 입력해주세요");
		$("#gender").focus();
		status = false;
		return false;
	}
	if(!$("#tel").val()){
		alert("전화번호를 정확하게 입력하세요");
		$("#tel").focus();
		status = false;
		return false;
	}
	if(!$('input:checkbox[id="agreecheck"]').is(":checked")){
		alert("개인정보 이용에 동의 해 주십시오");
		status = false;
		return false;
	}
}


/*var status = true;

$(document).ready(function(){

	
	$("#checkId").click(function(){
		if($("#id").val()){
			
			var query={id:$("#id").val()};
			
			$.ajax({
				type:"post",
				url:"confirmId.jsp",
				data:query,
				success:function(data){
					if(data==1){
						alert("사용 할 수 없는 아이디 입니다.");
						$("#id").val("");
					}else if(data == -1)
						alert("사용 할 수 있는 아이디입니다.");
					}
				});
		}else{
			alert("사용 할 아이디를 입력해 주십시오.");
			$("#id").focus();
		}
	});
	
	
	
	
	$("#process").click(function(){
		checkIt();
		
		if(status){
			var query = {id:$("#id").val(),
						passwd:$("#passwd").val(),
						name:$("#name").val(),
						mail:$("#mail").val(),
						birth:$("#birth").val(),
						gender:$("#gender").val(),
						tel:$("#tel").val(),
						agreecheck:$("#agreecheck").val()};
			$.ajax({
				type : "post",
				url:"registerPro.jsp",
				data:query,
				success:function(data){
					alert("회원가입을 축하합니다!");
					window.location.href("main.jsp");
				}
			});
		}
	});
	
	
	$("#cancle").click(function(){
		
		window.location.href("main.jsp");
	});
	
});


function checkIt(){
	status = true;
	
	if(!$("#id").val()){
		alert("아이디를 입력하세요");
		$("#id").focus();
		status = false;
		return false;
	}
	
	if(!$("#passwd").val()){
		alert("비밀번호를 입력하세요");
		$("#passwd").focus();
		status=false;
		return false;
	}
		
	if($("#passwd").val() != $("#repass").val()){
		alert("비밀번호를 동일하게 입력하세요");
		$("#repass").focus();
		status = false;
		return false;
	}
	
	if(!$("#name").val()){
		alert("사용자 이름을 입력하세요");
		$("#name").focus();
		status = false;
		return false;
	}
	
	if(!$("#mail").val()){
		alert("메일 주소를 정확하게 입력하세요");
		$("#mail").focus();
		status = false;
		return false;
	}
	
	if(!$("#birth").val()){
		alert("생년월일을 정확하게 입력하세요");
		$("#birth").focus();
		status = false;
		return false;
	}
	
	if(!$(":input:radio[name=gender]:checked").val()){
		alert("성별을 입력해주세요");
		$("#gender").focus();
		status = false;
		return false;
	}
	if(!$("#tel").val()){
		alert("전화번호를 정확하게 입력하세요");
		$("#tel").focus();
		status = false;
		return false;
	}
	if(!$('input:checkbox[id="agreecheck"]').is(":checked")){
		alert("개인정보 이용에 동의 해 주십시오");
		status = false;
		return false;
	}
}
*/