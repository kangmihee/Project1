<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.board.boardDTO"%>
<%@ page import="com.board.boardDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.Timestamp"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" scope="page" class="com.board.boardDTO">
	<jsp:setProperty name="dto" property="*" />
</jsp:useBean>

<%
 	dto.setReg_date(new Timestamp(System.currentTimeMillis()) );
 	boardDAO dbPro = boardDAO.getInstance();
     
     if(dbPro.insertArticle(dto)){	
     	out.println("<script>");
 	 	out.println("alert('댓글을 작성했습니다.')");						
 		out.println("window.close()");			
 		out.println("</script>");
 	}else{
 		out.println("<script>");	
    	 	out.println("alert('실패.')");	
    		out.println("window.close()");			
    		out.println("</script>");
 	}
 %>