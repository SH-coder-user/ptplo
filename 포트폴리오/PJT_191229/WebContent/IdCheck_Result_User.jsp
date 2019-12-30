<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.util.*,DB.DTO" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%if(request.getAttribute("result").equals("true")){
		%>
		<script>
			alert("중복되는 아이디입니다. 다른아이디를 입력해주세요.")
			history.go(-1);
			
		</script>
		
		<%}else{ %>
		
		 <script>
			alert("가입 가능한 id입니다.")
			history.go(-1);
		</script> 
		
		<%} %>
</body>
</html>