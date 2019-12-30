package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DBCon;
import DB.DTO;

@WebServlet("/check-id")
public class Check_Id extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
				String userid = request.getParameter("id");
				System.out.print(userid);
				
				Connection con = null;
			    PreparedStatement ps = null;
			    ResultSet rs = null;
			    DTO user=new DTO();
			    try {
			    	con = DBCon.getCon();
			    	ps = con.prepareStatement("SELECT * FROM USERINFO WHERE id = '" + userid + "'");
			    	rs = ps.executeQuery();
			    	
			    	if(rs.next()) {
			    		user.setId(rs.getString("id"));
			    	}
			    } catch(Exception e) {
					e.printStackTrace();
				}finally {
					 if (rs != null) {
				            try { rs.close(); } catch (Exception e) { }
				         }
				         if (ps != null) {
				            try { ps.close(); } catch (Exception e) { }
				         }
				         if (con != null) {
				            try { con.close(); } catch (Exception e) { }
				         }
				         if(user.getId()!=null) {
								request.setAttribute("result", "true");
							}else {
								request.setAttribute("result", "false");
							}
				      }
				
				
				RequestDispatcher dis = request.getRequestDispatcher("IdCheck_Result_User.jsp");
				dis.forward(request, response);
	}

}
