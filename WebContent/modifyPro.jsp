<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie01.logon.LogonDBBean" %>

<% request.setCharacterEncoding("utf-8");%>
<%-- 7~9라인:수정된 정보를 가지고 데이터 저장빈 객체 생성 --%>
<jsp:useBean id="m_member" class="movie01.logon.LogonDataBean">
	<jsp:setProperty name="m_member" property="*"/>
</jsp:useBean>

<%
	m_member.setId(request.getParameter("id"));
	m_member.setPasswd(request.getParameter("passwd"));
	m_member.setName(request.getParameter("name"));
	m_member.setMail(request.getParameter("mail"));
	m_member.setGender(request.getParameter("gender"));
	m_member.setTel(request.getParameter("tel"));
	m_member.setBirth(request.getParameter("birth")); 

	LogonDBBean manager = LogonDBBean.getInstance();

	//회원정보 수정 처리 메소드 호출 후 수정 상황값 반환
	int check=manager.updateM_member(m_member);
	
	out.println(check);
%>