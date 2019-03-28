var status=true;

$(document).ready(function() {
	$("#modify").click(function() { //정보수정 버튼클릭
		var query = {passwd:$("#passwd").val()};
		
		$.ajax({
			type:"post",
			url:"memberCheck.jsp", //멤버체크로 비밀번호 확인
			data:query,
			success:function(data){
				if(data==1){
					/*$("#modi_auth").load("modifyForm.jsp");*/
					window.location.href("modify2.jsp");
				} else{
					alert("비밀번호가 맞지 않습니다.");
					$("#passwd").val("");
					$("#passwd").focus();
				}
			}
		});
	});

	$("#modifyProcess").click(function() { //modifyform 페이지에 수정 버튼클릭
		checkIt();
		
		if(status){
			var query={id:$("#id").val(),
						passwd:$("#passwd").val(),
						name:$("#name").val(),
						mail:$("#mail").val(),
						birth:$("#birth").val(),
						gender:$("#gender:checked").val(),
						tel:$("#tel").val()};
			
			$.ajax({
				type:"post",
				url:"modifyPro.jsp",
				data:query,
				success:function(data){
					if(data==1){
						alert("회원정보가 수정되었습니다.");
						history.back();
					}else{
						alert(data);
					}
					
				}
			});
		}
	});
	
	$("#cancle").click(function() {  //modifyform 의 취소버튼 클릭
		history.back();
	});
	
	$("#delete").click(function() { //modifyform의 탈퇴버튼 클릭
		
		if(status) {
		var query = {id:$("#id").val(),
					passwd:$("#passwd").val()};
		var cf = confirm("정말로 탈퇴하시겠습니까?");
		if(cf){
			$.ajax({
				type:"POST",
				url:"deletePro.jsp",
				data:query,
				success:function(data){
					if(data==1){
						alert("회원 탈퇴가 되었습니다.");
						window.location.href("main.jsp");
					} else {
						alert("비밀번호를 입력하세요.");
					}
				}
			});
		}
	}
	});
});

function checkIt(){
	status = true;
	
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