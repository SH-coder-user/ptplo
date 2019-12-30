package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DAO;
import DB.DTO;

@WebServlet("/board-list")
public class boardList extends HttpServlet {
	int rowcnt;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String SeqNo= request.getParameter("SEQ_NO");
		
		int pageLine = 5;
		int pageNo;
		
		if(SeqNo != null)
			pageNo= Integer.parseInt(SeqNo);
		else
			pageNo= 1;
		
		List<DTO> list =DAO.readDBList(pageNo);
		int totalcnt = DAO.totalCnt();
		if(totalcnt>0)
			rowcnt= (int)Math.ceil((double)totalcnt/pageLine);
		else
			rowcnt = 0;
		request.setAttribute("list", list);
		request.setAttribute("rowcnt", rowcnt);
		request.setAttribute("target","BoardListView");
		RequestDispatcher dis = request.getRequestDispatcher("template.jsp");
		dis.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
