<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="movie01.directory.DirDataBean" %>
<%@ page import="movie01.directory.DirDBBean_Th" %>
<%@ page import="java.util.ArrayList" %>
<meta name ="viewport" content="width=device-width,initial-scale=1.0"/>
<title>영화는 영화, 보러갈래? - Javamovie</title>
<link href="css/movieBasic.css" rel="stylesheet"/>
<link href="css/movieDirectory.css" rel="stylesheet"/>
<link href="css/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet" href="css/sellpopup.css"/>
<style>
/* IE에서는 외부css로 적용이 되는데
크롬에서 불러오지 못해서 해당 파일에 코드를 씀 */
#popupLayer {
	display:none;
	border:5px solid #cccccc;
	margin:0;
	padding:5px;
	background-color:#ffffff;
	z-index:5;
}
#popupLayer .b-close {
	position:absolute;
	top:10px;
	right:15px;
	color:#f37a20;
	font-weight:bold;
	cursor:hand;
}
#popupLayer .popupContent {
	margin:0;
	padding:0;
	text-align:center;
	border:0;
}
#popupLayer .popupContent iframe {
	width:720px;
	height:650px;
	border:0;
	padding:0px;
	margin:0;
	z-index:10;
}

</style>


<%
	request.setCharacterEncoding("utf-8");
%>

<%
	int movieID=0;
	String title="";
	String poster="";
	String category="thriler";
	int pageNumber = 1;
 	if(request.getParameter("pageNumber") != null){
		pageNumber= Integer.parseInt(request.getParameter("pageNumber"));
	 }
%>


<div class="moviedir_container">
	<div class="moviedir_form">
		<p class="inner-title">THRILLER</p>
						
	<%
		DirDBBean_Th manager = new DirDBBean_Th();
		ArrayList<DirDataBean> list = manager.getMovieListTh(pageNumber, category);
	%>
		<div class="moviedir_content">
			<div class="poster_area">
	<% 		
		try{ 
			
					for(int i = 0; i < list.size(); i++){ 
	%>
				<div class="poster_wrap">
					<img class="movieposter" src="posters/<%= list.get(i).getPoster()%>" />
					<figcaption>
	   					<h3><%=list.get(i).getTitle() %></h3>
	   					<input type="submit" id="popup<%=i %>" name="moviedt" class="middle" value="더보기" 
	   					onClick="javascript:openPopup('dir_thSellpopup.jsp?movieId=<%= list.get(i).getMovieID() %>')"/>
	  				</figcaption>
				</div>
	<%} %>
				<div id="popupLayer">					
					<div class="popupContent"></div>					
					<a onclick="this.parentNode.style.display = 'none'">
					<div class="b-close"><input type="button" value="X" class="del"/></div>
					</a>
				</div> 
	<%		
		}catch(Exception e){e.printStackTrace();}
	%>
			</div>
			<div class="before_after">
	<!-- 페이지 전환 -->		
	<%	try{ 
		 	if(pageNumber != 1){ %>
				<input type="submit" id="before" class="pageButton" value="이전"
				onclick="location.href='dir_thriler.jsp?pageNumber=<%= pageNumber-1 %>'"/>
	<%		}if(manager.nextPageTh(pageNumber +1)) { %>
				<input type="submit" id="next" class="pageButton" value="다음"
				onclick="location.href='dir_thriler.jsp?pageNumber=<%= pageNumber+1 %>'"/>
	<% 		} %>		
	<% 	} catch(Exception e){e.printStackTrace();} %>
			</div>
		</div>
	</div>
</div>


<!-- 스크립트 -->
<script>
	function openPopup(src) {
		$("#popupLayer").bPopup({
			content:'iframe',
			iframeAttr:'frameborder=”auto”',
			iframeAttr:'frameborder=”0',
			contentContainer:'.popupContent',
			loadUrl: src,
			onOpen: function() { 
			}, 
			onClose: function() { 
			}
		},
		function() {
		});
	}
</script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.bpopup.min.js"></script>