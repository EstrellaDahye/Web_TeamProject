<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.qna.QnaDataBean" %>
<%@ page import="movie01.qna.QnaDBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content ="width = device-width,initial-scale=1.0"	/>
<script src ="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src = "qnaUpdate.js"></script>
<link href ="css/movieBasic.css" rel="stylesheet">

<% request.setCharacterEncoding("utf-8"); %>

<% 
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	QnaDBBean dbPro = QnaDBBean.getInstance();
	
	QnaDataBean article = dbPro.updateGetArticle(num);
%>
</head>
<body>
<div class ="inner-title">Q&A</div>
<input type="hidden" id="num" value="<%=article.getNum() %>">
<input type="hidden" id="id" value="<%=article.getId() %>">
	<!-- 테이블 -->

	<table class="table table-striped" style= "text-align :center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="2" style="background-color: #eeeeee; text-align:center;">Q&A</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan = "2">
					<input type="text" class="form-control" id = "subject" placeholder="글 제목"	name="subject" maxlength="50" value="<%=article.getSubject() %>">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<textarea class="form-control" id="content" placeholder="글 내용"	name="content" maxlength="2048" style= "height: 350px;"><%= article.getContent() %></textarea>
				</td>
			</tr>
		</tbody>
	</table>	
	<button id="update" value="<%=pageNum %>"class="btn btn-primary">수정</button>
	<button id="cancle" value="<%=pageNum %>" class="btn btn-primary">취소</button>
			
</body>	
</html>
	