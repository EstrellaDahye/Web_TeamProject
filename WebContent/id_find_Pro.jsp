<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "movie01.logon.LogonDataBean" %>
<%@ page import = "movie01.logon.LogonDBBean" %>
<% request.setCharacterEncoding("utf-8");%>

<%
	LogonDBBean manager = LogonDBBean.getInstance();

	String mail = request.getParameter("mail");
	String tel = request.getParameter("tel");
	
	String id = manager.id_search(mail, tel);

	out.println(id);

%>