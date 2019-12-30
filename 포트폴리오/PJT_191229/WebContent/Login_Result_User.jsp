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
			alert("로그인이 완료되었습니다.")
			location.href="main.jsp";

		</script>
		<!-- 로그인완료 알람이 뜨면서 로그인 ,회원가입 네비에 로그아웃창 뜨는 메인페이지로 출력  -->
		<%}else{ %>
		<script>
			alert("로그인이 실패하였습니다. 다시 정보를 입력해주세요.")
			history.go(-1);
		</script>
		<!-- 로그인 실패 알람이 뜨면서 원래 메인페이지로 되돌아가기  -->
		<%} %>
</body>
</html>