<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action =board-save method ="post">
	<table>
	<tr><td>작성자</td>
	<td><input type ="text" name= "writer"></td></tr>
	
	<tr><td>제	목</td>
	<td><input type = text name ="title" size = "60" maxlength="60" ></td></tr>
	
	<tr><td>내	용</td>
	<td><textarea cols="65" rows=10 name="content" maxlength="2000"></textarea></td></tr>
	
	<tr><td colspan=2 align=center><a href="board-list"><input type = "button" value="목록으로"></a>
	<input type = "submit" value="전송"></td>
	</table>
	</form> 
</body>
</html>