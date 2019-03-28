var wStatus=true;

$(document).ready(function(){
	
	$("#regist").click(function(){
		formCheckIt();
		
		if(wStatus){
			var pageNum=$("#regist").val();
			//글쓰기 폼에 입력된 값을 얻어내서 query에 저장
			var query = {subject:$("#subject").val(),
					content:$("#content").val(),
					ref:$("#ref").val(),
					re_step:$("#re_step").val(),
					re_level:$("#re_level").val(),
					num:$("#num").val()
			};
			$.ajax({
				type:"POST",
				url:"qnaWritePro.jsp",
				data:query,
				success:function(data){
					if(data==1){
						alert("글이 등록되었습니다.");
						var query = "qnaList.jsp?pageNum="+pageNum;
						window.location.href("qna.jsp");
					}
				}
			});
		}
	});
	
	$("#cancle").click(function(){
		var pageNum = $("#cancle").val();
		var query="qnaList.jsp?pageNum="+pageNum;
			$(".qna_body").load(query);
	});
});

function formCheckIt(){
	wStatus = true;
	
	if(!$.trim($("#subject").val())){
		alert("제목을 입력하세요.");
		$("#subject").focus();
		wStatus = false;
		return false;
	}
	
	if(!$.trim($("#content").val())){
		alert("내용을 입력하세요.");
		$("#content").focus();
		wStatus = false;
		return false;
	}
	
}