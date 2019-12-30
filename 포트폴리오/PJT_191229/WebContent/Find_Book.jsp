<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function chke(){
		if(!fm.bcd.value){
			alert("입력이 되지 않았습니다. 다시 입력해주세요.");
			document.fm.bcd.focus();
			return false;
		}
		return true;
	}
	window.onload= function(){
		<%
		/* System.out.print((String)request.getAttribute("result")); */
		if(request.getAttribute("result")!=null){
		%>
		alert("해당 도서는 없는 도서입니다. 다시 입력해주세요.");
		location.href="gofindbook";
		<%};%>
	
	}
</script>
</head>
<body>
 	<form action = "booksearch" name="fm" onsubmit="return chke()" >
 		<p>찾을 책을 코드명으로 입력</p>
 		<input type= text maxlength=4 name=bcd placeholder="101" >
 		<input type= submit value= "찾기">
 	</form>
</body>
</html>