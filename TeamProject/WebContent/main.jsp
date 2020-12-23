<%@page import="board.dto.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../menu.jsp"%>
<style>
* {
	font-family: 'NeoDunggeunmo';
	margin: 0;
	padding: 0;
}

#main-top {
	position: relative;
	margin-top: 50px;
	margin-left: 100px;
}

#main-left {
	margin-top: 50px;
	margin-left: 200px;
	position: left;
	float: left;
	display: inline;
	position: left;
}

#main_right {
	margin-top: 50px;
	margin-right: 200px;
	float: right;
}
.slider {
  list-style:none;
  height:500px;
  overflow:hidden;
}
.slider:after {
  display:block;
  clear:both;
}
.slider li {
  top:0;
  left:0;
  width:100%;
  height:500px;
}
.slider li div {
  width:100%;
  height:100%;
  background-size:cover;
}
.slider li .right {
  left:auto;
  right:20px;
  text-align:right;
}
.btn {
  text-align:center;
}
.btn button {
  margin-top:10px;
  border:1px solid #ccc;
  background-color:#fff;
  color:#666;
  font-size:1.5rem;
  cursor:pointer;
}

.rollingbanner {
	position: relative;
	height: 300px;
	width: 880px;
	overflow: hidden;
	border: 1px solid black;
	margin-left: auto;
	margin-right: auto;
}

.rollingbanner .bannerbox {
	position: absolute;
	margin: 0;
	padding: 0;
}

.rollingbanner li {
	float: left;
	list-style: none;
	margin-left: 10px
}

.rollingbanner li:first-child {
	margin: 0
}

.rollingbanner a>img {
	width: 210px;
	height: 300px;
	border: 1px solid gray;
}
</style>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script>
	$(function() {
		function noticetick() {
			$('#notice_ticker li:first').slideUp(function() {
				$(this).appendTo($('#notice_ticker')).slideDown();
			});
		}
		setInterval(function() {
			noticetick()
		}, 3000);

		timer();
		var current = 0;
		var interval = 0;

		function timer() {
			var interval = setInterval(function() {
				slide()
			}, 2000);
		}
		function slide() {
			$(".bannerbox").animate({
				left : "-=210px"
			}, 1000, function() {
				$(this).css({
					"left" : 0
				});
				$(".bannerbox").append($(".bannerbox").children("li").eq(0));
			});
			current++;
			if (current == 5)
				current = 0;
		}

			  var $slider = $('.slider'),
			      $firstSlide = $slider.find('.li').first() // 첫번째 슬라이드
			  .stop(true).animate({'opacity':1},200); // 첫번째 슬라이드만 보이게 하기

			  function PrevSlide(){ // 이전버튼 함수
			    var $lastSlide = $('.slider').find('.li').last() //마지막 슬라이드
			    .prependTo($slider); //마지막 슬라이드를 맨 앞으로 보내기  
			    $secondSlide = $slider.find('.li').eq(1)
			   //두 번째 슬라이드 구하기
			   .stop(true).animate({'opacity':0},400); //밀려난 두 번째 슬라이드는 fadeOut 시키고
			    $firstSlide = $slider.find('.li').first() //맨 처음 슬라이드 다시 구하기
			    .stop(true).animate({'opacity':1},400);
			    //새로 들어온 첫 번째 슬라이드는 fadeIn 시키기
			  }
			  function NextSlide(){ // 다음 버튼 함수
			    $firstSlide = $slider.find('.li').first() // 첫 번째 슬라이드
			    .appendTo($slider); // 맨 마지막으로 보내기
			    var $lastSlide = $slider.find('.li').last() // 맨 마지막으로 보낸 슬라이드
			    .stop(true).animate({'opacity':0},400); // fadeOut시키기
			    $firstSlide = $slider.find('.li').first()
			    // 맨 처음 슬라이드
			    .stop(true).animate({'opacity':1},400);
			    // fadeIn 시키기
			  }
			  
			  setInterval(NextSlide, 5000); //자동 슬라이드 설정

	});
</script>
</head>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<body>
	<section>
  <ul class="slider">
    <li class="li">
      <div style="background-image:url('background/journey.gif');">
      </div>
    </li>
    <li class="li">
      <div style="background-image:url('background/dog.gif');">
      </div>
    </li>
    <li class="li">
      <div style="background-image:url('https://cdn.pixabay.com/photo/2019/07/27/11/25/drinking-glasses-4366559_960_720.jpg');">
      </div>
    </li>
    <li class="li">
      <div style="background-image:url('https://cdn.pixabay.com/photo/2019/06/17/15/41/landscape-4280257_960_720.jpg');">
      </div>
    </li>
    <li class="li">
      <div style="background-image:url('https://cdn.pixabay.com/photo/2019/07/10/22/41/zinnowitz-4329714_960_720.jpg');">
      </div>
    </li>
    <li class="li">
      <div style="background-image:url('https://cdn.pixabay.com/photo/2019/06/24/15/31/forest-4296305_960_720.jpg');">
      </div>
    </li>
  </ul>
