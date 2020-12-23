<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../menu.jsp"/>
<style>
	*{font-family: 'NeoDunggeunmo';}
	.pic {
		width:76%;
		margin-left:auto;
		margin-right:auto;
		margin-top:auto;
		margin-bottom:auto;
	}
	caption {
		margin-top:100px;
		margin-bottom:50px;
	}
	td {
		padding:20px;
		text-align:center;
		font-size:20px;
		line-height:35px;
	}
	.eval {
		width:750px;
		margin-left:auto;
		margin-right:auto;
		margin-top:auto;
		margin-bottom:auto;
		border-collapse:collapse;
		font-size:18px;
	}
	.wrap {
		height: 100%;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.write {
		width: 140px;
		height: 45px;
		font-size: 18px;
		text-transform: uppercase;
		letter-spacing: 2.5px;
		font-weight: 500;
		color: #000;
		background-color: #fff;
		border: none;
		border-radius: 45px;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		transition: all 0.3s ease 0s;
		cursor: pointer;
		outline: none;
  	}

	.write:hover {
		background-color: #00008b;
		box-shadow: 0px 15px 20px rgba(26, 109, 255, 0.4);
		color: #ffd700;
		transform: translateY(-7px);
	}
	.font {
		font-size:20px;
	}
	
	.cont{
		width: 93%;
		max-width: 350px;
		text-align: center;
		margin: 4% auto;
		padding: 30px 0;
		background: #111;
		color: #EEE;
		border-radius: 5px;
		border: thin solid #444;
		overflow: hidden;
	}

	hr{
		margin: 20px;
		border: none;
		border-bottom: thin solid rgba(255,255,255,.1);
	}

	div.title{
		font-size: 2em;
	}

	h1 span{
		font-weight: 300;
		color: #Fd4;
	}

	div.stars{
		width: 345px;
		display: inline-block;
	}

	input[type=radio]{
		display: none;
	}

	label.star {
		float: right;
		padding: 10px;
		font-size: 36px;
		color: #444;
		transition: all .2s;
	}

	input.star:checked ~ label.star:before {
		content:'\f005';
		color: #FD4;
		transition: all .25s;
		font-weight:800;
	}


	input.star-5:checked ~ label.star:before {
		color:#FE7;
		text-shadow: 0 0 20px #952;
	}

	input.star-1:checked ~ label.star:before {
		color: #F62;
	}

	label.star:hover{
		transform: rotate(-15deg) scale(1.3);
	}

	label.star:before{
		content:'\f006';
		font-family: FontAwesome;
		font-weight:800;
	}

	.rev-box{
		overflow: hidden;
		height: 0;
		width: 100%;
		transition: all .25s;
	}

	textarea.review{
		background: #222;
		border: none;
		width: 100%;
		max-width: 100%;
		height: 100px;
		padding: 10px;
		box-sizing: border-box;
		color: #EEE;
	}

	label.review{
  		display: block;
		transition:opacity .25s;
	}



	input.star:checked ~ .rev-box{
		height: 125px;
		overflow: visible;
	}

	@import url(https://fonts.googleapis.com/css?family=Roboto:500,100,300,700,400);
</style>
<script>
var httpRequest=null;
function writeEval(){
	var form=document.getElementById("evalform");
	var name=form.eval_name.value;
	var game=form.eval_game.value;
	var content=form.eval_content.value;
	var star=form.star.value;
	
	if(!content){
		alert("내용을 입력해주세요.");
		return false;
	}else{
		location.href="/TeamProject/evaluatewrite.do?name="+name+"&game="+game+"&star="+star+"&content="+content;
	}
}
function updateOpen(num){
	window.name="parentForm"
	window.open("evaluateupdate.do?num="+num,"updateForm","width=500px,height=400px,resizable=no,scrollbars=no")
}
</script>
<br><br><br><br>
<c:if test="${requestScope.same!=null}"><script>alert("한줄평은 되도록 한번씩만 써주세요!");<%request.removeAttribute("same");%></script></c:if>
<c:set var="dto" value="${requestScope.dto}"/>
<table class="pic">
	<caption><h1>World of Warcraft</h1></caption>
	<tr>
		<td><img src="./game_poster/wow.png"></td>
	</tr>
	<tr>
		<td>평균 별점 <c:if test="${dto.eval_avg!=null}">: ${dto.eval_avg}</c:if><br>
			<c:choose>
				<c:when test="${dto.eval_avg<0.75}"><img src="./images/0.5.png" width=424px; height=72px;></c:when>
				<c:when test="${dto.eval_avg<1.25}"><img src="./images/1.png" width=424px; height=72px;></c:when>
				<c:when test="${dto.eval_avg<1.75}"><img src="./images/1.5.png" width=424px; height=72px;></c:when>
				<c:when test="${dto.eval_avg<2.25}"><img src="./images/2.png" width=424px; height=72px;></c:when>
				<c:when test="${dto.eval_avg<2.75}"><img src="./images/2.5.png" width=424px; height=72px;></c:when>
				<c:when test="${dto.eval_avg<3.25}"><img src="./images/3.png" width=424px; height=72px;></c:when>
				<c:when test="${dto.eval_avg<3.75}"><img src="./images/3.5.png" width=424px; height=72px;></c:when>
				<c:when test="${dto.eval_avg<4.25}"><img src="./images/4.png" width=424px; height=72px;></c:when>
				<c:when test="${dto.eval_avg<4.75}"><img src="./images/4.5.png" width=424px; height=72px;></c:when>
				<c:when test="${dto.eval_avg eq 4.75}"><img src="./images/4.5.png" width=424px; height=72px;></c:when>
				<c:when test="${dto.eval_avg>4.75}"><img src="./images/5.png" width=424px; height=72px;></c:when>
				<c:otherwise><img src="./images/0.png" width=424px; height=72px;></c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td>블리자드 엔터테인먼트에서 간판 게임인 워크래프트 세계관을 바탕으로<br>
		최초로 개발한 MMORPG. 약칭 와우(WoW). 2020년 11월 23일,<br>
		8번째 확장팩 어둠땅(Shadowlands)을 출시하여 선풍적인 인기를 끌고 있다.<br>
		어둠땅에서 유저들은 죽은 자의 영역을 탐험할 수 있게 된다.</td>
	</tr>
</table>
<c:set var="log" value="${sessionScope.logOK}"/>

<c:if test="${log.member_name!=null}">
	<table class="eval">
		<tr>
		<form id="evalform">
			<td>
				${log.member_name}
				<input type="hidden" name="eval_game" value="wow">
				<input type="hidden" name="eval_name" value="${log.member_name}">
			</td>
			<td>
				<div class="cont">
				<div class="stars">
  					<input class="star star-5" id="star-5-2" type="radio" name="star" value="5"/>
  					<label class="star star-5" for="star-5-2"><img src="./images/star.jpg"></label>
  					<input class="star star-4" id="star-4-2" type="radio" name="star" value="4"/>
  					<label class="star star-4" for="star-4-2"><img src="./images/star.jpg"></label>
  					<input class="star star-3" id="star-3-2" type="radio" name="star" value="3"/>
  					<label class="star star-3" for="star-3-2"><img src="./images/star.jpg"></label>
  					<input class="star star-2" id="star-2-2" type="radio" name="star" value="2"/>
  					<label class="star star-2" for="star-2-2"><img src="./images/star.jpg"></label>
  					<input class="star star-1" id="star-1-2" type="radio" name="star" value="1"/>
  					<label class="star star-1" for="star-1-2"><img src="./images/star.jpg"></label>
  					<div class="rev-box">
    				<textarea class="review" col="30" name="eval_content"></textarea>
    				<label class="review" for="review">Breif Review</label>
  					</div>
				</div>
				</div>			
			</td>
			<td>
				<div class="wrap"><input type="button" class="write" value="한줄평 등록" onclick="writeEval()"></div>
			</td>
		</form>
		</tr>
	</table>
</c:if>
<br><br>
<c:if test="${requestScope.list!=null}">
	<c:forEach var="eval" items="${requestScope.list}">
		<table class="eval">
			<tr>
				<td width="150">
					${eval.eval_name}<br>
					<span style='text-color:gray'><fmt:formatDate value="${eval.eval_date}" pattern="yy.MM.dd"/></span>
				</td>
				<td width="500">
					<c:if test="${eval.eval_star==1}">
						<img src="./images/1.png" width=106px; height=18px;>
					</c:if>
					<c:if test="${eval.eval_star==2}">
						<img src="./images/2.png" width=106px; height=18px;>
					</c:if>
					<c:if test="${eval.eval_star==3}">
						<img src="./images/3.png" width=106px; height=18px;>
					</c:if>
					<c:if test="${eval.eval_star==4}">
						<img src="./images/4.png" width=106px; height=18px;>
					</c:if>
					<c:if test="${eval.eval_star==5}">
						<img src="./images/5.png" width=106px; height=18px;>
					</c:if>
					<br>
					${eval.eval_content}
				</td>
				<td width="100">
					<c:if test="${eval.eval_name==log.member_name}">
						<input type="button" value="수정" onclick="updateOpen(${eval.eval_num})"><br>
						<input type="button" value="삭제" onclick="if(confirm('삭제하시겠습니까?')){location.href='evaluatedelete.do?num=${eval.eval_num}&game=${eval.eval_game}'}">
					</c:if>
				</td>
			</tr>
		</table>
	</c:forEach>
</c:if>
<%@include file="../footer.jsp"%>
</body>
</html>