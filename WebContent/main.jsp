<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>영화는 영화, 보러갈래? - Javamovie</title>
<link href="css/movieBasic.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>

	<div id="wrap">
		<div id="inner-wrap">
			<div>
 			<jsp:include page="main_header.jsp" /> 	
			</div>
			<div>
				<jsp:include page="main_body.jsp" />
			</div>
			<div>
				<jsp:include page="main_footer.jsp" />
			</div>
		</div>
	</div> 
	
	
	<script src="js/jquery-2.2.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>