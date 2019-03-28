<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.directory.DirDataBean" %>
<%@ page import="movie01.directory.DirDBBean_Ho" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
		if(id == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('세션이 만료되었습니다.<br> 다시 로그인하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		} 
		int movieID = 0;
		if (request.getParameter("movieID") != null) {
			movieID = Integer.parseInt(request.getParameter("movieID"));
		}
		if(movieID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='ad_horrorPool.jsp'");
			script.println("</script>");
		}
		DirDataBean movielist = new DirDBBean_Ho().getmovieHo(movieID);
		if(!id.equals("admin")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이용 권한이 없습니다.')");
			script.println("location.href='ad_horrorPool.jsp'");
			script.println("</script>");
		}else {
			if (request.getParameter("title").equals("") || request.getParameter("director").equals("")||request.getParameter("actor").equals("")
					|| request.getParameter("poster").equals("") || request.getParameter("story").equals("")) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('입력이 안 된 사항이 있습니다.')");
						script.println("history.back()");
						script.println("</script>");
			} else {
				DirDBBean_Ho article  = new DirDBBean_Ho();
				String title = request.getParameter("title");
				String director = request.getParameter("director");
				String actor = request.getParameter("actor");
				String poster = request.getParameter("poster");
				String story = request.getParameter("story");
				int result = article.updateMovieHo(movieID, title, director, actor, poster, story);
				
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('영화수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('수정 완료')");
					script.println("location.href='ad_horrorPool.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
	
</body>
</html>