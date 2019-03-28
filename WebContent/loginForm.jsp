<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/movieBasic.css" rel="stylesheet">
<script src="js/jquery-1.11.0.min.js"></script>
<script src="login.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="login-container">
  <div class="login-form">
  	<p class="inner-title">LOG-IN</p>
	   
		    <% 
			String id ="";
			
			try{
				//id세션 속성의 값을 얻어내서 id변수에 저장
				//인증된 사용자의 경우  id세션 속성의 값 null또는 공백이 아님
				id = (String)session.getAttribute("id");
			%>
			<input name="id" type="text" id="id" placeholder="userid"/>
			<input name="password" type="password" id="passwd" placeholder="password"/>
			<input type="submit" name="login" id="login" title="로그인" alt="로그인" value="로그인" class="login" >
			<input type="button" value="ID/PW 찾기" id="find-btn" onclick="location.href='idpw_Find.jsp'">
			<input type="button" value="회원가입" id="join-btn" onclick="location.href='register.jsp'">
	    
  </div>
</div>

<%}catch(Exception e){e.printStackTrace();}%>


</body>
</html> 
