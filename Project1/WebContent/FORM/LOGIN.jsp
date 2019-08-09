<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.user.USERDAO"%>
<%@ page import="com.user.USERDTO"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%
	request.setCharacterEncoding("utf-8");
	String user_id = request.getParameter("login_id");
	String user_pw = request.getParameter("login_pwd");

	if (USERDAO.LOGIN_CHECK(user_id, user_pw)) {
		USERDTO dto = USERDAO.getInstance().SELECT_IDSCH(user_id);
		String user_sch = dto.getUser_sch();
		session.setAttribute("sessionID", user_id);
		session.setAttribute("sessionSCH", user_sch);
		out.println("<script>");
		out.println("alert('로그인 되었습니다. 환영합니다.')");
		out.println("location.href='MAIN_FORM.jsp'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('아이디 또는 비밀번호를 확인해주세요.')");
		out.println("location.href='MAIN_FORM.jsp'");
		out.println("</script>");
	}
%>
