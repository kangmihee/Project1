<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sell.inputSellDto"%>
<%@ page import="com.sell.searchSellDao"%>

<%
	request.setCharacterEncoding("UTF-8");
	String all_book = request.getParameter("all_book");
	if (searchSellDao.searchAB(all_book)) {
		request.setAttribute("all_book", all_book);
		RequestDispatcher dispatcher = request.getRequestDispatcher("search_show.jsp");
		dispatcher.forward(request, response);
	} else {
		out.println("<script>alert('검색한 책이 없습니다. 다시 검색해주세요.');");
		out.println("history.go(-1)</script>");
	}
%>

