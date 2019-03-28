<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie01.qna.QnaDataBean" %>
<%@ page import="movie01.qna.QnaDBBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import= "java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content ="width = device-width,initial-scale=1.0"	/>
<script src ="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src ="qnaList.js"></script>
<script src="js/bootstrap.js"></script>
<link href="css/movieBasic.css" rel="stylesheet">

<% request.setCharacterEncoding("utf-8"); %>
<%
	String id=(String)session.getAttribute("id");
	int pageSize = 3;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); //날짜 표시 형식 지정
	
	String pageNum = request.getParameter("pageNum");//페이지 번호
	if(pageNum == null) 
		pageNum = "1";
	
	int count = 0; //전체 글의 수
	
	int currentPage = Integer.parseInt(pageNum);
	
	List<QnaDataBean> articleList = null; 
	QnaDBBean dbPro = QnaDBBean.getInstance();
	count = dbPro.getArticleCount();//전체 글 수 
	
	if(count ==(currentPage -1)*pageSize)
		currentPage -=1;
	
	int startRow = (currentPage-1)*pageSize+1;
	
	try{
		if(count>0)
			articleList=dbPro.getArticles(startRow,pageSize);
		
		if(articleList.isEmpty())
			count =0;
	}catch(Exception e){}
	
%>
</head>
<body>
	<div class="qna_container">
		<div class="qna_form">
			<div class="qna_content">
				<div class ="inner-title">Q&A</div>

<% 			if(count == 0){	//게시판에 글이 없을 경우 
			 try{ 
				if(id!=null){ 					 %>
				<a href="qnaWrite.jsp" class="btn btn-primary">글쓰기</a>
			<% }else{
				out.print("로그인 하시면 글을 작성 할 수 있습니다.<br>");
			} %>
					<div id="qna_notdata">
						<p> 등록된 Q&A가 없습니다.</p>
					</div>
				<%}catch(Exception e){e.printStackTrace();} %>
<%			}else{ //게시판에 글이 있을 경우 
	
				if(id!=null){ 					 %>
				<a href="qnaWrite.jsp" class="btn btn-primary">글쓰기</a>
<% 				}else{
					out.print("<p>로그인 하시면 글을 작성 할 수 있습니다.</p>");
				} 								%>

				<div id ="list_article" >
<%				//글목록 반복처리
				for(int i =0; i<articleList.size();i++){
					QnaDataBean article = articleList.get(i);
					
					//wid=들여쓰기
					id = article.getId();
					int wid=0;
					int num = article.getNum();
					int ref = article.getRef();
					int re_step = article.getRe_step();
					int re_level= article.getRe_level();
					String sub= article.getSubject();
					String subject = URLEncoder.encode(sub,"UTF-8");
%>				
						
				<table class="table table-striped" style= "text-align :center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">
<%					if(article.getRe_level()>0){
						wid=5*(article.getRe_level()); 	%>
					<img src="images/check.png" style="width:20px;">
<%					}	%>
						<%= sub %></th>
					</tr>
				</thead>
					<tbody>
						<tr>
							<td>아이디</td>
							<td style="text-align: left;">
<%						out.println(id);					%>
						</tr>
						<tr>
							<td>작성일자</td>
							<td style="text-align: left;">
							<%=sdf.format(article.getReg_date()) %>
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td style="min-height:200px; text-align:left;">
							<%=article.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&lt;").replaceAll("\n", "<br>") %>
							</td>
						<tr>
							<td colspan="3" style="text-align: left;">
<%				try{
					String Sid = (String)session.getAttribute("id");
					if(Sid.equals(id)){	//로그인 아이디가 작성자와 같을 경우 수정%>
					<a href="qnaUpdate.jsp?num=<%= num %>&pageNum=<%=pageNum %>" class="btn btn-primary">수정</a>
<%				//로그인 아이디가 작성자와 같거나 관리자일 경우 삭제
					}if(Sid.equals(id)||Sid.equals("admin")){ 	%>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="qnaDeleteAction.jsp?num=<%= num %>" class="btn btn-primary">삭제</a>
<%					}
					if(Sid.equals("admin")){ // 로그인 아이디가 admin일 경우 답변하기
%>					<a href="qnaWrite.jsp?num=<%= num %>&ref=<%=ref %>&re_step=<%=re_step %>&re_level=<%=re_level %>
						&pageNum=<%=pageNum %>&subject=<%=subject %>" class="btn btn-primary">답변하기</a>
<%					}
				}catch(Exception e){}%>

						</td>
					</tr>
				</tbody>
			</table>
<%		}//for문 종료		%>
		</div>
<%			} %>

						<%--페이지 이동--%>
		<div class = "qna_number" style="text-align:center">
<%	
		if(count >0){
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0:1);
			int startPage = 1;
		
			if(currentPage % pageSize != 0)
				startPage = (int)(currentPage/pageSize)*pageSize +1;
			else
				startPage = ((int)(currentPage/pageSize)-1)*pageSize +1;
			int pageBlock = 3;
			int endPage = startPage + pageBlock -1;
			
			if(endPage > pageCount) 
				endPage = pageCount;
		
			if(startPage > pageBlock){ %>
				<a href="qna.jsp?pageNum=<%=startPage - pageBlock %>" class="btn btn-primary">이전</a>
				&nbsp;
<%			}
			//페이지 번호 출력		
			for(int i = startPage ; i<=endPage ; i++){	%>
				<a href="qna.jsp?pageNum=<%=i %>" class="btn btn-primary"><%=i %></a>
				&nbsp;
<%			} 
		
			if(endPage <pageCount){		%>
				&nbsp;
				<a href="qna.jsp?pageNum=<%=startPage + pageBlock %>" class="btn btn-primary">다음</a>
<%	
			}
		}
%>
			</div>	
		</div>	
	</div> 
	</div>
	</body>
</html>
