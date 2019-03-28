var wStatus = true;

$(document).ready(function(){
	
	//수정 버튼을 클릭 할 경우
	$("#update").click(function(){
		formCheckIt();
		if(wStatus){
			var pageNum=$("#update").val();
			var query={num:$("#num").val(),
					id:$("#id").val(),
					subject:$("#subject").val(),
					content:$("#content").val(),
					num:$("#num").val()};
	// query값으로 qnaUpdatePro.jsp 실행
			$.ajax({
				type:"POST",
				url:"qnaUpdatePro.jsp",
				data:query,
				success: function(data){
					if(data ==1){
						alert("글이 수정되었습니다.");
						window.location.href("qna.jsp");
					}else{
						alter("글 수정 실패.");
					}
				}
			});
			}
		});
	
	// 취소버튼을 누르면 qnalist.jsp로 이동
	$("#cancle").click(function(){
		var pageNum = $("#cancle").val();
		var query = "qnaList.jsp?pageNum="+pageNum;
		$(".qna_body").load(query);
	});
	
});

function formCheckIt(){
	wStatus = true;
	if(!$.trim($("#subject").val())){
		alert("제목을 입력하세요.");
		$("#subject").focus();
		wStatus=false;
		return false;
	}
	
	if(!$.trim($("#content").val())){
		alert("내용을 입력하세요");
		$("#content").focus();
		wStatus = false;
		return false;
	}
}
