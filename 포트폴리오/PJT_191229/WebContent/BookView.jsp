<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*,DB.DTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
	<h4>게시글 읽기</h4>
	[북코드] ${user.bcd }<br>
	[장르코드] ${user.fcd }
	[제목] ${user.title }<br>
	[작가] ${user.writer}<br>
	[출판사] ${user.publish}<br>
	[가격] ${user.price}<br>
	--------------------------------------------------------<br>
	<%-- <pre>${user.content }</pre><br><br> --%><!-- 입력태그를 그대로 보여주기위해 </pre> 사용한다. 안하면 치환 명령어를 서블릿에첨부해야함.  -->

	<a href='gomain'>[메인으로]</a>
	</form>
</body>
</html>