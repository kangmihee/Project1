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
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String user_sch = request.getParameter("user_sch");
	String email = request.getParameter("email");

	USERDTO dto = new USERDTO();
	dto.setUser_id(user_id);
	dto.setUser_pw(user_pw);
	dto.setUser_sch(user_sch);
	dto.setEmail(email);

	if (USERDAO.ID_CHECK(user_id)) {
		out.println("<script>");
		out.println("alert('아이디가 중복됩니다. 다른아이디를 입력해주세요.')");
		out.println("location.href='MAIN_FORM.jsp'");
		out.println("</script>");
	} else {
		boolean isSuccess = false;
		isSuccess = USERDAO.getInstance().JOIN_INSERT(dto);
		out.println("<script>");
		out.println("alert('회원가입이 되었습니다.')");
		out.println("location.href='MAIN_FORM.jsp'");
		out.println("</script>");
	}
%>
