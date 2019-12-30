<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	//회원가입창의 아이디 입력란의 값을 가져온다.
 	 function pValue(){
		document.getElementById("id").value = opener.fm.id.value;
	} 
	//사용하기클릭시 부모창으로 값 전달
	function sendCheckValue(){
		//중복체크 결과인 idCheck 값을 전달한다.
		opener.fm.ifIdCheck.value = "yes";
		//회원가입 화면의 ID입력란에 값을 전달
		opener.fm.id.value = document.getElementById("id").value;
		if(opener !=null){
			opener.chkForm = null;
			window.close();
		}
	}
</script>
</head>
<body onload="pValue()">
	
	<form action = "check-id">
		<table>
		<tr><td colspan=2 align=center><h3>중복확인</h3></td><tr>
			<tr><td>아이디입력</td>
				<td><input type =text name =id id= id maxlength=50></td></tr>
			<tr><td colspan = 2><input type=submit value="확인하기" name= check-id>
								<input type=button value= "사용하기" onclick ='sendCheckValue()'>
								<input type=button value="취소하기" onclick="window.close()"></td></tr>
		
		</table>
	</form>
</body>
</html>