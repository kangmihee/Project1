<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.board.boardDTO"%>
<%@ page import="com.board.boardDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-indigo.css">
<%!int pageSize = 10;
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<%
	String pageNum = request.getParameter("pageNum");
   if (pageNum == null) {
      pageNum = "1";
   }
   int currentPage = Integer.parseInt(pageNum);
   int startRow = (currentPage - 1) * pageSize + 1; /* 1번부터 10개  */
   int endRow = currentPage * pageSize;
   int count = 0;
   int number = 0;
   
   /* 디비에서 가져오기  */

   int sell_num = Integer.parseInt(request.getParameter("sell_num"));
   String sell_id = request.getParameter("sell_id");
   count = boardDAO.getInstance().getArticleCount(sell_num);
   
   number = count - (currentPage - 1) * pageSize;
%>
<div id="Comment" class="margintop" style="margin: 10px;">
</div>

	<div class="container">
		<form class="form-group text-center w3-padding-16" method="post" name="comment" id="comment">
			<input type="hidden" name="sell_num" value="<%=sell_num%>">
			<button class="w3-button w3-round w3-theme-d2 w3-opacity" type="submit" onclick="doWrite()">글쓰기</button>
		</form>
	
		<p>
			댓글 목록(전체 글:<%=count%>)
		</p>
	
		<%
	         if (count > 0) { /* 게시물이 한개 이상이면 디비의 article가져오기  */
	         List<boardDTO> board_list = boardDAO.getInstance().getArticles(sell_num); /* 한페이지에 보이는게 몇갠지  */
	    %>
		<form class="form-group text-center w3-padding-16" method="post" name="comment2" id="comment2">
			<div class="w3-container">
				<h2>댓글 목록</h2>
				<table class="w3-table-all w3-hoverable w3-large w3-striped w3-bordered">
					<thead>
						<tr class="">
							<th>제 목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<% for (boardDTO dto:board_list) { %>
					<tr>
						<td>
							<% int wid = 0;
			                  if (dto.getRe_level() > 0) { 
			                     wid = 10 * (dto.getRe_level());
	                 		 %> 
			                  	<i class="fa fa-reply" style="margin-left:<%=wid%>px" aria-hidden="true"></i> 
		                  	<% } %> 
		                  		<a href="content_pwd_form.jsp?bo_num=<%=dto.getBo_num()%>&pageNum=<%=currentPage%>&sell_id=<%=sell_id%>"
									onclick="window.open(this.href, '댓글보기','width=500,height=500,location=no,status=no,scrollbars=yes'); return false;">
								<%=dto.getSubject()%></a>
						</td>
						<td class="text-center"><%=dto.getUser_id()%></td>
						<td class="text-center"><%=sdf.format(dto.getReg_date())%></td>
					</tr>
					<%}%>
				</table>
			</div>
	
			<% } else{ %>
			<div class="alert alert-info" role="alert">
				<p>댓글이 없습니다. 새로운 댓글을 작성 해보세요.</p>
			</div>
			<%}%>
	
			<div class="w3-center">
				<%
		         if (count > 0) {
		            int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); /* 나머지.   */
		            int startPage = 1;
		   
		            if (currentPage % 10 != 0)
		               startPage = (int) (currentPage / 10) * 10 + 1;
		            else
		               startPage = ((int) (currentPage / 10) - 1) * 10 + 1;
		   
		            int pageBlock = 10;
		            int endPage = startPage + pageBlock - 1;
		            if (endPage > pageCount)
		               endPage = pageCount;
		            if (startPage > 10) { %>
				<a href="">[이전]</a>
				<% } for (int i = startPage; i <= endPage; i++) {%>
				<a href="">[<%=i%>]
				</a>
				<% } if (endPage < pageCount) { %>
				<a href="">[다음]</a>
				<% } } %>
			</div>
		</form>
	</div>

<script>
   // 댓글 달기
   function doWrite() { 
      window.name = "댓글 등록";      
      <% if(session.getAttribute("sessionID") == null) { %>
      <%         
         out.println("alert('회원만 댓글작성이 가능합니다. 로그인을 해주세요.')"); 
      %>
      <% } else { %>
         var title = "댓글 등록하기";
         window.open("", title,"width=550,height=650,location=no,status=no,scrollbars=yes");
         var formData = document.comment;
         formData.target = title;
         formData.action = "BO_WRITE_FORM.jsp";
         formData.submit();         
      <% } %>                        
      } 
</script>













