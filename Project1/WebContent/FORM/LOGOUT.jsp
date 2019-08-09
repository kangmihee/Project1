<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">

<%
	session.removeAttribute("sessionID");
	session.removeAttribute("sessionSCH");

	out.println("<script>");
	out.println("alert('로그아웃 되었습니다.')");
	out.println("location.href='MAIN_FORM.jsp'");
	out.println("</script>");
%>
