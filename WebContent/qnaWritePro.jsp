<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.qna.QnaDBBean" %>
<%@ page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("utf-8"); %>

<%-- 글쓰기 폼에 입력한 값을 갖고 QnaDataBean 클래스 객체 article을 생성 --%>
<jsp:useBean id="article" scope="page" class ="movie01.qna.QnaDataBean">
	<jsp:setProperty name ="article" property="*"/>
</jsp:useBean>

<%
	String id="";
	try{
		id=(String)session.getAttribute("id"); 
	}catch(Exception e){}
	
		//넘어오지 않는 값을 DataBean article에 직접 저장
		article.setId(id);
		article.setReg_date(new Timestamp(System.currentTimeMillis()));
		article.setIp(request.getRemoteAddr());
		
		QnaDBBean dbPro=QnaDBBean.getInstance();
		int check = dbPro.insertArticle(article);
		
		out.println(check);//check값 js파일로 반환
%>