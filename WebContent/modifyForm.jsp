<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="movie01.logon.LogonDataBean" %>
<%@ page import="movie01.logon.LogonDBBean" %>
<%@ page import="java.sql.*" %>

<meta name ="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="css/movieBasic.css"/>
<script src="js/jquery-1.11.0.min.js"></script>
<script src="modify.js"></script>

<% request.setCharacterEncoding("utf-8");

	String id=(String)session.getAttribute("id");
	String name ="";
	String mail ="";
	String birth ="";
	String gender = "";
	String tel="";

	LogonDBBean manager = LogonDBBean.getInstance();
	LogonDataBean m = manager.getM_member(id);
	
	if( m != null){
		name = m.getName();
		mail = m.getMail();
		birth = m.getBirth();
		gender = m.getGender();
		tel = m.getTel();
	}else {
		System.out.println("db 결과값 없음");
	}
	
	try{
	%>
	
<div class="modify-container">
	<div class="modify-form">
		<p class="inner-title">MODIFY MEMBER INFORMATION</p>
			<table class="modify-table">
		          <tr>
		            <td>아이디</td>
		            <td><input type="text" name="id" id = "id" value="<%=id %>" readonly disabled/>
		          </tr>
		          <tr>
		            <td>비밀번호</td>
		            <td><input type="password" name="passwd" id="passwd" size ="40" maxlength="16" placeholder="6~16자 이상의 영문자, 숫자, 특수문자 이용"/>
		          </tr>
		          <tr>
		            <td>비밀번호 확인</td>
		            <td><input type="password" name="repass" id="repass" size ="40" maxlength="16" placeholder="비밀번호를 다시 입력해주세요."/>
		          </tr>
		          <tr>
		            <td>이름</td>
		            <td><input id="name" name="name" type="text" size="20" maxlength="10" value="<%= name %>">
		          </tr>
		          <tr>
		            <td>Email</td>
		            <td><input id="mail" name="mail" type="text" size="40" maxlength="50" value="<%= mail %>" />
		          </tr>
		          <tr>
		            <td>생년월일</td>
		            <td><input id="birth" name="birth" type="text"  size="40" maxlength="20" value="<%= birth %>" />
		          </tr>
		          <tr>
		            <td>성별</td>
		             <% if(gender.equals("M")){ //gender값이 M인경우 %>
		            <td colspan="2" id ="insert"> 남
		              <input type="radio" name="gender" id="gender" value="M" checked="checked" />
						여
					  <input type="radio" name="gender" id="gender" value="F" /></td>
					    <% }else if(gender.equals("F")){ //gender값이 F인 경우 %>
		            <td colspan="2" id ="insert"> 남
		              <input type="radio" name="gender" id="gender" value="M" />
						여
					  <input type="radio" name="gender" id="gender" value="F" checked="checked" /></td>
					  <% } %>
		          </tr>
		          <tr>
		            <td>전화번호</td>
		            <td><input type="text" name="tel" id="tel" size ="40" maxlength="16" value="<%=tel %>"/>
		            	<br/>※8자리 숫자로 입력하세요
		            </td>
			</table>
			
			<p><input type="checkbox" name="agreecheck" id="agreecheck" />상기 개인정보 이용에 동의합니다.</p>
			<p><b>※회원탈퇴 할 경우 모든 회원정보는 복구 할 수 없습니다.</b></p>
			
			<input type="submit" name="modifyInput" id="modifyProcess" value="정보수정">
		   	<input type="submit" name="modifyInput" id="delete" value="회원탈퇴" >
		    <input type="submit" name="modifyInput" id="cancle" value="취소">
   </div>
</div>
	<%} catch(Exception e){e.printStackTrace();} %>