</section>
	<%----------------------공지사항 시작-------------------- --%>
	<ul id="notice_ticker">
		<c:forEach var="tick" items="${nList}">
			<li>[NOTICE]<a href="/TeamProject/nView?num=${tick.board_num}">${tick.board_title}</a>&nbsp;&nbsp;
				${tick.board_id}[관리자]
			</li>
		</c:forEach>
	</ul>
	<%----------------------공지사항 끝-------------------- --%>
	<%----------------------베스트게시물 시작-------------------- --%>
	<table class="best_table">
		<caption class="neons">
			<h1>Best Board</h1>
		</caption>
		<tr>
			<th>분류</th>
			<th>제목</th>
			<th>작성자</th>
			<th>추천수</th>
		</tr>
		<c:if test="${!empty list}">
			<c:forEach var="ob" items="${list}">
				<c:if test="${ob.board_code!='n'}">
					<tr>
						<c:if test="${!empty logOK}">
							<c:if test="${ob.board_code=='p'}">
								<td>[PARTY]</td>
								<td><a
									href="/TeamProject/partyView?num=${ob.board_num}&pg=1">${ob.board_title}</a></td>
							</c:if>
							<c:if test="${ob.board_code=='F'}">
								<td>[FREE]</td>
								<td><a
									href="/TeamProject/freeview.do?num=${ob.board_num}&pg=1">${ob.board_title}</a></td>
							</c:if>
							<c:if test="${ob.board_code=='3'}">
								<td>[FREE]</td>
								<td><a
									href="/TeamProject/picImage?board_num=${ob.board_num}">${ob.board_title}</a></td>
							</c:if>
						</c:if>
						<c:if test="${empty logOK}">
							<c:if test="${ob.board_code=='p'}">
								<td>[PARTY]</td>
								<td>${ob.board_title}</td>
							</c:if>
							<c:if test="${ob.board_code=='F'}">
								<td>[FREE]</td>
								<td>${ob.board_title}</td>
							</c:if>
							<c:if test="${ob.board_code=='3'}">
								<td>[GIF]</td>
								<td>${ob.board_title}</td>
							</c:if>
						</c:if>
						<td>${ob.board_id}</td>
						<td>${ob.board_rec}</td>
					</tr>
				</c:if>
			</c:forEach>
		</c:if>
	</table>
	<%-----------------------베스트게시물 끝 ----------------------%>
	<%---------------------롤링배너 시작 --------------------------------%>
	<div class="rollingbanner">
		<ul class="bannerbox">
			<li><a href="/TeamProject/evaluate.do?game=aion"><img src="game_poster/aion.png" alt="dw" /></a></li>
			<li><a href="/TeamProject/evaluate.do?game=diablo2"><img src="game_poster/dia.png" alt="dw" /></a></li>
			<li><a href="/TeamProject/evaluate.do?game=gta5"><img src="game_poster/gta.jpg" alt="dw" /></a></li>
			<li><a href="/TeamProject/evaluate.do?game=lol"><img src="game_poster/lol.jpg" alt="dw" /></a></li>
			<li><a href="/TeamProject/evaluate.do?game=overwatch"><img src="game_poster/overwatch.jpg" alt="dw" /></a></li>
			<li><a href="/TeamProject/evaluate.do?game=maple"><img src="game_poster/maple.jpg" alt="dw" /></a></li>
			<li><a href="/TeamProject/evaluate.do?game=starcraft"><img src="game_poster/star.jpg" alt="dw" /></a></li>
			<li><a href="/TeamProject/evaluate.do?game=wow"><img src="game_poster/wow.png" alt="dw" /></a></li>
			<li><a href="/TeamProject/evaluate.do?game=fifa4"><img src="game_poster/fifa.png" alt="dw" /></a></li>
			<li><a href="/TeamProject/evaluate.do?game=valhalla"><img src="game_poster/assassin.jpg" alt="dw" /></a></li>
		</ul>
	</div>
	<%---------------------롤링배너 끝 --------------------------------%>
	<hr>
	<%@include file="../footer.jsp"%>
</body>
</html>