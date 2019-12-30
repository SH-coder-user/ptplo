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

@WebServlet("/input_Process")
public class Input_Process extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
				DTO user = new DTO();
				user.setName(request.getParameter("name"));
				user.setId(request.getParameter("id"));
				user.setPassword(request.getParameter("password"));
				
				String tel1= request.getParameter("tel1");
				String tel2= request.getParameter("tel2");
				String tel3= request.getParameter("tel3");
				user.setTel(tel1+"-"+tel2+"-"+tel3);
				
				user.setJob(request.getParameter("job"));
				
				String gender = request.getParameter("gender");
				if(gender.equals("male")) {
					user.setGender(1);
				}
				else {
					user.setGender(2);
				}
						
				
				String hobbylist[] = request.getParameterValues("hobby");
				String hobby = "";
				for(int i =0;i<hobbylist.length;i++) {
					hobby += hobbylist[i]+" ";
					
				}
				user.setHobby(hobby);
				user.setIntro(request.getParameter("intro"));
				
				DAO.insertDB(user);
				
				request.setAttribute("user",user);
				
				request.setAttribute("target","Input_Result_User");
				RequestDispatcher dis = request.getRequestDispatcher("template.jsp");
				dis.forward(request, response);
	
		}
		

}
