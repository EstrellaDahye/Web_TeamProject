<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "movie01.logon.LogonDBBean"%>  

<% request.setCharacterEncoding("utf-8");%>
<%
	String id=(String)session.getAttribute("id");
	String passwd=request.getParameter("passwd");
	
	LogonDBBean manager = LogonDBBean.getInstance();
	int check=manager.userCheck(id,passwd);
	
	out.println(check);
	%>