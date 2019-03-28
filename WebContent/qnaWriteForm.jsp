<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.net.URLDecoder" %>

    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width", initial-scale="1.0">
<script src = "http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src ="qnaWrite.js"></script>
<link href="css/movieBasic.css" rel="stylesheet">
<script src="js/bootstrap.js"></script>


<% request.setCharacterEncoding("utf-8");
   response.setContentType("text/html;charset=UTF-8");
%>
<title>영화는 영화, 보러갈래? - Javamovie</title>
<%
	//제목글의 경우 갖는 값
	int num = 0, ref = 1, re_step = 0, re_level=0, pageNum=1;
	String id=(String)session.getAttribute("id");
	String subject = null;
	
 // 댓글의 경우 갖는 값
	if(request.getParameter("num")!=null){
		num=Integer.parseInt(request.getParameter("num"));
		ref = Integer.parseInt(request.getParameter("ref"));
		re_step = Integer.parseInt(request.getParameter("re_step"));
		re_level = Integer.parseInt(request.getParameter("re_level")); 
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
		subject = URLDecoder.decode(request.getParameter("subject"),"UTF-8");
	}
%>

</head>
<body>

<div class="qna_container">
<div class="qna_form">
<p class ="inner-title">Q&A</p>

	<input type="hidden" id ="id" value="<%= id %>">
	<input type="hidden" id ="num" value ="<%= num %>">
	<input type="hidden" id ="ref" value ="<%= ref %>">
	<input type="hidden" id ="re_step" value ="<%= re_step %>">
	<input type="hidden" id ="re_level" value ="<%= re_level %>">
	
	<table class="table table-striped" style= "text-align :center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="2" style="background-color: #eeeeee; text-align: center;">Q&A</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
				<% if(request.getParameter("num")!=null){%>
			<input type="text" class="form-control" id = "subject" placeholder="re:<%=subject %>"name="subject" 
					value="re:<%=subject %>" maxlength="50" size="50">
				<% }else{ %>
					<input type="text" class="form-control" id = "subject" placeholder="글 제목"	name="subject" maxlength="50" size="50">
				<%	} %>	
						</td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" id ="content"
							name="Content" maxlength="2048" style= "height: 350px;"></textarea></td>
						</td>
					</tr>
				</tbody>
			</table>	
			<button id ="regist" value="<%= pageNum %>" class="btn btn-primary">등록</button>
			<button id ="cancle" value="<%= pageNum %>" class="btn btn-primary">취소</button>
	</div>
</div>
</body>
</html>
