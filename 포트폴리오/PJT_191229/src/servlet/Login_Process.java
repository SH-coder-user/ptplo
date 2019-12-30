package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import DB.DAO;
import DB.DTO;

@WebServlet("/Login_Process")
public class Login_Process extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html; charset=UTF-8");
		
		String userid =request.getParameter("id");
		String password= request.getParameter("pass");
		
		DTO user = DAO.readDB(userid);
		HttpSession session = request.getSession();
		
		if(password.equals(user.getPassword())) {
			request.setAttribute("user", user);
			request.setAttribute("result", "true");
			session.setAttribute("id", userid);
			session.setAttribute("name", user.getName());
		}else {
			request.setAttribute("result", "false");
		}
		request.setAttribute("target", "Login_Result_User");
		RequestDispatcher dis = request.getRequestDispatcher("template.jsp");
		dis.forward(request, response);

}
	}
