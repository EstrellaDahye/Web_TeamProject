<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/movieBasic.css">
<link rel="stylesheet" href="css/bootstrap.css">
<title>영화는 영화, 보러갈래? - Javamovie</title>
</head>
<body>
	
<div class ="magazine_container">
	<div class="magazine_form">
	<div class="inner-title">MAGAZINE</div>
			<form method="post" action="writeAction.jsp">
			<table class="table table-striped" style= "text-align :center; 
					border: 1px solid #dddddd">
			<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; 
							text-align: center;">Magazine</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목"
							name="bbsTitle" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용"
							name="bbsContent" maxlength="2048" style= "height: 350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>