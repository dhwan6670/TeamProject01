<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="../menu.jsp"/>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
var board_num = ${board.board_num};
$(document).ready(function(){
	picCommList();
	$('#submit_comment').click(function(){
		if($('#pic_comment').val()==''){
			alert('댓글 내용을 입력해주세요!');
			return;
		}
		$.ajax({
			url:'/TeamProject/picCommInsert?board_num=${board.board_num}',
			type:'post',
			data:sendData,
			success: function(data){
				picCommList();
			},
			error:function(){
				alert('댓글 입력 네트워크 오류 발생!');
			}
		});
	});	
	function picCommList(){
		$.ajax({
			url:'/TeamProject/picCommList?board_num=${board.board_num}',
			type:'get',
			data:sendData,
			success:function(data){
				alert('댓글 호출 진입 성공');
				var a ='';
				$.each(data, function(index,item){
					a += '<tr>';
					a += '<td>item.pic_comment</td>';
					a += '<td>item.pic_com_date</td>';
					a += '</tr>';
				});
			},error:function(){
				alert('댓글 호출 네트워크 오류 발생!');
			}
			$('.commentList').html(a);
		});
	};
});
</script>

<style>
.PicView_Detail {
text-align: center;
font-family: 'NeoDunggeunmo';   
}

.pic_image{
	width: 200px;
	}

.PicView_Detail h1{
font-size: 50px;

}

.PicView_Detail hr{
margin-left: 10%;
width: 80%;
margin-bottom: 5px;
margin-top: 5px;
}

.PicComment{
width: 50%;
margin-left: 25%;

text-align: center;
}

#pic_comment{
width: 40%;
margin: 5px;
margin-bottom: 10px;
}


.Comment_table{
width: 100%;
}

#reco:hover{
cursor: pointer;
transform: scale(1.3);
}
</style>

<body>
<hr/>

<div class="PicView_Detail">
<br/>

<br/>
<h1>${board.board_title}</h1>  <h3>작성자:${board.board_id}</h3>
<br/>

<hr/>
<img alt="${board.board_content2}" src="/TeamProject/storage/${board.board_content2}" class="pic_image"><br>
<br/>
<a>내용 : ${board.board_content}</a>

<hr size="1">
<img src="./images/goodgood.png" height="30px;" width="30px" id="reco" onClick="location/href=''">
	<form id="commentbox" method="post" action="/TeamProject/picCommInsert?board_num=${board.board_num}&pg=${pg}">
		<input type="hidden" id="board_num" value="${board.board_num}">
		<input type="text" id="pic_comment" name="pic_comment" placeholder="댓글을 입력하세요.">
		<input type="submit" id="submit_comment" class="submit_comment" value="등록">
	</form>
<div id="commentForm" class="PicComment">
	<table border="1" class="Comment_table">
		<tr>
			<th width="80%">댓글 내용</th>
			<th>댓글 작성일</th>
		</tr>
		<c:forEach var="comment" items="${comment}">
			<c:if test="${empty comment.com_num}">
				<a>등록된 댓글이 없습니다.</a>
			</c:if>
			<c:if test="${!empty comment.com_num}">
				<tr>
					<td>${comment.pic_comment}</td>
					<td>${comment.pic_com_date}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</div>
</div>
</body>