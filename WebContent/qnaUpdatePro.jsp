<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "movie01.qna.QnaDBBean" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="article" scope = "page" class ="movie01.qna.QnaDataBean">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>

<%
	QnaDBBean dbPro = QnaDBBean.getInstance();
	int check = dbPro.updateArticle(article);
	out.println(check);
%>