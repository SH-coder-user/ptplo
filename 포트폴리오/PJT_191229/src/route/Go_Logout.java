package route;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/go-logout")
public class Go_Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
response.setContentType("text/html; charset=UTF-8");
		
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		response.sendRedirect("gomain");
		
	
	}

}
