<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="movie01.directory.DirDataBean" %>
<%@ page import="movie01.directory.DirDBBean_Ac" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/sellpopup.css"/>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	int movieId=0;
	String id = (String)session.getAttribute("id");
	String pMovieId = request.getParameter("movieId"); 
	movieId = Integer.parseInt(pMovieId);
	
	DirDBBean_Ac manager = DirDBBean_Ac.getInstance();
	DirDataBean m = manager.getMoviedetailAc(movieId);

	String title = m.getTitle() ;
	String poster = m.getPoster();
	String director = m.getDirector();
	String actor = m.getActor();
	String story =m.getStory();
	String category=m.getCategory();

%>

<div class="pop_container">
	<div class="pop_content">
		<div class="pop_form">
			<div class="pop_poster">
				<img name="ppp" width="100%"  src="posters/<%=poster %>"/>
				<form method="post" action="dir_Sellaction.jsp">
					<input type="hidden" name="director" value="<%=director %>"/>
					<input type="hidden" name="title" value="<%= title %>"/>
					<input type="hidden" name="category" value="<%=category %>"/>
				<input class="sellpopup" type="submit" id="wishList" value="위시리스트"/>
				</form>
			</div>
			<div class="story_area">
				<div class="pop_story">
					<h1><%= title %><span id="title_sub">, (<%=category %>)</span></h1>
					<p>감독: <%= director %></p>
					<p>출연진 : <%= actor %></p>
					<p><b>줄거리</b><br/>
				 	 		<%= story %>
				 	 </p> 
				</div>
			</div>
		</div>
	</div>
</div>

