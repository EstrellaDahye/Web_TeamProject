<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.directory.DirDBBean_Ho" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="horrorwrite" class="movie01.directory.DirDataBean" scope="page" />
<jsp:setProperty name="horrorwrite" property="title"/>
<jsp:setProperty name="horrorwrite" property="director"/>
<jsp:setProperty name="horrorwrite" property="actor"/>
<jsp:setProperty name="horrorwrite" property="poster"/>
<jsp:setProperty name="horrorwrite" property="story"/>

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
			if (horrorwrite.getTitle() == null || horrorwrite.getDirector() == null ||horrorwrite.getActor() == null ||
				horrorwrite.getPoster() == null ||horrorwrite.getStory() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다..')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				DirDBBean_Ho article = new DirDBBean_Ho();
				int result = article.movieWriteHo(horrorwrite.getPoster(),horrorwrite.getTitle(), horrorwrite.getDirector(),horrorwrite.getActor(),
						horrorwrite.getStory());
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
					script.println("location.href='ad_horrorPool.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
	
</body>
</html>