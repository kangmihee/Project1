<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.board.boardDTO"%>
<%@ page import="com.board.boardDAO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-indigo.css">

<%
	int bo_num = Integer.parseInt(request.getParameter("bo_num"));
	String pageNum = request.getParameter("pageNum");
	String board_id = request.getParameter("board_id");
	String sell_id = request.getParameter("sell_id");
	String login_id = (String) session.getAttribute("sessionID");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	try {
		boardDAO dbPro = boardDAO.getInstance();
		boardDTO article = dbPro.getArticle(bo_num);

		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
%>
<%
	if (login_id == null) {
			out.println("<script>");
			out.println("alert('회원만 댓글보기가 가능합니다. 로그인을 해주세요.')");
			out.println("window.close()");
			out.println("</script>");
		}
%>

<%
	if (sell_id.equals(login_id)) {
			request.setAttribute("bo_num", bo_num);
			RequestDispatcher dispatcher = request.getRequestDispatcher("content.jsp");
			dispatcher.forward(request, response);
		}
%>

<%
	List<boardDTO> list = boardDAO.getInstance().getArticleREF(ref);
		for (boardDTO dto : list) {
			if (login_id.equals(dto.getUser_id())) {
				request.setAttribute("bo_num", bo_num);
				RequestDispatcher dispatcher = request.getRequestDispatcher("content.jsp");
				dispatcher.forward(request, response);
			}
		}
%>

<div class="container" style="margin-left: 50px">
	<div class="page-header text-center">
		<br>
		<h1 class="w3-text-theme w3-opacity">
			<b>글 보기 권한</b>
		</h1>
	</div>	
	<br>
	<form method="POST" name="delForm" action="content_pwd.jsp?bo_num=<%=article.getBo_num()%>&pageNum=<%=pageNum%>" onsubmit="return deleteSave()">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<td><b>비밀번호를 입력해 주세요.</b></td>
			</tr>
			<tr>
				<td>비밀번호 : <input type="password" name="bo_pwd"> <input
					type="hidden" name="bo_num" value="<%=article.getBo_num()%>"
					class="form-control">
				</td>
			</tr>
			<tr>
				<td class="text-center">
				<button class="w3-button w3-round w3-theme-d2 w3-opacity" type="button" 
					onclick="document.location.href='content_pwd.jsp?bo_num=<%=article.getBo_num()%>&pageNum=<%=pageNum%>'">
				글 보러가기</button>
				
				</td>
			</tr>
		</table>
		<% } catch (Exception e) {} %>
	</form>
</div>


