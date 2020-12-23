<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title> 댓글 수정 </title>
    
    <style type="text/css">
    	*{font-family: 'NeoDunggeunmo';}
        #wrap {
            width: 550px;
            margin: 0 auto 0 auto;
            text-align :center;
        }
    
        #commentUpdateForm{
            text-align :center;
        }
    </style>
    
    <script type="text/javascript">
    
        var httpRequest = null;
        
        // httpRequest 객체 생성
        function getXMLHttpRequest(){
            var httpRequest = null;
        
            if(window.ActiveXObject){
                try{
                    httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
                } catch(e) {
                    try{
                        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e2) { httpRequest = null; }
                }
            }
            else if(window.XMLHttpRequest){
                httpRequest = new window.XMLHttpRequest();
            }
            return httpRequest;    
        }
    
    
        function checkValue()
        {
            var form = document.forms[0];
            // 전송할 값을 변수에 담는다.    
            var comment_num = "${comment.comment_num}";
            var comment_boardnum = "${comment.comment_boardnum}";
            var comment_content = form.comment_content.value
            
            if(!comment_content)
            {
                alert("내용을 입력하세요");
                return false;
            }
            else{
                location.href="/TeamProject/commentRenewal.do?num="+comment_num+"&content="+comment_content+"&boardnum="+comment_boardnum;
            }
        }
        
    </script>
    
</head>
<body>
<div id="wrap">
    <br>
    <b><font size="5" color="gray">댓글수정</font></b>
    <hr size="1" width="550">
    <br>
 
    <div id="commentUpdateForm">
        <form name="updateInfo" target="parentForm">        
            <textarea rows="7" cols="70" name="comment_content">${comment.comment_content}</textarea>
            <br><br>
            <input type="button" value="등록" onclick="checkValue()">
            <input type="button" value="창닫기" onclick="window.close()">
        </form>
    </div>
</div>    
</body>
</html>