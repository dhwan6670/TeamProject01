<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="../style.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Ref Update Form</title>
<style>
table{font-family: 'NeoDunggeunmo';}
.ref_content {
	width: 500px;
	height: 70px;
	resize: none;
}
.rec_button{
	width: 80px;
	height: 70px;
	background: linear-gradient( to right, #ff6e7f, #bfe9ff );
}
textarea {
  border: 2px solid black;
  padding: 1rem 1rem;
  outline:none;
  min-height: 2em;
  border-image: url("data:image/svg+xml;charset=utf-8,%3Csvg width='100' height='100' viewBox='0 0 100 100' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cstyle%3Epath%7Banimation:stroke 5s infinite linear%3B%7D%40keyframes stroke%7Bto%7Bstroke-dashoffset:776%3B%7D%7D%3C/style%3E%3ClinearGradient id='g' x1='0%25' y1='0%25' x2='0%25' y2='100%25'%3E%3Cstop offset='0%25' stop-color='%232d3561' /%3E%3Cstop offset='25%25' stop-color='%23c05c7e' /%3E%3Cstop offset='50%25' stop-color='%23f3826f' /%3E%3Cstop offset='100%25' stop-color='%23ffb961' /%3E%3C/linearGradient%3E %3Cpath d='M1.5 1.5 l97 0l0 97l-97 0 l0 -97' stroke-linecap='square' stroke='url(%23g)' stroke-width='3' stroke-dasharray='388'/%3E %3C/svg%3E") 1;
}
</style>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function() {
	$("#submit").click(function() {
		var sendData = "pseq="+$(".ref_pseq").val()+"&num="+$(".ref_num").val()+"&content="+encodeURI($(".ref_content").val());
		
		$.post(
			"/TeamProject/partyRefUpdate",
			sendData,
			function(data) {
				alert('수정하였습니다');
				self.close();
				window.opener.document.location.reload();
			});
	});
});
</script>
</head>
<body>
<form>
<table>
	<tr>
		<td>${rf.ref_id}님 댓글을 수정해주세요.</td>
	</tr>
	<tr>
		<td><textarea placeholder="${rf.ref_content}" class="ref_content" class="d"></textarea></td>
		<td>
			<input type="button" value="UPDATE" id="submit" class="rec_button"/>
			<input type="hidden" class="ref_num" value="${rf.ref_num}"/>
			<input type="hidden" class="ref_pseq" value="${rf.ref_pseq}"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>