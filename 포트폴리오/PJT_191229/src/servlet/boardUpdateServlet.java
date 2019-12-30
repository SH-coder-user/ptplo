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

@WebServlet("/board-update")
public class boardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DTO board =new DTO();
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset =utf-8");
		
		int bno=Integer.parseInt(request.getParameter("bno"));
		board.setBno(bno);
		board.setTitle(request.getParameter("title"));
		String content = request.getParameter("content");
		
		board.setContent(content);
		
		DAO.updateDB2(board);
		
		response.sendRedirect("board-list");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
