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
		int num = Integer.parseInt(request.getParameter("sell_num"));
	  	int bo_num = 0, ref = 1, re_step = 0, re_level = 0;
	  	String strV = "";
	  	try{
	    if(request.getParameter("bo_num")!=null){
	    	bo_num = Integer.parseInt(request.getParameter("bo_num"));
		   	ref = Integer.parseInt(request.getParameter("ref"));
		   
		   re_step = Integer.parseInt(request.getParameter("re_step"));
		   re_level = Integer.parseInt(request.getParameter("re_level"));
	    }
	%>
<div class="container" style="margin-left: 50px">
	<div class="page-header text-center">
		<br>
		<h5 class="w3-text-theme w3-opacity">
			<b>댓글 작성</b>
		</h5>
	</div>
	<br>
	<form method="post" name="writeform" action="BO_WRITE.jsp">
		<input type="hidden" name="sell_num" value="<%=num%>">
		<input type="hidden" name="bo_num" value="<%=bo_num%>"> 
		<input type="hidden" name="ref" value="<%=ref%>"> 
		<input type="hidden" name="user_id" value="<%=session.getAttribute("sessionID") %>"> 
		<input type="hidden" name="re_step" value="<%=re_step%>"> 
		<input type="hidden" name="re_level" value="<%=re_level%>">

		<table class="table table-striped table-bordered table-hover">
			<tr>
				<td>아이디</td>
				<td><%=session.getAttribute("sessionID") %></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td>
					<%
				       if(request.getParameter("num")==null) 
				     	 strV = "";
				       else
				     	 strV = "[답변]";
				     %> 
				     <input type="text" size="40" maxlength="50" id="subject" name="subject" value="<%=strV%>" 
				     style="ime-mode: active;"class="form-control">
				</td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea id="bo_content" name="bo_content" rows="13"
						cols="40" style="ime-mode: active;" class="form-control"></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" size="8" maxlength="12" id="bo_pwd"
					name="bo_pwd" style="ime-mode: inactive;" class="form-control"></td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
				<input type="submit" class="btn btn-primary w3-button w3-round w3-theme-d2 w3-opacity" value="글쓰기"> 
				<input type="reset" class="btn btn-success w3-button w3-round w3-theme-d2 w3-opacity" value="다시작성"></td>
			</tr>
		</table>
		<% }catch(Exception e){} %>
	</form>
</div>
