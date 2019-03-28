<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.logon.LogonDataBean" %>
<%@ page import="movie01.logon.LogonDBBean" %>
<%@ page import="java.sql.*" %>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/movieBasic.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="idpwFind.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="login-container">
	  <div class="login-form">
	  	<p class="inner-title">FIND ID</p>
				<!-- 입력박스 -->		
				<input type="text" id="mail" name="mail" placeholder="Please enter your email">
				<input type="text" id="tel" name="tel" placeholder="Please enter your phone number">
			
				<input type="submit" value="찾기" id="forgotid"/>
				<input type="button" value="취소" onclick="history.back()"/>
	  </div>
	</div>
</body>
</html> 
