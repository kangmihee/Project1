<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.board.boardDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" scope="page" class="com.board.boardDTO">
	<jsp:setProperty name="dto" property="*" />
</jsp:useBean>

<%
	String pageNum = request.getParameter("pageNum");
%>

<%
	boardDAO dbPro = boardDAO.getInstance(); 
 	
 	if(dbPro.updateArticle(dto)){		
 		out.println("<script>");	
   	 	out.println("alert('댓글을 수정했습니다.')");	
   		out.println("window.close()");			
   		out.println("</script>");			
	}else{
	 	out.println("<script>");
	 	out.println("alert('댓글수정 실패...')");			 					
		out.println("window.close()");			
		out.println("</script>");
	}
%>