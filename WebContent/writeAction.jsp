<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.magazine.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bbs" class="movie01.magazine.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>

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
		} else {
			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('입력이 안 된 사항이 있습니다..')");
						script.println("history.back()");
						script.println("</script>");
					} else {
						BbsDAO bbsDAO = new BbsDAO();
						int result = bbsDAO.write(bbs.getBbsTitle(), id, bbs.getBbsContent());
						if (result == -1) {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('글쓰기에 실패했습니다.')");
							script.println("history.back()");
							script.println("</script>");
						} 
						else {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("location.href='board.jsp'");
							script.println("</script>");
						}
					}
		}
		
	
	%>
	
</body>
</html>