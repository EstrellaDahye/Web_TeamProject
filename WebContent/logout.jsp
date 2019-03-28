<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
  session.invalidate();//ì¸ìë¬´í¨í
%>
	<script>
	alert("로그아웃 되었습니다.");
	</script>
	<script> 
	location.href='main.jsp';
	
	</script>