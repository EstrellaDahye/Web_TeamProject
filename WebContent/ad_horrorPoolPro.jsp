<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.directory.DirDataBean" %>
<%@ page import="movie01.directory.DirDBBean_Ho" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<script src="js/jquery-1.11.0.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
	
	<%	
		String id = request.getParameter("movieid");
		int movieID = Integer.parseInt(id);
		DirDBBean_Ho manager=DirDBBean_Ho.getInstance();
		int result=manager.movieDeleteHo(movieID);
		
	%>
	<script>
		location.href="ad_horrorPool.jsp";
	</script>
</body>
</html>