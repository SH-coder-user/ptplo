package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DAO;
import DB.DTO;

@WebServlet("/board-save")
public class boardSaveServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		DTO board = new DTO();
		int lastbno = DAO.maxCnt()+1;
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset =utf-8");
		
		board.setTitle(request.getParameter("title"));
		board.setBno(lastbno);
		String content = request.getParameter("content");
		/*content = content.replaceAll("`", "'");//작은따옴표 치환
*/		board.setContent(content);
		board.setWriter(request.getParameter("writer"));
		DAO.insertDB2(board);
		response.sendRedirect("board-list");
		

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
