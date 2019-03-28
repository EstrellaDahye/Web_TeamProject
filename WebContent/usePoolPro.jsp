<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.logon.LogonDataBean" %>
<%@ page import="movie01.logon.LogonDBBean" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<script src="js/jquery-1.11.0.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>Insert title here</title>
</head>
<body>
	
	
	<%
		String id = request.getParameter("id");
		LogonDBBean manager=LogonDBBean.getInstance();
		int result=manager.deleteByManager(id);
	%>
	<script>
		location.href="usePool.jsp";
	</script>
</body>
</html>