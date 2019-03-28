<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.logon.LogonDBBean" %>
<%@ page import="java.sql.*" %>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/movieBasic.css" rel="stylesheet">
<script src="js/jquery-1.11.0.min.js"></script>
<script src="idpwFind.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	request.setCharacterEncoding("utf-8");
	LogonDBBean manager = LogonDBBean.getInstance(); 
	
	String passwd = request.getParameter("passwd");

	try {
%>

	<div class="login-container">
	  <div class="login-form">
	  	<p class="inner-title">PW search</p>
	
	    <%
	      if (passwd != "") {
	    %>
		<div class="find_tbl">
			<p>고객님의 비밀번호는 <b>"<%=passwd %>"</b> 입니다.</p>
		</div>
		<input type="button" value="로그인하기" onClick="location.href='login.jsp'">
		<input type="button" value="홈으로" onClick="location.href='main.jsp'">
		<%
		 } else {
			System.out.println("db결과값X");
		%>
		<div class="find_tbl">
	       <p>입력하신 정보가 일치하지 않습니다.</p>
	    </div>
	    <input type="button" value="back" onClick="history.back()">
	      
		<%
		}}catch(Exception e) {
			e.printStackTrace();
		}
		%>
	
	  </div>
	</div>
</body>
</html> 
