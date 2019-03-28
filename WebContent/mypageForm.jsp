<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/movieBasic.css"/>
<style>
	#adminlist{
		width:100%;
		position: relative;
		text-align:center;
		font-size: 16px;
	}
	
	#myshopMain { margin:80px auto 0; font-size:0; width:800px; clear:both; }
	#myshopMain .shopMain { display:inline-block; width:48%; height:; overflow:hidden; text-align:center; padding:0; margin:0 1% 32px; text-align:; }
	#myshopMain .shopMain h3 { display:block; font-size:15px; color:#555; font-weight:normal; }
	#myshopMain .shopMain h3 a { display:block; padding:0; color:#666666; font-weight: bold;}
	#myshopMain .shopMain h3 a:hover { text-decoration:none; color:#f1404b; }
	#myshopMain .shopMain p { padding:7px 0 0; height:50px; }
	#myshopMain .shopMain p a { font-size:11px; letter-spacing:; line-height:18px; color:#959595; text-decoration:none; }

</style>
<title>영화는 영화, 보러갈래? - Javamovie</title>
</head>
<body>

<div class="mypage_container">
<div class="mypage_form">
		<div class="inner-title">
		  <p>MY PAGE</p>
		</div>
		<div id="myshopMain">
			<div class="shopMain profile">
					<a href="modify.jsp"><img style="width:250px;height:250px;"src="images/user-6.png"/></a>
        		<h3><a href="modify.jsp">PROFILE</a></h3>
        		<p><a>회원이신 고객님의 개인정보를 관리하는 공간입니다.</a></p>
    		</div>
    		<div class="shopMain">
    				<a href="wishlist.jsp"><img style="width:250px;height:250px;"src="images/chat-2.png"/></a>
        		<h3><a href="wishlist.jsp">WISHLIST</a></h3>
        		<p><a>위시리스트로 등록하신 영화의 목록을 보여드립니다.</a></p>
    		</div>
		</div>
	</div>
</div>
</body>
</html>