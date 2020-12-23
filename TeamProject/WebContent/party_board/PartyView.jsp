<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="../style.css" rel="stylesheet">
<c:import url="../menu.jsp"/>
<style>
*{font-family: 'NeoDunggeunmo';}
a{
	text-decoration: none;
}
#view_textarea{
	border: 0;
	background-color:#e9ecef;
	border-radius: 30px 30px 30px 30px;
	resize: none;
	outline-style: none;
	padding: 13px;
	font-size: 12px;
	width: 600px;
	height: 150px;
	overflow: auto;
}	
#view_table{
	border: 0;
	width: 600px;
	margin-bottom: 20px;
	margin-left: auto;
	margin-right: auto;
	font-size: 20px;
	font-weight: bold;
	border-left: 1px solid #ced4ea;
	border-right: 1px solid #ced4ea;
	}
#ref_table{
	border: 0;
	width: 600px;
	margin-bottom: 20px;
	margin-left: auto;
	margin-right: auto;
	font-size: 20px;
	font-weight: bold;
}
#after_login{
	width: 600px;
	height: 80px;
	margin-left: auto;
	margin-right: auto;
}
.view_right_left{margin-bottom: 12px;}
#view_right_content{
font-size: 20px;
font-weight: bold;
border-radius: 30px 30px 30px 30px;
padding: 13px;

}
#view_left_content{
font-size: 20px;
font-weight: bold;
border-radius: 30px 30px 30px 30px;
padding: 13px;
}
h1{
	font-family: 'NeoDunggeunmo',cursive;
	margin: 0 0 0.5em 0;
	text-align: center;
}
.view_a {
	width: 600px;
	font-size: 20px;
}

.view_b {
	width: 290px;
	font-size: 20px;	
}
.party_content{
	height: 300px;
	width: 600px;
	font-size: 18px;
}
.view_textarea{
	height: 150px;
	width: 600px;
	font-size: 18px;
}
.ref_bottom{
	font-size: 14px;
}
.insert_ref{
	width: 600px;
	margin-left: auto;
	margin-right: auto;
}
.party_btn{
	width: 100%;
	height: 30px;
}
textarea {
  border: 2px solid black;
  padding: 1rem 1rem;
  overflow:auto;
  resize:none;
  outline:none;
  min-height: 2em;
  border-image: url("data:image/svg+xml;charset=utf-8,%3Csvg width='100' height='100' viewBox='0 0 100 100' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cstyle%3Epath%7Banimation:stroke 5s infinite linear%3B%7D%40keyframes stroke%7Bto%7Bstroke-dashoffset:776%3B%7D%7D%3C/style%3E%3ClinearGradient id='g' x1='0%25' y1='0%25' x2='0%25' y2='100%25'%3E%3Cstop offset='0%25' stop-color='%232d3561' /%3E%3Cstop offset='25%25' stop-color='%23c05c7e' /%3E%3Cstop offset='50%25' stop-color='%23f3826f' /%3E%3Cstop offset='100%25' stop-color='%23ffb961' /%3E%3C/linearGradient%3E %3Cpath d='M1.5 1.5 l97 0l0 97l-97 0 l0 -97' stroke-linecap='square' stroke='url(%23g)' stroke-width='3' stroke-dasharray='388'/%3E %3C/svg%3E") 1;
}
.all{
border: 2px solid black;
border-image: url("data:image/svg+xml;charset=utf-8,%3Csvg width='100' height='100' viewBox='0 0 100 100' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cstyle%3Epath%7Banimation:stroke 5s infinite linear%3B%7D%40keyframes stroke%7Bto%7Bstroke-dashoffset:776%3B%7D%7D%3C/style%3E%3ClinearGradient id='g' x1='0%25' y1='0%25' x2='0%25' y2='100%25'%3E%3Cstop offset='0%25' stop-color='%232d3561' /%3E%3Cstop offset='25%25' stop-color='%23c05c7e' /%3E%3Cstop offset='50%25' stop-color='%23f3826f' /%3E%3Cstop offset='100%25' stop-color='%23ffb961' /%3E%3C/linearGradient%3E %3Cpath d='M1.5 1.5 l97 0l0 97l-97 0 l0 -97' stroke-linecap='square' stroke='url(%23g)' stroke-width='3' stroke-dasharray='388'/%3E %3C/svg%3E") 1;
}
</style>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

$(function() {
	$("#rec_btn").click(function() {
		var sendData="no="+$(".party_num").val()+"&id="+$(".ref_id").val();
		$.ajax({
			url:"/TeamProject/partyRecUpdate",
			type:"POST",
			data:sendData,
			success: function() {
				recCount();
			}
		});
	});
	function recCount() {
		var sendData="no="+$(".party_num").val();
		$.ajax({
			url:"/TeamProject/partyRecCount",
			type:"POST",
			data:sendData,
			success: function(count) {
				$(".rec_count").html(count);
			}
		});
	};
recCount();
	
});
function pop(url,name, w,h ) {
	 var winl = (screen.width - w) / 2;
	 var wint = (screen.height - h) / 2;
	 popup = window.open(url, name,'width='+w+',height='+h+', top='+wint+',left='+winl+', toolbars=no,menubars=no,scrollbars=no');
	 popup.focus();
}
</script>
<body>
<%--상단 테이블 시작 --%>
<table id="view_table">
<caption class="neons"><h1>Party Board View</h1></caption>
	<tr>
		<td align="left">${ob.board_num}번 글</td>
		<td align="right">[PARTY]</td>
	</tr>
	<tr>
		<td>ID<br> <input type="text" name="id" class="view_b"
			value="${ob.board_id}" readonly /></td>
		<td>NAME<br> <input type="text" name="name" class="view_b"
			value="${ob.board_name}" readonly /></td>
	</tr>
	<tr>
		<td colspan="2">TITLE<br> <input type="text"
			placeholder="제목을 입력해주세요" name="party_title" class="view_a"
			value="${ob.board_title}" readonly /></td>
	</tr>
	<tr>
		<td colspan="2">CONTENT<br> <textarea
				placeholder="내용을 입력해주세요" name="party_content" class="party_content" readonly>${ob.board_content}</textarea></td>
	</tr>
	<tr>
		<td colspan="2"><button type="button"
			onclick="location.href='/TeamProject/partyList?pg=${pg}'" class="party_btn" >LIST</button></td>
	</tr>
