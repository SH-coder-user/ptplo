<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String session_id = (String)session.getAttribute("id");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
//정규표현식 0이름    1암호     2전화번호(중간)  3전화번호(끝자리)	

	var regular = ['^[가-힣]{2,6}$', '^[a-zA-z0-9]{6,}$','^\\d{3,4}$','^\\d{4}$']
	function oncheck(){
	
			// 이름 체크
			if(!fm.name.value){ 
				alert('이름을 입력해주세요');
				fm.name.focus()
				return false;
			} else{
				if(!fm.name.value.match(regular[0])){
					alert('이름은 특수문자 제외하고 2글자 이상 6글자 이내의 "한글"로 작성하여 주십시오');
					fm.name.focus()
					return false;
				}
			}
			//아이디 체크
			if(!fm.id.value){
				alert('아이디를 입력해주십시오');
				fm.password.focus()
				return false;
				}
			
			if(fm.ifIdCheck.value !="yes"){
				alert('아이디를 중복체크 해주십시오');
				
				return false;
				}
			//아이디 입력창에 갑 입력시  hidden에 idUncheck를 세팅한다.
			//이렇게 하는 이유는 중복 체크 후 다시 아이디 창이 새로운 아이디를 입력했을때
			//다시 중복체크를 하도록 한다.
			function inputIdChk(){
				document.fm.ifIdCheck.value ="no"
			}
			
			
			//비밀번호 체크
			if(!fm.password.value){
				alert('비밀번호를 입력해주십시오');
				fm.password.focus()
				return false;
			} else{
				if(!fm.password.value.match(regular[1])){
					alert('영어와 숫자로 6글자 이상 작성하여 주십시오');
					fm.password.focus()
					return false;
				}
			}
			
			//전화번호 중간자리 체크
			if(!fm.tel2.value){
				alert('전화번호 입력해주십시오');
				fm.tel2.focus()
				return false;
			} else{
				if(!fm.tel2.value.match(regular[2])){
					alert('전화번호를 제대로 입력하여 주십시오');
					fm.tel2.focus()
					return false;
				}
			}
			
			//전화번호 끝자리 체크
			if(!fm.tel3.value){
				alert('전화번호 입력해주십시오');
				fm.tel3.focus()
				return false;
			} else{
				if(!fm.tel3.value.match(regular[3])){
					alert('전화번호를 제대로 입력하여 주십시오');
					fm.tel3.focus()
					return false;
				}
			}
			
			if (!fm.gender[0].checked && !fm.gender[1].checked ) {
				alert("성별 선택하여 주십시오")
				return false;
			}
		
			var checkCnt = 0;
			with(document.fm){
				for(var cnt=0; cnt < hobby.length; cnt++){
				
					if(hobby[cnt].checked){
						checkCnt++;
					}
				}
				
			}
			if(checkCnt==0){
				alert("취미를 선택하여 주십시오")
				return false;	
			}
			
			return true;
		
		}
	function goIdChk(){
		window.open("openIdChk.jsp", "열려라팝업", "width=600, height=500, left=200, top=200, scrollbars=no");
	}
	function inputIdChk(){
		document.userinfo.ifIdCheck.value= "idUncheck";
	}
	</script>
     <style>
       table { margin : auto; }
       input[type=text], input[type=password] { background : yellow; }
       input[type*=s] { color : blue; }
    </style>
</head>
<body>
      <p align = "center"><FONT SIZE="6" COLOR="red">회원 가입 작성 페이지</FONT></p>
      <!-- <table border="1" style = "background : blue"> -->
      <hr>
      <form action ="input_Process" name="fm" onsubmit="return oncheck()">
         <table border="1">
            <tr align="left">
               <th width="150"> 이름</th>
               <td width="450"><input type="text" name="name"></td>
            </tr>
             <tr align="left">
               <th width="150">아이디</th>
               <td width="450">
               <input type="text" name="id" id= "id" onkeydown = "inputIdChk()">
               <input type="button" value="아이디중복확인" onclick= "goIdChk()">
                 <input type="hidden" name="ifIdCheck" value= "no"> 
               </td>
            </tr>
            <tr align="left">
               <th>암호</th>
               <td><input type="password" name="password"></td>
            </tr>
            <tr align="left">
               <th>휴대폰 번호</th>
               <td>
                  <select name="tel1">
                     <option>010</option>
                     <option>011</option>
                     <option>016</option>
                  </select>
                  - <input type="text" name="tel2" size=4 maxlength=4>
                  - <input type="text" name="tel3" size=4 maxlength=4>
               </td>
            </tr>
            <tr align="left">
               <th>직업</th>
               <td>
                  <select name="job">
                     <option SELECTED>학생</option>
                     <option>직장인</option>
                     <option>자영업자</option>
                     <option>기타</option>
                  </select>
               </td>
            </tr>
            <tr align="left">
               <th>성별</th>
               <td>
                  <input type="radio" name="gender" value="male">남자
                  <input type="radio" name="gender" value="female">여자
               </td>
            </tr>
            <tr align="left">
               <th> 취미</th>
               <td>
                  <input type="checkbox" name="hobby" value="baduk">바둑
                  <input type="checkbox" name="hobby" value="game">게임
                  <input type="checkbox" name="hobby" value="fish">낚시
                  <input type="checkbox" name="hobby" value="read">독서
               </td>
            </tr>
            <tr>
               <th>자기 소개하는 글</th>
               <td><textarea cols="80" rows="10" name="intro" placeholder="자기를 소개하는 글을 쓰세요."></textarea></td>
            </tr>
            <tr align="center">
               <td colspan="2"><input type="submit" value="등록하기">
               <input type="reset" value="취소하기"></td>
            </tr>
         </table>
      </form>
  
</body>
</html>