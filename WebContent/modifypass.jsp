<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="css/movieBasic.css"/>
<script src="js/jquery-1.11.0.min.js"></script>
<script src="modify.js"></script>


<div class="modipass-container">
 	<div class="modipass-form">
	  	<p class="inner-title">MEMBER CHECK</p>
			<% 
				String id ="";
				try{
					//id세션 속성의 값을 얻어내서 id변수에 저장
					//인증된 사용자의 경우  id세션 속성의 값 null또는 공백이 아님
					id = (String)session.getAttribute("id");
					
			%>
			
		<!-- PW -->
		<input name="passwd" type="password" id="passwd" size="30"
	    placeholder="password">
	    <p style="padding:10px">정보보호를 위해 한번 더 비밀번호를 입력 해 주세요.</p>
	</div>
	<!-- login -->
    <input type="submit" name="modifyInput" id="modify" value="정보 수정" >
</div>

<%}catch(Exception e){
	e.printStackTrace();}%>
 
