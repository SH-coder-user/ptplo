<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
	<h4>게시글 읽기</h4>
	[제목] ${board.title }<br>
	[작성자] ${board.writer }
	[작성일시] ${board.regdate }<br>
	[조회수] ${board.cnt }<br>
	--------------------------------------------------------<br>
	<pre>${board.content }</pre><br><br><!-- 입력태그를 그대로 보여주기위해 </pre> 사용한다. 안하면 치환 명령어를 서블릿에첨부해야함.  -->
	<a href= 'board-update-input?bno=${board.bno }'>[수정]</a>
	<a href='board-delete?bno=${board.bno }'>[삭제]</a>
	<a href='board-list'>[목록으로]</a>
	</form>
</body>
</html>