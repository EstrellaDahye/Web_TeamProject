<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.directory.DirDBBean_Co" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="comedywrite" class="movie01.directory.DirDataBean" scope="page" />
<jsp:setProperty name="comedywrite" property="title"/>
<jsp:setProperty name="comedywrite" property="director"/>
<jsp:setProperty name="comedywrite" property="actor"/>
<jsp:setProperty name="comedywrite" property="poster"/>
<jsp:setProperty name="comedywrite" property="story"/>

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
			if (comedywrite.getTitle() == null || comedywrite.getDirector() == null ||comedywrite.getActor() == null ||
				comedywrite.getPoster() == null ||comedywrite.getStory() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다..')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				DirDBBean_Co article = new DirDBBean_Co();
				int result = article.movieWriteCo(comedywrite.getPoster(),comedywrite.getTitle(), comedywrite.getDirector(),comedywrite.getActor(),
						comedywrite.getStory());
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
					script.println("location.href='ad_comedyPool.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
	
</body>
</html>