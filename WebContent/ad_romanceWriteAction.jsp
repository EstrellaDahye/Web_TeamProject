<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.directory.DirDBBean_Ro" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="romancewrite" class="movie01.directory.DirDataBean" scope="page" />
<jsp:setProperty name="romancewrite" property="title"/>
<jsp:setProperty name="romancewrite" property="director"/>
<jsp:setProperty name="romancewrite" property="actor"/>
<jsp:setProperty name="romancewrite" property="poster"/>
<jsp:setProperty name="romancewrite" property="story"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>영화는 영화, 보러갈래? - Javamovie</title>
</head>
<body>
	<%
		String id = null;
		if(session.getAttribute("id") != null) {
			id=(String) session.getAttribute("id");
		}
		if(!id.equals("admin")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이용 권한이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			if (romancewrite.getTitle() == null || romancewrite.getDirector() == null ||romancewrite.getActor() == null ||
				romancewrite.getPoster() == null ||romancewrite.getStory() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다..')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				DirDBBean_Ro article = new DirDBBean_Ro();
				int result = article.movieWriteRo(romancewrite.getPoster(),romancewrite.getTitle(), romancewrite.getDirector(),romancewrite.getActor(),
						romancewrite.getStory());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('영화등록에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} 
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('등록 완료')");
					script.println("location.href='ad_romancePool.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
	
</body>
</html>