<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.directory.DirDBBean_Ac" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="actionwrite" class="movie01.directory.DirDataBean" scope="page" />
<jsp:setProperty name="actionwrite" property="title"/>
<jsp:setProperty name="actionwrite" property="director"/>
<jsp:setProperty name="actionwrite" property="actor"/>
<jsp:setProperty name="actionwrite" property="poster"/>
<jsp:setProperty name="actionwrite" property="story"/>

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
		if(id==null&&!id.equals("admin")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이용 권한이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			if (actionwrite.getTitle() == null || actionwrite.getDirector() == null ||actionwrite.getActor() == null ||
				actionwrite.getPoster() == null ||actionwrite.getStory() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('미등록 항목이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				DirDBBean_Ac article = new DirDBBean_Ac();
				int result = article.movieWriteAc(actionwrite.getPoster(),actionwrite.getTitle(), actionwrite.getDirector(),actionwrite.getActor(),
						actionwrite.getStory());
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
					script.println("location.href='ad_actionPool.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
	
</body>
</html>