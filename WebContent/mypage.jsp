<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/movieBasic.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<script src="mypage.js"></script>
<title>영화는 영화, 보러갈래? - Javamovie</title>
<style>
	html {
		overflow-y:scroll;
	}
</style>
</head>
<body>

	<div id="wrap">
		<div id="inner-wrap">
			<div>
				<jsp:include page="main_header.jsp" />
			</div>
			<div>
				<jsp:include page="mypageForm.jsp"/>
			</div>
			<div>
				<jsp:include page="main_footer.jsp" />
			</div>
		</div>
	</div> 
	
</body>
</html>