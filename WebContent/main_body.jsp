<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="movie01.magazine.Bbs" %>
<%@ page import="movie01.magazine.BbsMagazine" %>
<%@ page import="movie01.qna.QnaDataBean" %>
<%@ page import="movie01.qna.QnaDBBean" %>
<%@ page import="movie01.directory.DirDataBean" %>
<%@ page import="movie01.directory.DirDBBean_Th" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/movieBasic.css" rel="stylesheet">
<link href="css/movieCategory.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/slider-pro.min.css" rel="stylesheet" media="screen"/>
<link href="css/examples.css" rel="stylesheet" media="screen"/>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery.sliderPro.min.js"></script>
<script type="text/javascript" src="js/bodyTodaySlider.js"></script>
<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="inner-body">
		<!-- //////////////////슬라이드 영역////////////////// -->
		<!-- bootstrap 참조 -->
		<div class="carousel slide" id="poster">
			<ol class="carousel-indicators">
				<li data-target="#poster" data-slide-to="0" class="active"></li>
				<li data-target="#poster" data-slide-to="1"></li>
				<li data-target="#poster" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/bodyslidePoster01.png">
					<div class="carousel-caption">
						<h1>가디언즈 오브 갤럭시 VOL.2</h1>
						<p>Guardians of the Galaxy Vol. 2, 2017</p>
					</div>
				</div>
				<div class="item">
					<img src="images/bodyslidePoster02.png">
					<div class="carousel-caption">
						<h1>암살</h1>
						<p>Assassination, 2015</p>
					</div>
				</div>
				<div class="item">
					<img src="images/bodyslidePoster03.png">
					<div class="carousel-caption">
						<h1>라라랜드</h1>
						<p>La La Land, 2016</p>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#poster" data-slide="prev">
				<span class="icon-prev"></span>
			</a>
			<a class="right carousel-control" href="#poster" data-slide="next">
				<span class="icon-next"></span>
			</a>
		</div>
		<br>
		<br>
		
		<!-- /////////Today's pick, magazine 프리뷰 영역///////// -->
		<div class="inner-preview">
			<div id="p_wrapper">
				<div id="p_page" class="p_container">
					<div id="p_content">
						<div class="p_title">
						<h1 class="texteffect">today's category</h1>
						</div>
						
						<!-- ///////////////// body_Today's ///////////////// -->				
						<%
							int movieID=0;
							String poster="";
							String title="";
							String category="";
							String story="";
							
							DirDBBean_Th moviedir = DirDBBean_Th.getInstance();
							ArrayList<DirDataBean> bdclist = moviedir.getBodyDirCont(movieID, poster, title, category, story);				
						%>
						<div id="example1" class="slider-pro">
                        <div class="sp-slides">
                           <%
                           for(int i=0; i<bdclist.size(); i++) {
                           %>
                        <div class="sp-slide">
                           <a onclick="location.href='dir_<%= bdclist.get(i).getCategory()%>.jsp'">
                              <img class="sp-image" src="posters/<%= bdclist.get(i).getPoster()%>"/>
                           </a>
                        </div>
                           <%} %>
                     </div>
               
                     <div class="sp-thumbnails">
                       <%for(int i=0; i<bdclist.size(); i++) {%>
                     	<div class="sp-thumbnail">
                           <div class="sp-thumbnail-title"><%= bdclist.get(i).getMovieID()%></div>
                              <div class="sp-thumbnail-description">
                                 <p><%= bdclist.get(i).getTitle()%></p>
                              </div>
                           </div>
                           <%} %>
                        </div>
                    </div>   
               </div>
					
					<!-- ///////////////// body_MAGAZINE ///////////////// -->
					<%
						int bbsID=0;
						String bbsTitle = "";
						String bbsContent = "";
						
						BbsMagazine manager = BbsMagazine.getInstance();
						ArrayList<Bbs> list = manager.getMagazineCont(bbsID, bbsTitle, bbsContent);
					%>
					
					<div id="p_sidebar">		
					<%
					try {
						for(int i=0; i<list.size(); i++) {	
					%>
							<ul class="p_style1">
								<li class="p_first">
									<h3>[MAGAZINE] <%=list.get(i).getBbsTitle() %></h3>
									<p class="overtext">
										<a href="view.jsp?bbsID=<%=list.get(i).getBbsID() %>">
										<%=list.get(i).getBbsContent() %></a>
									</p>
								</li>
							</ul>
					<%}
						if(list.size()!=3) {
							for(int j=0; j<3-list.size(); j++) {
					%>	
							<ul class="p_style1">
								<li class="p_first">
									<h3>[MAGAZINE] 등록된 글이 없습니다.</h3>
								</li>
							</ul>	
								
					<!-- //////////////////// body_QnA //////////////////// -->		
					<%}}
						int num=0; 
 						String Subject = "";
 						String Content = "";
 						
 						QnaDBBean qdb = QnaDBBean.getInstance();
 						ArrayList<QnaDataBean> qdblist = qdb.getQnaCont(num, Subject, Content);
 						
 						for(int i=0; i<qdblist.size(); i++) {
					%>
							<ul class="p_style1">
								<li class="p_first">
									<h3>[QnA] <%=qdblist.get(i).getSubject() %></h3>
									<p class="overtext">
									<a href="qna.jsp?bbsID=<%=qdblist.get(i).getNum() %>">
									<%=qdblist.get(i).getContent() %></a>
								</p>
								</li>
							</ul>
					<%}
							if(qdblist.size()!=2) {
								for(int j=0; j<2-qdblist.size(); j++) {
					%>	
							<ul class="p_style1">
								<li class="p_first">
									<h3>[QnA] 등록된 글이 없습니다.</h3>
								</li>
							</ul>		
					<%}}} catch(Exception e) {
						e.printStackTrace();
					}
					%>	
					</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>