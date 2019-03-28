<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import= "movie01.logon.LogonDBBean" %>

<% request.setCharacterEncoding("utf-8"); %>

<%	
try{
	String id=(String)session.getAttribute("id");
	
	LogonDBBean manager = LogonDBBean.getInstance();
	//회원탈퇴 처리 메소드 수행 후 탈퇴 상황값 반환
	int check = manager.deleteM_member(id);
	
	out.print(check);
	
	if(check==1)
		session.invalidate();

}catch(Exception e){
	e.printStackTrace();
}
%>