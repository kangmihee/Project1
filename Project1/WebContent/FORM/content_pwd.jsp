<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.board.boardDAO"%>
<%@ page import="com.board.boardDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	int bo_num = Integer.parseInt(request.getParameter("bo_num"));
	String pageNum = request.getParameter("pageNum");
	String bo_pwd = request.getParameter("bo_pwd");
%>

<%
	boardDAO dbPro = boardDAO.getInstance();

	if (dbPro.content_pwd(bo_num, bo_pwd)) {
		response.sendRedirect("content.jsp?bo_num=" + bo_num);
	} else {
		out.println("<script>");
		out.println("alert('비밀번호가 틀렸습니다.')");
		out.println("window.close()");
		out.println("</script>");
	}
%>