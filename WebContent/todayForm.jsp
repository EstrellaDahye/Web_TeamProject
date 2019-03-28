<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/movieBasic.css" rel="stylesheet">
<link href="css/movieCategory.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="todaym.js"></script>
<script>
	$(function(){
	   Simplecarousel('basicCarousel', {
	          width: '580px',
	          height: '830px'
	          });
	});
	
	$(document).ready(function(){
		
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		});
	});
</script>
<div class="todaypic_container">
	<div class="todaypic_form">
		<p class="inner-title">TODAY'S PICK</p>
		
		<!-- 슬라이드, 영화 줄거리 -->
		<div class="todaypic_contents">
			<!-- 슬라이드 포스터 영역 -->
			<div class="todaypic_slideArea">
				<div class="basicCarousel">
				
 				<%
				try{
					for(int i=0; i<=5; i++) {										
						int sum = 0;
						int reset = 0;
						int j= i+1;

						sum += 1;
				%>					 
		            <div data-value=<%=i %> data-next=<%=j %> data-image="images/<%=j %>today.jpg">
		                <div class="link-contents">
		                </div>
		            </div>
		            
		        <%
					if(i==5) {
		        %>    
		       		<div data-value=<%=j %> data-next=<%=reset %> data-image="images/<%=j+1 %>today.jpg">
		                <div class="link-contents">
		                </div>
		            </div>		            
			    <%
			    }}}catch(Exception e) { e.printStackTrace(); }
			    %>
		   
		        </div>
	        </div>
	        <!-- 영화 줄거리 소개 영역 -->
	        <div class="todaypic_side">
		        <ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">ABOUT MOVIE</li>
					<li class="tab-link" data-tab="tab-2">DIRECTOR&ACTOR</li>
					<li class="tab-link" data-tab="tab-3">PREVIEW</li>
				</ul>

				<div id="tab-1" class="tab-content current">
					<h1>신과 함께 : Along With the Gods: The Two Worlds, 2017</h1>
					<li><b>개요</b> 판타지 , 드라마 ㅣ 139분 ㅣ 2017.12.20 개봉</li>
					<li><b>등급</b> 12세 관람가</li>
					<br>
					<p>
			    		저승 법에 의하면, 모든 인간은 사후 49일 동안 7번의 재판을 거쳐야만 한다.<br>
						<u>살인, 나태, 거짓, 불의, 배신, 폭력, 천륜</u><br>
						7개의 지옥에서 7번의 재판을 무사히 통과한 망자만이 환생하여 새로운 삶을 시작할 수 있다.<br>
						
						“김자홍 씨께선, 오늘 예정 대로 무사히 사망하셨습니다”<br>
						화재 사고 현장에서 여자아이를 구하고 죽음을 맞이한 소방관 자홍, 그의 앞에 저승차사 해원맥과 덕춘이 나타난다. 자신의 죽음이 아직 믿기지도 않는데 덕춘은 정의로운 망자이자 귀인이라며 그를 치켜세운다. 저승으로 가는 입구, 초군문에서 그를 기다리는 또 한 명의 차사 강림, 그는 차사들의 리더이자 앞으로 자홍이 겪어야 할 7번의 재판에서 변호를 맡아줄 변호사이기도 하다. 염라대왕에게 천년 동안 49명의 망자를 환생시키면 자신들 역시 인간으로 환생시켜 주겠다는 약속을 받은 삼차사들, 그들은 자신들이 변호하고 호위해야 하는 48번째 망자이자 19년 만에 나타난 의로운 귀인 자홍의 환생을 확신하지만, 각 지옥에서 자홍의 과거가 하나 둘씩 드러나면서 예상치 못한 고난과 맞닥뜨리는데…<br>
						<br>
						누구나 가지만 아무도 본 적 없는 곳,
						2017년 새로운 세계의 문이 열린다!
		    		</p>
				</div>
				<div id="tab-2" class="tab-content">
					<div class="tab-2_form">
					<h2>감독 & 출연진</h2>
						<div class="test"><img src="images/11.jpg" /><p>감독 <br/>김용화</p></div>
						<div class="test"><img src="images/22.jpg" /><p>주연 <br/>하정우</p></div>
						<div class="test"><img src="images/33.jpg" /><p>주연 <br/>차태현</p></div>
						<div class="test"><img src="images/44.jpg" /><p>주연 <br/>주지훈</p></div>
						<div class="test"><img src="images/55.jpg" /><p>주연 <br/>김향기</p></div>
						<div class="test"><img src="images/66.jpg" /><p>주연 <br/>김동욱</p></div>
					</div>
				</div>
				<div id="tab-3" class="tab-content">
					<h3>[PREVIEW]신과 함께-죄와 벌 : 예고편</h3>
					<iframe src="https://www.youtube.com/embed/5O5PVvHTWRo" 
					frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					<h3>[PREVIEW]신과 함께-죄와 벌 : 캐릭터 영상</h3>
					<iframe src="https://www.youtube.com/embed/89eSS5jhYlI" 
					frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
				</div>
		    </div>
	    </div>

		
	</div>
</div>
