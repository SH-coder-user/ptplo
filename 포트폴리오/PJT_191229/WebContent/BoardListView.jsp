<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*,DB.DTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.button{
	padding:10px; margin-left:500px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>게시판 목록 보기</h3>
	<button class=button onclick="location.href='Go_BoardWrite.jsp'">글쓰기</button>
	<table border=1>
		<tr><td width=40>순번${param.rowcnt }</td><!-- param은 명령형식 -->
		<td width=300>제목</td>
		<td width=50>조회수</td>
		<td width=80>작성자</td>
		<td width=90>작성일자</td>
		<td width=90>수정일자</td>
		<%
			List<DTO> boardlist = (List)request.getAttribute("list");
			
			for(int i = 0; i<boardlist.size();i++){
				DTO board = (DTO)boardlist.get(i);
				out.print("<tr><td>"+board.getBno()+"</td>");
				out.print("<td><a href='board-read?SEQ_NO="+board.getBno()+"'>"+board.getTitle()+"</td>");
				out.print("<td align=center text-align=center>"+board.getCnt()+"</td>");
				out.print("<td>"+board.getWriter()+"</td>");
				out.print("<td>"+board.getRegdate()+"</td>");
				out.print("<td>"+board.getUpdatedate()+"</td></tr>");
			}
		%>
	</table>
	
	<table>
	<tr>
		<td width = "600" align= "center">
		<%
			int rowcnt = (int)request.getAttribute("rowcnt");
			for(int pcnt = 1; pcnt<=rowcnt;pcnt++){%>
			<a href = 'board-list?SEQ_NO=<%=pcnt %>'>[<%=pcnt %>]</a>
			<%} %>
		</td>
		</tr>
	</table>
</body>
</html>