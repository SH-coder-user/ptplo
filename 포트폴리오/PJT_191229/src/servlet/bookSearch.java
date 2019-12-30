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


@WebServlet("/booksearch")
public class bookSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String bcd = request.getParameter("bcd");
			DTO user= DAO.readbook(bcd);
			/*System.out.print(user);*/
			if(user!=null) {
				request.setAttribute("user", user);
				request.setAttribute("target","BookView");
				RequestDispatcher dis = request.getRequestDispatcher("template.jsp");
				dis.forward(request, response);
			}else {
				request.setAttribute("result", "false");
				request.setAttribute("target","Find_Book");
				RequestDispatcher dis = request.getRequestDispatcher("template.jsp");
				dis.forward(request, response);
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
