<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "movie01.logon.LogonDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<meta name ="viewport" content="width=device-width,initial-scale=1.0"/>
<!-- 스타일시트 -->
<script src = "../../js/jquery-1.11.0.min.js"></script>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="m_member" class="movie01.logon.LogonDataBean">
	<jsp:setProperty name="m_member" property="*"/>
</jsp:useBean>

<%
	m_member.setReg_date(new Timestamp(System.currentTimeMillis()));

	LogonDBBean manager=LogonDBBean.getInstance();
	
	manager.insertM_member(m_member);
	String gender = request.getParameter("gender");
	System.out.println(gender);
	%>
		