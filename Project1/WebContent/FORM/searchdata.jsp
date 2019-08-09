<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sell.searchSellDao"%>
<%@ page import="com.sell.searchSellDto"%>

<%
	request.setCharacterEncoding("UTF-8");
	String book_title = request.getParameter("book_title");
	if (searchSellDao.searchData(book_title)) {
		request.setAttribute("book_title", book_title);
		RequestDispatcher dispatcher = request.getRequestDispatcher("SELL_FORM.jsp");
		dispatcher.forward(request, response);

	} else {
		request.setAttribute("book_title", book_title);
		RequestDispatcher dispatcher = request.getRequestDispatcher("N_SELL_FORM.jsp");
		dispatcher.forward(request, response);
	}
%>
