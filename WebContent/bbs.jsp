<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "movie01.magazine.BbsDAO" %>
<%@ page import = "movie01.magazine.Bbs" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/movieBasic.css"/>

<title>영화는 영화, 보러갈래? - Javamovie</title>
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration : none;
	}
	h1 {
	font-weight: bold;
	font-size: 40pt;
	padding.8em .5em;
	width : 1200px;
	color : #f1404b;
	}
	
</style>
</head>
<body>
	<% 
		String id = null;
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
<div class ="magazine_container">
	<div class="magazine_form">
	<div class="inner-title">MAGAZINE</div>

	<%-- 여기부터 게시판 --%>
			<table class="table table-striped" style= "text-align :center; 
					border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center; ">NUMBER</th>
						<th style="background-color: #eeeeee; text-align: center; width:550px;">SUBJECT</th>
						<th style="background-color: #eeeeee; text-align: center;">NAME</th>
						<th style="background-color: #eeeeee; text-align: center;">DATE</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i=0; i<list.size(); i++) {
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
						<td><%= list.get(i).getId() %></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" +list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<% 
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1) {
			%>
				<a href="board.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				} if(bbsDAO.nextPage(pageNumber +1)) {
			%>
				<a href="board.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
			
			<%
				try{
					id = (String)session.getAttribute("id");
					if(id!=null&&id.equals("admin")) {	
			%>
		 			 <a href="boardWrite.jsp" class="btn btn-primary pull-right">글쓰기</a>
		 	<%		}else{}
				}catch(Exception e){e.printStackTrace();}%>
		</div>
	</div>

	
	<script src="login.js"></script>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>