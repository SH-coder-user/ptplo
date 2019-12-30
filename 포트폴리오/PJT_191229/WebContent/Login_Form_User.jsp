<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#fm{text-align:center;	}

	input{size:20px;}
</style>	
	 <script>
		function oncheck(){
			if(!fm.id.value){
				alert("아이디를 입력해주세요.");
				document.fm.id.focus();
				return false;
			}

			if(!fm.pass.value){
				alert("비밀번호를 입력해주세요.");
				document.fm.pass.focus();
				return false;
			}
			
			return true;
			}
		

	</script>
</head>
<body>
	<form action ="Login_Process" id='fm' name="fm" target="_top" onsubmit="return oncheck()">
		<label for ="id"><span>아이디&nbsp;&nbsp;&nbsp;</span></label>
		<input type = "text" name="id" id= "id" /><br>
		<label for="pass">비밀번호</label>
		<input type = "password" name="pass" id= "pass" /><br>
		<input type="submit" value="로그인"/>
		<button type="button" onclick="location.href='go-input' ">회원가입</button>
	</form>

</body>
</html>