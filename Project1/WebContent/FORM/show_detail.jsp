<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sell.searchSellDao"%>
<%@ page import="com.sell.inputSellDto"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<link href="style.css" rel="stylesheet" type="text/css">

<%
	int num = Integer.parseInt(request.getParameter("num"));
	inputSellDto dto = searchSellDao.getInstance().BOOK_INFO(num);
%>
<!-- 사이드바 및 상단바 메뉴 -->
<%
	if (session.getAttribute("sessionID") == null) {
%>
<div class="blog-masthead">
	<jsp:include page="header.inc.jsp" flush="false" />
</div>
<% } else { %>
<div class="blog-masthead">
	<jsp:include page="header.jsp" flush="false" />
</div>

<% } %>
<!-- 책 상세보기 Modal -->
<div class="w3-main w3-content w3-padding"
	style="max-width: 1200px; margin-top: 220px">
	<table id="searchview" class="w3-margin" style="width: 100%">
		<tr>
			<td rowspan="7">
			<img src="/Project1/imageFile/<%=dto.getBook_img()%>" style="width: 300px;" id="Bookimg" class="img" onclick="onClick(this)"></td>
			<td><h2><%=dto.getBook_title()%></h2></td>
		</tr>
		<tr>
			<td><p>출판사 / 저자 / 년도</p></td>
			<td><p><%=dto.getBook_comp()%> | <%=dto.getBook_writer()%> | <%=dto.getBook_date()%></p></td>
		</tr>
		<tr>
			<td><p>책상태</p></td>
			<td><p style="color: red;"><%=dto.getGrade()%></p></td>
		</tr>
		<tr>
			<td><p>전달방법</p></td>
			<td><p>
					<% if (dto.getDirect() == null) { %>
					<% } else { %>
					<%=dto.getDirect()%> |
					<% } %>
					<% if (dto.getDelivery() == null) { %>
					<% } else { %>
					<%=dto.getDelivery()%> |
					<% } %>
					<% if (dto.getCampus() == null) { %>
					<% } else { %>
					<%=dto.getCampus()%>
					<% } %>
				</p></td>
		</tr>
		<tr>
			<td><p>분류</p></td>
			<td><p><%=dto.getBook_group()%></p></td>
		</tr>
		<tr>
			<td><p>판매자 | 학교</p></td>
			<td><p><%=dto.getUser_id()%> | <%=dto.getUser_sch()%></p></td>
		</tr>
		<tr>
			<td><p>가격</p></td>
			<%
				int originPrice = Integer.parseInt(dto.getBook_price());
				int sell_price = Integer.parseInt(dto.getSell_price());
				float rate = ((float) originPrice - (float) sell_price) / (float) originPrice * 100;
				double rate_2 = Math.round(rate * 10) / 10.0;
			%>
			<td><p style="text-decoration: line-through;">
					원가 : <%=originPrice%>원
				</p>
				<p style="color: red; font-size: 18px; font-weight: bold;">
					판매가 : <%=sell_price%>원 (<%=rate_2%>%할인)
				</p></td>
		</tr>
	</table>

	<div class="w3-bar w3-border-bottom">
		<button class="tablink w3-bar-item w3-button" onclick="openBook(event, 'bookIntro')">책소개</button>
		<button class="tablink w3-bar-item w3-button" onclick="openBook(event, 'Book_img')">책상태</button>
		<button class="tablink w3-bar-item w3-button" onclick="openBook(event, 'Comment')">댓글</button>
	</div>

	<div id="bookIntro" class="w3-container book">
		<div class="margintop" style="margin: 20px;"></div>
		<h4><%=dto.getBook_content()%></h4>
	</div>

	<div id="Book_img" class="w3-container book">
		<div class="margintop" style="margin: 20px;"></div>
			
			<div class="w3-row">
				<div class="w3-col m4 l3">
					<h4>책 상태</h4>
				</div>
				<div class="w3-col m8 l9">
					<h4><%=dto.getGrade_memo()%></h4>
				</div>
			</div>
			<br><br><br>
			<div class="margintop" style="margin: 20px;"></div>
			<div class="w3-row">
				<div class="w3-col m4 l3">
					<h4>책 이미지</h4>
				</div>
				<div class="w3-col m8 l9">
					<img src="/Project1/imageFile/<%=dto.getState_img()%>" style="width: 80%; cursor: zoom-in" onclick="onClick(this)">
				</div>
			</div>
			<br><br><br>
			<div class="margintop" style="margin: 20px;"></div>
			<div class="w3-row">
				<div class="w3-col m4 l3">
					<h4>배송 메모</h4>
				</div>
				<div class="w3-col m8 l9">
					<h4><%=dto.getDel_memo()%></h4>
				</div>
			</div>
			<br><br><br>
	</div>

	<div id="img_click" class="w3-modal " onclick="this.style.display='none'">
		<span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
		<div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
			<img id="img01" class="w3-image">
			<p id="caption"></p>
		</div>
	</div>

	<div id="Comment" class="w3-container book" style="height: 1400px;">
		<div class="blog-masthead">
			<jsp:include page="BOOK_BOARD.jsp" flush="false">
				<jsp:param name="sell_num" value="<%=dto.getSell_num()%>" />
				<jsp:param name="sell_id" value="<%=dto.getUser_id()%>" />
			</jsp:include>
		</div>
	</div>
</div>

<script>
	document.getElementsByClassName("tablink")[0].click();
	function openBook(evt, bookName) {
		var i, x, tablinks;
		x = document.getElementsByClassName("book");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < x.length; i++) {
			tablinks[i].classList.remove("w3-light-grey");
		}
		document.getElementById(bookName).style.display = "block";
		evt.currentTarget.classList.add("w3-light-grey");
	}
	function onClick(element) {
		document.getElementById("img01").src = element.src;
		document.getElementById("img_click").style.display = "block";
	}
</script>


