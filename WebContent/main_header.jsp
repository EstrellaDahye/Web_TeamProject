<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/movieBasic.css" rel="stylesheet">
<script src="login.js"></script>
</head>
<body>
 	
 	<% 
		String id ="";
		try{
		//id세션 속성의 값을 얻어내서 id변수에 저장
		//인증된 사용자의 경우  id세션 속성의 값 null또는 공백이 아님
		id = (String)session.getAttribute("id");
	%>

	<header id="inner-header">
	
		<div id="header">
			<div class="header-logo" id="logo"><a href="main.jsp"><img src="images/logo1.jpg"></a></div>
			<div id="header-right">
				<div id="right">
					<ul>
               <% if(id == null || id.equals("")){ //인증되지 않은 사용자 영역%>
                  <li class="lgtt"><a href="login.jsp">LOGIN</a></li>
                  <li class="lg"><a href="register.jsp">JOIN</a></li> 
                  <%}else{//인증된 사용자 영역%>
                    <li class="lgt"><a href ="logout.jsp">LOGOUT</a></li>
                    <%}}catch(Exception e){e.printStackTrace();}%>
                  <li class="lgt"><a href="wishlist.jsp">WISHLIST</a></li>
                  <%
                     try{
                        id = (String)session.getAttribute("id");
                        if(id == null) {
                  %>  
                  <li class="lg"><a href="javascript:void(0);" onclick="mpcheckIt(this)">MYPAGE</a></li>
                     <%} else { %>
                  <li class="lgt"><a href="javascript:void(0);" onclick="mpok(this)">MYPAGE</a></li>
                   <%   if(id.equals("admin")){
                   %>
                      <li class = "lg"><a href ="admin.jsp">ADMIN</a></li>
                   <%    
                         }
                        }
                     }catch(Exception e){e.printStackTrace();}%>
               </ul>
				</div>
			</div>
		</div>
		
		
		
		<!-- 메뉴바 드롭다운 -->
		<div class="menubar">
			<ul>
				<li><a href="main.jsp">HOME</a></li>
				<li><a href="todayPick.jsp">TODAY'S PICK</a></li>
				<li><a href="dir_comedy.jsp">코미디/로맨스</a>
					<ul>
						<li><a href="dir_comedy.jsp">코미디</a></li>
						<li><a href="dir_romance.jsp">로맨스</a></li>
					</ul>
				</li>
				<li><a href="dir_action.jsp">액션/스릴러/공포</a>
					<ul>
						<li><a href="dir_action.jsp">액션</a></li>
						<li><a href="dir_thriler.jsp">스릴러</a></li>
						<li><a href="dir_horror.jsp">공포</a></li>
					</ul>
				</li>
				<li><a href="dir_animation.jsp">애니메이션</a></li>
				<li><a href="board.jsp">MAGAZINE</a></li>
				<li><a href="qna.jsp">Q&A</a></li>
			</ul>
		</div>
	</header>

</body>
</html>
