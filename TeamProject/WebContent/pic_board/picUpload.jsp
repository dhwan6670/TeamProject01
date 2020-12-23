
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../menu.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드</title>
</head>
<body>

<%
   //String realFolder = "D:/Java/workspace_import/TeamProject/TeamProject/WebContent/WEB-INF/upload";//파일 업로드 경로의 절대 경로
   
   //파일 업로드 경로(상대경로)
   String saveFolder = "/storage";
   String encType = "utf-8";//인코딩 타입
   int maxSize = 5*1024*1024;//파일의 최대 업로드 사이즈, 5Mb
   
   //파일 업로드 절대경로 구하기
  // String realFolder = application.getRealPath(saveFolder);
  // String realFolder = ("../WEB-INF/upload/");
   String realFolder = getServletContext().getRealPath(saveFolder);
  //out.println("실제 저장 경로 : " + realFolder + "<br>");
  // out.println("--------------------------------------<br>");
                                             //절대경로     
   MultipartRequest multi = new MultipartRequest(request, realFolder,
                                       maxSize, //파일 최대의 업로드 사이즈
                                       encType, //인코딩 타입
                                       new DefaultFileRenamePolicy()//이미 업로드된 파일과 동일한 파일명일 경우 파일명 교체
                                       );
  // out.println("--------------------------------------<br>");

   //파일 정보 처리
   //전송전 원래의 파일 이름 반환
   String original = multi.getOriginalFileName("board_content2");
   //서버에 저장된 파일 이름 반환
   String filename = multi.getFilesystemName("board_content2");
   //전송됨 파일의 컨텐트 타입
   String type = multi.getContentType("board_content2");
   //out.println(original);
   String filepath=realFolder +"/" + original;
   //System.out.println("filepath:" + filepath);
   
   //out.println("전송전 원래의 파일 이름 : " + realFolder+"\\"+original + "<br>");
  // out.println("서버에 저장된 파일 이름 : " + filename + "<br>");
  // out.println("컨텐트 타입 : " + type + "<br>");
  // String s=realFolder+"\\"+original;
    
   //파일의 용량 구하기
   File file = multi.getFile("board_content2");
   if(file!=null){
     // out.println("파일 용량 : " + file.length() + "bytes");
   }
%> <br><br>
<!-- <img src="/TeamProject/storage/<%=original%>" width="50px" height="50px"  alt="coffee.jpg">  -->

<%-- <img src="http://localhost:8080/tmp0/wtpwebapps/TeamProject/upload/<%=filename%>"> --%>
<!-- <img src='D:/Java/workspace_import/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/TeamProject/upload/coffee.jpg' > -->
<!-- <img src="D:/Java/workspace_import/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/TeamProject/WEB-INF/upload/캡쳐.png"> -->
<!-- <img src="./../../../.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/TeamProject/WEB-INF/upload/출첵5.png"> -->

<div align="center">
<br/><br/>
<table width="600" cellpadding="3">
	<tr>
		<td bgcolor="84F399" height="25" align="center">글쓰기</td>
	</tr>
</table>
<br/>
<form method="post" action="/TeamProject/picInsert">

<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table style="text-align:center;">
			<tr>
				<td width="15%">이름</td>
				<td width="90%">
				<input name="board_name"  size="10" maxlength="8" value="${logOK.member_name}" readonly="true"/></td>
			</tr>
			<tr>
				<td width="15%">아이디</td>
				<td width="90%">
				<input name="board_id" size="10" maxlength="8" value="${logOK.member_id}" readonly="true"/></td>
			</tr>
			<tr>
				<td>제 목</td> 
				<td>
				<input name="board_title"  size="50" maxlength="30"/></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea name="board_content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>파일 이름</td>
				<td><input name="board_content2" value="<%=filename%>" readonly="true"></td>
			</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2">
					 <input type="submit" value="글 등록" id="insertSubmit">
					 <input type="reset" value="다시쓰기">
					 <input type="button" value="리스트" onClick="javascript:location.href='/TeamProject/picList?pg=1'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</div>

</body>
</html>