<%-- 작성자가 아닐시 안보이도록 예외처리 --%>
	<c:if test="${ob.board_id==logOK.member_id}">
	<tr>
		<%--수정버튼 클릭시 hidden객체들을 PartyUpdate.jsp로 보내버림 --%>
		<form action="party_board/PartyUpdate.jsp" method="post">
			<td>
				<input type="submit" value="UPDATE" class="party_btn">
				<input type="hidden" name="party_num" value="${ob.board_num}" readonly/>
				<input type="hidden" name="party_hit" value="${ob.board_code}" readonly/>
				<input type="hidden" name="party_id" value="${ob.board_id}" readonly/>
				<input type="hidden" name="party_name" value="${ob.board_name}" readonly/>
				<input type="hidden" name="party_title" value="${ob.board_title}"/>
				<input type="hidden" name="party_content" value="${ob.board_content}"/>
				<input type="hidden" name="pg" value="${pg}"/>
			</td>
		</form>
		<form action="/TeamProject/partyDelete" method="get">
			<td>
				<button type="submit" onclick="return confirm('삭제할까요?')" class="party_btn">DELETE</button>
				<input type="hidden" name="party_num" value="${ob.board_num}"/>
				<input type="hidden" name="pg" value="${pg}"/>
			</td>
		</form>	
	</tr>
	</c:if>
	<%--추천버튼 --%>
	<tr>
		<td colspan="2" align="center">
			<button id="rec_btn" class="rec_button">
				<span style="color: red; font-size: 30px">♥</span>
				<span class="rec_count" style="font-size: 30px"></span>
			</button>
		</td>
	</tr>
	<%--추천버튼 --%>
</table>
<%--상단 테이블 종료 --%>
<%--댓글리스트 시작 --%>
<div class="all" style="min-width:600px; max-width: 600px; min-height: 400px; max-height: 800px; overflow:auto; margin-left: auto; margin-right: auto;">
<c:forEach var="rf" items="${ref}"><!-- for -->
		<c:if test="${rf.ref_id!=logOK.member_id}"><!-- if -->
		<div style="width:55%; clear:right;" class="view_right_left">
			<div style="background-color:#e9ecef;" id="view_left_content">
				<pre>${rf.ref_content}</pre>
			</div>
			<span class="ref_bottom">
			<c:if test="${rf.ref_id==logOK.member_id}"><!-- if -->
				<a href="#" onclick="pop('/TeamProject/partyRefSearch?num=${rf.ref_num}&pg=${pg}','updateForm',650,200);">U</a>
				<a href="/TeamProject/partyRefDelete?num=${rf.ref_num}&pseq=${ob.board_num}&pg=${pg}" onclick="return confirm('삭제?')">D</a>
			</c:if><!-- if -->
				| ${rf.ref_id}&nbsp;님&nbsp;
				| <fmt:formatDate value="${rf.ref_date}" pattern="yyyy-MM-dd a HH:mm:ss"/>
			</span>
		</div>
		</c:if><!-- if -->
		<c:if test="${rf.ref_id==logOK.member_id}"><!-- if -->
		<div style="width: 52%; float:right;" class="view_right_left">
			<div style= "clear:both; background-color: #031230; color: white;" id="view_right_content">
				<pre>${rf.ref_content}</pre>
			</div>
			<span style="float: right;" class="ref_bottom">
				<fmt:formatDate value="${rf.ref_date}" pattern="yyyy-MM-dd a HH:mm:ss"/>&nbsp;|
				&nbsp;${rf.ref_id}&nbsp;님 |
				<c:if test="${rf.ref_id==logOK.member_id}">
				<a href="/TeamProject/partyRefDelete?num=${rf.ref_num}&pseq=${ob.board_num}&pg=${pg}" onclick="return confirm('삭제?')">D</a>
				<a href="#" onclick="pop('/TeamProject/partyRefSearch?num=${rf.ref_num}&pg=${pg}','updateForm',650,200);">U</a>
				</c:if><!-- if -->
			</span>
		</div>
		</c:if>	<!-- if -->	
</c:forEach><!-- for end -->
</div>
<%--댓글리스트 종료 --%>
<%--댓글 입력창 시작 --%>
<form method="post" action="/TeamProject/partyRefInsert">	
<table id="ref_table" border="1">
	<tr style="height: auto;" align="center">
		<td colspan="2"><textarea placeholder="댓글 입력" name="ref_content" class="view_textarea"></textarea></td>
		<td rowspan="2">
			<button type="submit" style="width: 50px; height: 120px;" class="party_btn">등록</button>
			<input type="hidden" name="ref_id" class="ref_id" value="${logOK.member_id}"/>
			<input type="hidden" name="ref_name" class="ref_name" value="${logOK.member_name}"/>
			<input type="hidden" name="ref_num" class="party_num" value="${ob.board_num}"/>
			<input type="hidden" name="pg" value="${pg}"/>
		</td>
	</tr>
	<tr style="height: auto;">
		<td>
			<span>${logOK.member_id} 님 환영합니다.</span>
		</td>
	</tr>
</table>
</form>
<%--댓글입력창 종료 --%>
</body>
</html>
