<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setAttribute("target", "input");
	RequestDispatcher d = request.getRequestDispatcher("template.jsp");
	d.forward(request, response);%>