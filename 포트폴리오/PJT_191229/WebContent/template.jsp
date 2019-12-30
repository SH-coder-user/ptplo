<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%String session_id = (String)session.getAttribute("id");
    	String session_name = (String)session.getAttribute("name");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="common.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<Style>.aside{text-align:center;}
	.bg{background-image:url('dd.jpg');
	background-repeat : no-repeat;
	background-position:center;
	background-attachment : local;
	}</Style>

	

<title>Mainpage</title>
</head>
<body class='bg'>
	<div class=header><h1 id=hd>Sung's library</h1></div>
	<div class=nav><ul class="right">
						<li><a href="#" >Search</a>
<% 
							if(session_name ==null){
%>
						
							<ul class="submenu">
								<li><a href="goalert">Genre</a></li>
								<li><a href="goalert">Codes</a></li>
								<li><a href="goalert">Board</a></li>
							</ul>
							
<%
							}else{
%>
							<ul class="submenu">
								<li><a href="#">Genre</a></li>
								<li><a href="gofindbook">Codes</a></li>
								<li><a href="board-list">Board</a></li>
							</ul>
							
<%							
							} 
%>
						</li>
						<li><a href="#" >Menu2</a>
							<ul class="submenu">
								<li><a href="#">반납도서</a></li>
								<li><a href="#">미납확인</a></li>
							</ul>
						</li>
						
						<li><a href="#" >Menu3</a></li>
						<li><a href="gomain" >Home</a></li>
						</ul>
						
						<ul>
	
						<% 
							if(session_name ==null){
						%>
							<li><a href="go-login">로그인</a></li>
							<li><a href="go-input">회원가입</a></li>
						<%
							}else{
						%>
							<li><a href="go-logout">
							<%= session_name  %> 님 로그아웃</a></li>
						<%} %>
						</ul>
						
						</div>
	<div class="container">
		<div class=section><h2>I am section</h2>
						<jsp:include page="${target }.jsp"/></div>
		<div class=aside>
						<input id="first" type="radio" name="tab" checked=checked/>
						<input id="second" type="radio" name="tab"/>
							<div class="buttons">
								<label for="first">First</label>
								<label for="second">Second</label>
							</div>
							<div class='item'>
								<ul>
									<li class="itemt"><a href="#"><br>
									<img src="http://placehold.it/150x100" /><br>
									MENU a</a></li>
									<li class="itemt"><a href="#"><br>
									<img src="http://placehold.it/150x100" /><br>
									MENU b</a></li>
									<li class="itemt"><a href="#"><br>
									<img src="http://placehold.it/150x100" /><br>
									MENU c</a></li>
									<li class="itemt"><a href="#"><br>
									<img src="http://placehold.it/150x100" /><br>
									MENU d</a></li>
								</ul>
							</div>
							<div class='item2'>
								<ul>
									<li class="itemt"><a href="#"><br>
									<img src="http://placehold.it/150x100" /><br>
									MENU E</a></li>
									<li class="itemt"><a href="#"><br>
									<img src="http://placehold.it/150x100" /><br>
									MENU F</a></li>
									<li class="itemt"><a href="#"><br>
									<img src="http://placehold.it/150x100" /><br>
									MENU G</a></li>
									<li class="itemt"><a href="#"><br>
									<img src="http://placehold.it/150x100" /><br>
									MENU H</a></li>
								</ul>
							</div>
		</div>
	</div>
	
	<div class=footer><p>· 주소 : 서울 용산구 원효로 123-4 A동 101호</p>
<p>· 대표번호 : 1234-1234 | FAX번호 : 02-123-123 | 대표이사 : 홍길동 | 통신판매신고번호 : 용산 00239</p>
<p>· (주)홍길동컴퍼니 사업자등록번호 : 123-12-12345 | 개인정보관리책임자 : 김기말 | 이메일 : webpjt@nate.com</p>
<p>· Copyright(c) 2020 홍길동컴퍼니 . All rights reserved.</p>
	</div>
</body>
</html>