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
	
	String id = request.getParameter("id");
	
	try {
%>

	<div class="login-container">
	  <div class="login-form">
	  	<p class="inner-title">ID search</p>
	
	    <%
		if(id!=""){
	    %>
		<div class="find_tbl">
			<p>고객님의 아이디는 <b>"<%=id %>"</b> 입니다.</p>
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

 
<%-- <% 
	request.setCharacterEncoding("utf-8");
	LogonDBBean manager = LogonDBBean.getInstance();
	
	String mail = request.getParameter("mail");
	String tel = request.getParameter("tel");
	
	String id = manager.id_search(mail, tel);
	
	System.out.println("db결과값 ========> " + id);

	try {
%>

	<div class="login-container">
	  <div class="login-form">
	  	<p class="inner-title">id search</p>
	
	    <%
	      if (id != null) {
	    %>
		<table>
			<tr><td>아이디 찾기 성공</td></tr>
			<tr><td><%=id%></td></tr>
		</table>
		<%
		 } else {
		%>
	    <table>
	       <tr><td>아이디 찾기를 실패</td></tr>
	       <tr>
	       <td><input type="button" value="돌아가기" onClick="history.back()"></td>
	       </tr>
		</table> 
	      
		<%
		}}catch(Exception e) {
			e.printStackTrace();
		}
		%>
	
	  </div>
	</div> --%>

</body>
</html> 
