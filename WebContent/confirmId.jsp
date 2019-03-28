<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import ="movie01.logon.LogonDBBean" %>

<% request.setCharacterEncoding("utf-8");%>

<% 
	//입력받은 아이디를 가지고 옴
	String id = request.getParameter("id");
	
	//DBBean의 객체를 얻어 옴. 
	LogonDBBean manager = LogonDBBean.getInstance();
	
	
	//DBBean에서 체크
	int check = manager.confirmId(id);
	//체크값 리턴
	out.println(check);
%>