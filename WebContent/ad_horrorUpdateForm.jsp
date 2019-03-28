<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="movie01.directory.DirDataBean" %>
<%@ page import="movie01.directory.DirDBBean_Ho" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/movieBasic.css">
<link rel="stylesheet" href="css/bootstrap.css">
<title>영화는 영화, 보러갈래? - Javamovie</title>
</head>
<body>
	<div id="inner-wrap">
	<div><jsp:include page="main_header.jsp" /></div>
	<div class="inner-content">
	<% 
		String id = null;
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}
			int movieID = 0;
			
			if(!id.equals("admin")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다.')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
			if (request.getParameter("movieid") != null) {
				movieID = Integer.parseInt(request.getParameter("movieid"));
			}
			if(movieID == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href='ad_horrorPool.jsp'");
				script.println("</script>");
			}
			DirDataBean article = new DirDBBean_Ho().getmovieHo(movieID);
	%>
	<p class="inner-title">Movie Management</p>
	<div class="inner-body">
			<form method="post" action="ad_horrorUpdateAction.jsp?movieID=<%=movieID%>">
			<table class="table table-striped" style= "text-align :center; 
					border: 1px solid #dddddd">
			<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; 
							text-align: center;">UpdateMovie-Horror</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="3"><input type="text" class="form-control" placeholder="영화 제목"
							name="title" maxlength="50" value="<%= article.getTitle()%>"></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" placeholder="감독"
							name="director" maxlength="50" value="<%= article.getDirector()%>"></td>
						<td><input type="text" class="form-control" placeholder="배우"
							name="actor" maxlength="50" value="<%= article.getActor()%>"></td>
						<td colspan="3"><input type="text" class="form-control" placeholder="포스터 파일명"
							name="poster" maxlength="50" value="<%= article.getPoster()%>"></td>
					</tr>
					<tr>
						<td colspan="3"><textarea class="form-control" placeholder="줄거리"
							name="story" maxlength="2048" style="height: 350px;"><%= article.getStory() %></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="수정하기">
			</form>
	</div>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<div><jsp:include page="main_footer.jsp"/></div>
</body>
</html>