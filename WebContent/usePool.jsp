<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="movie01.logon.LogonDataBean" %>
<%@ page import="movie01.logon.LogonDBBean" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<link href="css/movieBasic.css" rel="stylesheet">
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/usePool.css" rel="stylesheet" />
	<script src="js/jquery-1.11.0.min.js"></script>
	<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
	<title>Insert title here</title>
	<style>
		html {
			overflow-y:scroll;
		}
	</style>
	<script>
   		function idDelete(delID){
   			var cf = confirm("이 회원을 정말로 삭제하시겠습니까? \n (삭제된 데이터는 복구 할 수 없습니다.)");
   				if(cf){
	   			location.href="usePoolPro.jsp?id="+delID;}
   		}
   	</script>	
</head>

<body>
	<div id="wrap">
	<div id="inner-wrap">
	<div><jsp:include page="main_header.jsp" /></div>
	<div class="inner-content">
	<div class="table-area">
	<p class="inner-title">Member Management</p>
	<%	
	String id="";
	try{
		id=(String)session.getAttribute("id");
	%>
	<%
	if(id!=null && id.equals("admin")){
	%>
		<table>
		<tr>
	   		<th> 아이디
	   		<th> 비밀번호
	   		<th> 이름
	   		<th> e-mail
	   		<th> 생년월일
	   		<th> 성별
	   		<th> 전화번호
	   		<th> 가입일자
	   		<th> 관리
	   	</tr>
   		<%
   			LogonDBBean manager = LogonDBBean.getInstance();
   			ArrayList<LogonDataBean> list=manager.getMemberList();
   			for(LogonDataBean dtb:list){
   		%>
   		<tr>
   			<td><%= dtb.getId() %>
   			<td><%= dtb.getPasswd() %>
   			<td><%= dtb.getName() %>
   			<td><%= dtb.getMail() %>
   			<td><%= dtb.getBirth() %>
   			<td><%= dtb.getGender() %>
   			<td><%= dtb.getTel() %>
   			<td><%= dtb.getReg_date() %>
   			<td>
   		<%if((dtb.getId()).equals("admin")){ %>
   			<div class="textbox">관리자</div>
   		<%}else{ %>	
   			<input type="button" class="del_btn" value="삭제" onclick="idDelete('<%=dtb.getId()%>');">
   		<%} %>	
   		</tr>
   		<% }%>
   	</table>
   	<%}else {%>
   	<img class="inner_text" src="images/clapper.png">
	<div class="inner_text">관리자만 접근할 수 있는 페이지 입니다.</div>  	
 	</div>
 	</div>
 	<%}}catch(Exception e){e.printStackTrace();} %>
	<div><jsp:include page="main_footer.jsp" /></div>
	</div>
	</div>  
	

</body>
</html>