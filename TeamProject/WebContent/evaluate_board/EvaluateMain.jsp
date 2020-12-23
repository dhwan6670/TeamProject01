<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../menu.jsp"/>
<style>
	*{font-family: 'NeoDunggeunmo';}
	table {
		width:76%;
		margin-left:auto;
		margin-right:auto;
		margin-top:auto;
		margin-bottom:auto;
	}
	caption {
		margin-top:100px;
		margin-bottom:50px;
		color: #ffd700;
		text-shadow: 0 0 5px #00008b, 0 0 10px #00008b, 0 0 15px #00008b, 0 0 20px #00008b, 0 0 25px #00008b, 0 0 30px #00008b, 0 0 35px #00008b, 0 0 40px #00008b, 0 0 45px #00008b, 0 0 50px #00008b, 0 0 75px #00008b;
	}
	td {
		padding:20px;
		text-align:center;
	}
	span {
		font-size:20px;
		margin-left:auto;
		margin-right:auto;
	}
</style>
<script>
function checkLogin(name,game){
	if(name=='null'){
		alert("먼저 로그인해주세요");
	}else{
		location.href="/TeamProject/evaluate.do?game="+game;
	}
	
}
</script>
<br><br><br><br>
<c:set var="entity" value="${sessionScope.logOK}"/>
<table>
<caption><h1>게임 인기순위</h1></caption>
  <tr>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','lol')"><img src="../game_poster/lol.jpg" width=210px; height=300px;></button><br><span>리그 오브 레전드</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','bag')"><img src="../game_poster/bag.jpg" width=210px; height=300px;></button><br><span>배틀그라운드</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','overwatch')"><img src="../game_poster/overwatch.jpg" width=210px; height=300px;></button><br><span>오버워치</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','fifa4')"><img src="../game_poster/fifa.png" width=210px; height=300px;></button><br><span>피파 온라인 4</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','maple')"><img src="../game_poster/maple.jpg" width=210px; height=300px;></button><br><span>메이플스토리</span></td>
  </tr>
  <tr>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','aion')"><img src="../game_poster/aion.png" width=210px; height=300px;></button><br><span>아이온</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','suddenattack')"><img src="../game_poster/sa.png" width=210px; height=300px;></button><br><span>서든어택</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','eternalreturn')"><img src="../game_poster/erbs.jpg" width=210px; height=300px;></button><br><span>영원회귀:블랙서바이벌</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','lostark')"><img src="../game_poster/la.jpg" width=210px; height=300px;></button><br><span>로스트아크</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','starcraft')"><img src="../game_poster/star.jpg" width=210px; height=300px;></button><br><span>스타크래프트</span></td>
  </tr>
</table>
<br><br>
<table>
<caption><h1>떠오르는 핫한 게임</h1></caption>
  <tr>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','cyberpunk')"><img src="../game_poster/cp.jpg" width=210px; height=300px;></button><br><span>사이버펑크 2077</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','valhalla')"><img src="../game_poster/assassin.jpg" width=210px; height=300px;></button><br><span>어쌔신크리드 발할라</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','lastofus2')"><img src="../game_poster/lou.png" width=210px; height=300px;></button><br><span>라스트 오브 어스 2</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','amongus')"><img src="../game_poster/amongus.jpg" width=210px; height=300px;></button><br><span>AMONG US</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','fallguys')"><img src="../game_poster/fg.jpg" width=210px; height=300px;></button><br><span>FALL GUYS</span></td>
  </tr>
  <tr>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','acnh')"><img src="../game_poster/animal.jpg" width=210px; height=300px;></button><br><span>모여봐요 동물의 숲</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','smm2')"><img src="../game_poster/smm.jpg" width=210px; height=300px;></button><br><span>슈퍼마리오 메이커 2</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','wow')"><img src="../game_poster/wow.png" width=210px; height=300px;></button><br><span>월드 오브 워크래프트</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','deathstranding')"><img src="../game_poster/ds.jpg" width=210px; height=300px;></button><br><span>데스 스트랜딩</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','gta5')"><img src="../game_poster/gta.jpg" width=210px; height=300px;></button><br><span>GTA5</span></td>
  </tr>
</table>
<br><br>
<table>
<caption><h1>고전 명작게임</h1></caption>
  <tr>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','diablo2')"><img src="../game_poster/dia.png" width=210px; height=300px;></button><br><span>디아블로 2</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','pokemon')"><img src="../game_poster/pr.jpg" width=210px; height=300px;></button><br><span>포켓몬스터 1세대</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','princessmaker2')"><img src="../game_poster/pm.png" width=210px; height=300px;></button><br><span>프린세스 메이커 2</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','hwansechwihojeon')"><img src="../game_poster/hwanse.jpg" width=210px; height=300px;></button><br><span>환세취호전</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','dd')"><img src="../game_poster/dd.jpg" width=210px; height=300px;></button><br><span>던전 앤 드래곤즈</span></td>
  </tr>
  <tr>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','doom')"><img src="../game_poster/doom.jpg" width=210px; height=300px;></button><br><span>DOOM</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','rollercoastertycoon')"><img src="../game_poster/rct.jpg" width=210px; height=300px;></button><br><span>롤러코스터 타이쿤</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','farlandtactics2')"><img src="../game_poster/ft.jpg" width=210px; height=300px;></button><br><span>파랜드 택틱스 2</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','rayman')"><img src="../game_poster/rm.jpg" width=210px; height=300px;></button><br><span>레이맨</span></td>
    <td><button type="button" onclick="checkLogin('${entity.member_name}','ttt')"><img src="../game_poster/ttt.jpg" width=210px; height=300px;></button><br><span>철권 태그 토너먼트</span></td>
  </tr>
</table>
</body>
</html>