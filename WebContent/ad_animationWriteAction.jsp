<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.directory.DirDBBean_Ani" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="animationwrite" class="movie01.directory.DirDataBean" scope="page" />
<jsp:setProperty name="animationwrite" property="title"/>
<jsp:setProperty name="animationwrite" property="director"/>
<jsp:setProperty name="animationwrite" property="actor"/>
<jsp:setProperty name="animationwrite" property="poster"/>
<jsp:setProperty name="animationwrite" property="story"/>

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
			if (animationwrite.getTitle() == null || animationwrite.getDirector() == null ||animationwrite.getActor() == null ||
				animationwrite.getPoster() == null ||animationwrite.getStory() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다..')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				DirDBBean_Ani article = new DirDBBean_Ani();
				int result = article.movieWriteAni(animationwrite.getPoster(),animationwrite.getTitle(), animationwrite.getDirector(),animationwrite.getActor(),
						animationwrite.getStory());
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
					script.println("location.href='ad_animationPool.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
	
</body>
</html>