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

@WebServlet("/board-update-input")
public class boardUpdateInput extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int bno = Integer.parseInt(request.getParameter("bno"));
		DTO board =DAO.readDB(bno);
		
		request.setAttribute("board", board);
		/*RequestDispatcher dis = request.getRequestDispatcher("BoardUpdateInput.jsp");
		dis.forward(request, response);*/
		request.setAttribute("target","BoardUpdateInput");
		RequestDispatcher dis = request.getRequestDispatcher("template.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
