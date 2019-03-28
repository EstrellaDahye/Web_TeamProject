<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="movie01.directory.DirDataBean" %>
<%@ page import="movie01.directory.DirDBBean_Ani" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<link href="css/movieBasic.css" rel="stylesheet">
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/usePool.css" rel="stylesheet" />
	<script src="js/jquery-1.11.0.min.js"></script>
	<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
	<title>Insert title here</title>
	<style>
		html {
			overflow-y:scroll;
		}
	</style>
	<script>
		function newMovieAni(){
			location.href="ad_animationWriteForm.jsp";
		}
		function updateMovieAni(delID){
   			location.href="ad_animationUpdateForm.jsp?movieid="+delID;
   		}
   		function deleteMovieAni(delID){
   			var cf = confirm("이 영화를 정말로 삭제하시겠습니까? \n (삭제된 데이터는 복구 할 수 없습니다.)");
			if(cf){
   				location.href="ad_animationPoolPro.jsp?movieid="+delID;}   		
   		}
   	</script>	
</head>

<body>
<%	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null){
	pageNumber= Integer.parseInt(request.getParameter("pageNumber"));
	 }
%>
	<div id="wrap">
	<div id="inner-wrap">
	<div><jsp:include page="main_header.jsp" /></div>
	<div class="inner-content">
	<p class="inner-title">Movie Management</p>
	
	
	<%	
	String id="";
	try{
		id=(String)session.getAttribute("id");
		
		DirDBBean_Ani manager = DirDBBean_Ani.getInstance();
		ArrayList<DirDataBean> list=manager.adminMovieListAni(pageNumber);
	
	
		if(id!=null && id.equals("admin")){			%>
	<!--  하이퍼링크 달아서 카테고리 별 업로드 페이지 전환 -->
	<div class="admovie_dir"> 
		<a href="ad_romancePool.jsp">Romance</a> / 
		<a href="ad_comedyPool.jsp">Comedy</a> /
		<a href="ad_actionPool.jsp">Action</a> / 
		<a href="ad_thrillerPool.jsp">Thriller</a> / 
		<a href="ad_horrorPool.jsp">Horror</a> / 
		<b>Animation</b> 
	</div>
	<div class="table-area">
	   	<input type="button" class="btn btn-primary" value="영화등록" onclick="newMovieAni();">
		<table>
		<tr>
	   		<th style="width:5%"> 순번
	   		<th style="width:13%"> 파일명
	   		<th style="width:13%"> 영화명
	   		<th style="width:13%"> 감독
	   		<th style="width:13%"> 배우
	   		<th style="width:30%"> 줄거리
	   		<th style="width:13%"> 관리
	   	</tr>
<% 			for(DirDataBean dtb:list){ %> 	
   		<tr>
   			<td><%= dtb.getMovieID() %>
   			<td><%= dtb.getPoster() %>
   			<td><%= dtb.getTitle() %>
   			<td><%= dtb.getDirector() %>
   			<td><%= dtb.getActor() %>
   			<td><%= dtb.getStory() %>
   			<td>
	   		<input type="button" class="del_btn" value="수정" onclick="updateMovieAni('<%=dtb.getMovieID()%>');">
   			<input type="button" class="del_btn" value="삭제" onclick="deleteMovieAni('<%=dtb.getMovieID()%>');">
   		</tr>
   		<% } %>
   	</table>

   	<%}else {%>
   	<img class="inner_text" src="images/clapper.png">
	<div class="inner_text">관리자만 접근할 수 있는 페이지 입니다.</div>  	
 	</div>
 	</div>
 	<%}
	}catch(Exception e){e.printStackTrace();} %>
	<div><jsp:include page="main_footer.jsp"/></div>
	</div>
	</div>  
	

</body>
</html>