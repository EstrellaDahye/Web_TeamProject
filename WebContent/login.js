var status = true;

$(document).ready(function(){
	
	//[회원가입]버튼을 클릭하면 자동실행		
	$("#register").click(function(){//[회원가입]버튼 클릭
		//회원가입폼 registerForm.jsp 페이지를 
		//id 속성값이 main_auth인 영역에 로드
		$("#main_auth").load("registerForm.jsp");
	});
	
	//[로그인]버튼을 클릭하면 자동실행	
	//입력한 아이디와 비밀번호를 갖고 loginPro.jsp 페이지 실행
	$("#login").click(function(){
		checkIt();//입력폼에 입력한 상황 체크
		if(status){
		  //입력된 사용자의 아이디와 비밀번호를 얻어냄
		  var query = {id : $("#id").val(), 
				       passwd:$("#passwd").val()};
		  
		  $.ajax({
		     type: "post",
		     url: "loginPro.jsp",
		     data: query,
		     success: function(data){
		    	 if(data == 1)//로그인 성공
		    		 window.location.href("main.jsp");
		    	 else if(data == 0){//비밀번호 틀림
		    	  	 alert("비밀번호가 맞지 않습니다.");
		    	  	 $("#passwd").val("");
		    	  	 $("#passwd").focus();
		    	 }else if(data == -1){//아이디 틀림
		    		 alert("아이디가 맞지 않습니다.");
		    		 $("#id").val("");
		    		 $("#passwd").val("");
		    	  	 $("#id").focus();
		    	 }
		     }
		  });
		}
	});
	
	
	//인증된 사용자 영역을 처리하는 버튼들
	//[회원 정보 변경]버튼을 클릭하면 자동실행
	$("#update").click(function(){//[회원정보수정]버튼 클릭
		//회원정보를 수정 및 회원 탈퇴를 위한 modify.jsp 페이지 요청
		$("#main_auth").load("modify.jsp");
	});
	
	//로그아웃 부분 logout.jsp로 직접 링크 하여 script 태그로 처리함.
	
 });

//인증되지 않은 사용자 영역에서 사용하는 입력 폼의 입력값 유무 확인
function checkIt(){
	status = true;
	if(!$.trim($("#id").val())){
		alert("아이디를 입력하세요.");
		$("#id").focus();
		status = false;
		return false;
	}
	
	if(!$.trim($("#passwd").val())){
		alert("비밀번호를 입력하세요.");
		$("#passwd").focus();
		status = false;
		return false;
	}
}

//mypage 클릭시 이벤트
function mpcheckIt() {	// id == null
		alert("본 서비스는 로그인 후 이용 가능합니다.");
		window.location.href("login.jsp");
}

function mpok() {	// id != null
	window.location.href("mypage.jsp");
}
