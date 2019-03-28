<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="movie01.wish.WishDataBean" %>
<%@ page import="movie01.wish.WishDBBean" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<link href="css/movieBasic.css" rel="stylesheet">
	<link href="css/bootstrap.css" rel="stylesheet">
	<script src="js/jquery-1.11.0.min.js"></script>
	<script>
		function wishlistDelete(title){
			var cf = confirm("이 영화를 정말로 리스트에서 삭제하시겠습니까?");
			if(cf){location.href="wishlistPro.jsp?title="+title;}
		}
	
	</script>
	<style>
	html {
		overflow-y:scroll;
		height:100%;
	}
	body{
		height:100%;
	}
	</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화는 영화, 보러갈래? - Javamovie</title>
</head>
<body>

	<%	
		String id = (String)session.getAttribute("id");
		if(id==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('본 서비스는 로그인 후 이용 가능합니다.')");
			script.println("location.href('login.jsp')");
			script.println("</script>");
		}else{

		String pageNum=request.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 15;
		int startRow = (currentPage -1) *pageSize +1;//화면에 표시할 페이지 번호
%>
	<div id="wrap">
		<div id="inner-wrap">
			<div>
 				<jsp:include page="main_header.jsp" /> 	
			</div>
			<div class="qna_container">
			<div class="inner-title">
				WISHLIST
			</div>
	      <div class="page_body">
	      		<strong><%= id %></strong>님의 위시리스트 내역입니다.
	
			  <p>&nbsp;</p>
		
	          <table class="wishlist">
						<thead>
							<tr>
								<th style="width:40%">제목</th>
								<th style="width:20%">감독</th>
								<th style="width:20%">카테고리</th>
								<th style="width:20%">삭제하기</th>
							</tr>
						</thead>
						
						<%
			   			WishDBBean manager = WishDBBean.getInstance();
						List<WishDataBean> articleList = null;
						if(manager.getWishlist(id, startRow, pageSize)!=1){	//데이터가 없을 경우 %> 
						<tbody>
							<tr>
								<td colspan="4">저장한 위시리스트가 없습니다.</td>
							</tr>
						</tbody>
							
					<%	}else{			//데이터가 있을 경우
				   			articleList=manager.printWishlist(id, startRow, pageSize);
				   			for(int i =0;i<articleList.size();i++){
				   				WishDataBean article = articleList.get(i);
				   				String title=article.getTitle();
		   			%>
							<tbody>
								<tr>
									<td><%= title %></td>
				  					<td><%= article.getDirector() %></td>
				  					<td><%= article.getCategory() %></td>
				  					<td><input type="button" class="del" value="삭제" onclick="wishlistDelete('<%= title %>');"/></td>
				  					
								</tr>
							<% } %>
						</tbody>
						<% } %>
						
					</table>
				</div>
			</div>
			<div>
				<jsp:include page="main_footer.jsp" />
			</div>
		</div>
	</div>
	<%	} %>
</body>
</html>