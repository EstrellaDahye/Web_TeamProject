<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="directory.DirDataBean" %>
<%@ page import="wish.WishDBBean" %>
<%@ page import="wish.WishDataBean" %>
<%@ page import="java.io.PrintWriter" %>
<% 	request.setCharacterEncoding("UTF-8"); %>
	
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<title>영화는 영화, 보러갈래? - Javamovie</title>
		<script></script>
	</head>
	<body>
	<% 	String id = (String)session.getAttribute("id");
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String director = request.getParameter("director");
		if(id==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('본 서비스는 로그인 후 이용 가능합니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}else{
			WishDBBean article = new WishDBBean();
			int result = article.insertWish(id, director, title, category);
			if(result == -1 ){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 등록된 영화 입니다.')");
				script.println("history.back()");
				script.println("</script>");
				script.close();
			}else if(result == 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('나의 위시리스트에 저장되었습니다.')");
				script.println("history.back()");
				script.println("</script>");
				script.close();
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('위시리스트 저장에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
				script.close(); 
			}
	
		}
	%>
	</body>
</html>