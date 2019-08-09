<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.board.boardDTO"%>
<%@ page import="com.board.boardDAO"%>
<%@ page import="java.text.SimpleDateFormat"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-indigo.css">

<%
	int bo_num = Integer.parseInt(request.getParameter("bo_num"));
	String pageNum = request.getParameter("pageNum");
	String login_id = (String) session.getAttribute("sessionID");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	try {
		boardDTO dto = boardDAO.getInstance().getArticle(bo_num);
		int ref = dto.getRef();
		int re_step = dto.getRe_step();
		int re_level = dto.getRe_level();
		int sell_num = dto.getSell_num();
		String user_id = dto.getUser_id();
%>

<div class="container" style="margin-left: 50px">
	<div class="page-header text-center">
		<br><br>
		<h5 class="w3-text-theme w3-opacity">
			<b>댓글 보기</b>
		</h5>
	</div>
	<br>
	<form>
		<table class="w3-table w3-large">
			<tr>
				<th>작성자</th>
				<td><%=user_id%></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=sdf.format(dto.getReg_date())%></td>
			</tr>
			<tr>
				<th>글제목</th>
				<td colspan="3"><%=dto.getSubject()%></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td colspan="3"><pre><%=dto.getBo_content()%></pre></td>
			</tr>
			<tr>
				<td colspan="4" class="text-center">
					<% if (!user_id.equals(login_id)) { %> 
					<input type="button" class="btn btn-success w3-button w3-round w3-theme-d2 w3-opacity" value="답글쓰기"
					onclick="document.location.href='BO_WRITE_FORM.jsp?bo_num=<%=bo_num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>&sell_num=<%=sell_num%>'">
					<% } else { %> 
					<input type="button" class="btn btn-primary w3-button w3-round w3-theme-d2 w3-opacity" value="글수정"
					onclick="document.location.href='BO_UPDATE_FORM.jsp?bo_num=<%=bo_num%>&pageNum=<%=pageNum%>'">
	
					<input type="button" class="btn btn-danger w3-button w3-round w3-theme-d2 w3-opacity" value="글삭제"
					onclick="document.location.href='BO_DELETE.jsp?bo_num=<%=bo_num%>&pageNum=<%=pageNum%>'">
	
					<input type="button" class="btn btn-success w3-button w3-round w3-theme-d2 w3-opacity" value="답글쓰기"
					onclick="document.location.href='BO_WRITE_FORM.jsp?bo_num=<%=bo_num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>&sell_num=<%=sell_num%>'">
					<% } %>
				</td>
			</tr>
		</table>
		<% } catch (Exception e) {} %>
	</form>
</div>



