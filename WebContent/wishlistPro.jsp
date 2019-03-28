<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.wish.WishDataBean" %>
<%@ page import="movie01.wish.WishDBBean" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<script src="js/jquery-1.11.0.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
	
	
	<%	
		String title = request.getParameter("title");
		WishDBBean manager=WishDBBean.getInstance();
		manager.deleteWishlist(title);
	%>
	<script>
		location.href="wishlist.jsp";
	</script>
</body>
</html>