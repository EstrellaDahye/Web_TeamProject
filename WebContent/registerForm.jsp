<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<meta name ="viewport" content="width=device-width,initial-scale=1.0"/>
<link href="css/movieBasic.css" rel="stylesheet">
<link rel="stylesheet" href="css/movieBasic.css"/>
<script src="js/jquery-1.11.0.min.js"></script>
<script src="register.js"></script>
<%@ page import="java.sql.*" %>

 <!-- 중간 내용 삽입구 -->
  
<div class="join-container">
	<div class="join-form">
		<p class="inner-title">JOIN</p>
			<table class="join-table">
	          <tr>
	            <td>아이디</td>
	            <td class="join-checkId">
	            	<input type="text" name="id" id="id" size="40" maxlength="50" autofocus required/>
	            	<input type="submit" name="registerInput" id="checkId" value="ID중복확인">
	            </td>                   
	          </tr>
	          <tr>
	            <td>비밀번호</td>
	            <td>
	              <input type="password" name="passwd" id="passwd" size ="40" maxlength="16" placeholder="6~16자 이상의 영문자, 숫자, 특수문자 이용"/>
	             </td>
	          </tr>
	          <tr>
	            <td>비밀번호확인</td>
	            <td>
	              <input type="password" name="repass" id="repass" size ="40" maxlength="16"/>
	            </td>
	          </tr>
	          <tr>
	            <td>이름</td>
	            <td><input type="text" name="name" id="name" size ="40" maxlength="10" /></td>
	          </tr>
	          <tr>
	            <td>E-mail</td>
	            <td>
	              <input type="text" name="mail" id="mail" size="40" maxlength="20" placeholder="letsmovie@movie.com" />
	            </td>
	          </tr>
	          <tr>
	            <td>생년월일</td>
	            <td>
	            	<input type="text" name="birth" id="birth" size="40" maxlength="8" placeholder="생년월일만 입력하세요. ex)910101" />
	            </td>
	          </tr>
	          <tr>
	            <td>성별</td>
	            <td> 
					남<input type="radio" name="gender" id="gender" value="M" />
					여<input type="radio" name="gender" id="gender" value="F" /></td>
	          </tr>
	          <tr>
	            <td>전화번호</td>
	            <td><p>
	              <input type="text" id="tel" size ="40" maxlength="16"placeholder="01011112222"/>
	            </td>
	          </tr>
			</table>
			<p><input type="checkbox" id="agreecheck" />상기 개인정보 이용에 동의합니다.</p>
	       	<input type="submit" name="registerInput" id="process" value="가입하기">
			<input type="submit" name="registerInput" id="cancle" value="취소">
    </div>
  </div>

</body>
</html>

