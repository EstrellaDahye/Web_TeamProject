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
	  	<p class="inner-title">FIND PW</p>
				<!-- 입력박스 -->
				<input type="text" id="id" name="id" placeholder="Please enter your id"/>
				<input type="text" id="birth" name="birth" placeholder="Please enter your birthday"/>
				
				<input type="submit" value="찾기" id="forgotpw"/>
				<input type="button" value="취소" onclick="history.back()"/>
	  </div>
	</div>
</body>
</html> 
