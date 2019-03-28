<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.qna.QnaDBBean" %>
<%@ page import="movie01.qna.QnaDataBean" %>
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
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		} 
		int num = 0;
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		if(num == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='qna.jsp'");
			script.println("</script>");
		}
		
		QnaDataBean data = new QnaDBBean().updateGetArticle(num);
		if(!id.equals(data.getId()) && !id.equals("admin")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='qna.jsp'");
			script.println("</script>");
		}
		else {
			QnaDBBean article = new QnaDBBean();
			int result = article.deleteArticle(num);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} 
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글이 삭제되었습니다.')");
				script.println("location.href='qna.jsp'");
				script.println("</script>");
			}
			
		}
	
	%>
	
</body>
</html>