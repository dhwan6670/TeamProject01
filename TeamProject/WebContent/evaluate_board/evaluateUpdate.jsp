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
		  width: 100%;
		  max-width: 350px;
		  text-align: center;
		  margin: 4% auto;
		  padding: 30px 0;
		  background: #111;
		  color: #EEE;
		  border-radius: 5px;
		  border: thin solid #444;
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
		  width: 333px;
		  display: inline-block;
		}
		
		input.star{
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
    
    
        function updateEval()
        {
            var form = document.forms[0];
            // 전송할 값을 변수에 담는다.    
            var eval_num = "${dto.eval_num}";
            var eval_star = form.star.value;
            var eval_content = form.eval_content.value;
            
            if(eval_star<1)
            {
                alert("별점을 주세요!");
                return false;
            }
            else{
                location.href="/TeamProject/evaluaterenewal.do?num="+eval_num+"&star="+eval_star+"&content="+eval_content;
            }
        }
        
    </script>
    
</head>
<body>
<c:set var="dto" value="${requestScope.dto}"/>
	<table>
		<tr>
		<form id="evalform">
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
				    <textarea class="review" col="30" name="eval_content">${dto.eval_content}</textarea>
				    <label class="review" for="review">Breif Review</label>
				  </div>
				</form>
				</div>
				</div>			
			</td>
			<td>
				<div class="wrap"><input type="button" class="write" value="수정" onclick="updateEval()"></div><br>
				<div class="wrap"><input type="button" class="write" value="창 닫기" onclick="window.close()"></div>
			</td>
		</form>
		</tr>
	</table>    
</body>
</html>