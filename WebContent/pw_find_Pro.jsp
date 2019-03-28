<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "movie01.logon.LogonDataBean" %>
<%@ page import = "movie01.logon.LogonDBBean" %>
<% request.setCharacterEncoding("utf-8");%>

<%
	LogonDBBean manager = LogonDBBean.getInstance();

	String id = request.getParameter("id");
	String birth = request.getParameter("birth");
	
	String passwd = manager.pw_search(id, birth);

	out.println(passwd);

%>