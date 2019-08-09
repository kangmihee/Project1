<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.board.boardDTO"%>
<%@ page import="com.board.boardDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-indigo.css">

<% 
    	int bo_num = Integer.parseInt(request.getParameter("bo_num"));
		String pageNum = request.getParameter("pageNum");
		try{
			boardDAO dbPro = boardDAO.getInstance(); 
			boardDTO dto =  dbPro.updateGetArticle(bo_num);
	%>
<div class="container" style="margin-left: 50px">
	<div class="page-header text-center">
		<br>
		<h3 class="w3-text-theme w3-opacity">
			<b>댓글 수정하기</b>
		</h3>
	</div>
	<br>
	<form method="post" name="writeform"
		action="BO_UPDATE.jsp?pageNum=<%=pageNum%>"
		onsubmit="return writeSave()">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<td>아이디</td>
				<td><input type="text" size="10" maxlength="10" name="user_id"
					value="<%=dto.getUser_id()%>" style="ime-mode: active;"
					class="form-control"> <input type="hidden" name="bo_num"
					value="<%=dto.getBo_num()%>"></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td><input type="text" size="40" maxlength="50" name="subject"
					value="<%=dto.getSubject()%>" style="ime-mode: active;"
					class="form-control"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea name="bo_content" rows="13" cols="40"
					style="ime-mode: active;" class="form-control"><%=dto.getBo_content()%></textarea>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" size="8" maxlength="12"
					name="bo_pwd" style="ime-mode: inactive;" class="form-control">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="submit" class="btn btn-primary w3-button w3-round w3-theme-d2 w3-opacity" value="글수정"> 
					<input type="reset" class="btn btn-success w3-button w3-round w3-theme-d2 w3-opacity" value="다시작성">
				</td>
			</tr>
		</table>
		<%
			  }catch(Exception e){}
			%>
	</form>
</div>
