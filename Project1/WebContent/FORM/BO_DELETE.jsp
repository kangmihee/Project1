<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.board.boardDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	int bo_num = Integer.parseInt(request.getParameter("bo_num"));
  	String pageNum = request.getParameter("pageNum");
  	String bo_pwd = request.getParameter("bo_pwd");
%>

<%
	boardDAO dbPro = boardDAO.getInstance(); 
		
 if(dbPro.deleteArticle(bo_num)){		
   	 	out.println("<script>");	
   	 	out.println("alert('댓글 삭제실패.')");	
   		out.println("window.close()");			
   		out.println("</script>");			
	}else{
	 	out.println("<script>");
	 	out.println("alert('댓글을 삭제했습니다.')");			 					
		out.println("window.close()");			
		out.println("</script>");
	}
%>