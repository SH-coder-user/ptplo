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

@WebServlet("/board-read")
public class boardRead extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String SeqNo = request.getParameter("SEQ_NO");
		int bno = Integer.parseInt(SeqNo);
		
		DAO.cntDB(bno);//占쏙옙占쏙옙 占싻억옙占쏙옙占�
		DTO board= DAO.readDB(bno);
		
		request.setAttribute("board", board);
		request.setAttribute("bno", bno);
		request.setAttribute("target","BoardItemView");
		RequestDispatcher dis = request.getRequestDispatcher("template.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
