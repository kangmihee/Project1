<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sell.searchSellDao"%>
<%
	String title = request.getParameter("book_title");
	searchSellDao.getInstance().getSearch(title);
%>