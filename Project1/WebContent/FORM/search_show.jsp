<%@page
	import="com.sun.org.apache.xml.internal.resolver.helpers.PublicId"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sell.inputSellDto"%>
<%@ page import="com.sell.searchSellDao"%>
<%@ page import="java.util.List"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>
<link href="style.css" rel="stylesheet" type="text/css">

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
<!-- 책보기 -->
<div class="w3-main w3-content w3-padding" style="max-width: 1200px; margin-top: 220px">
	<!-- DB에서 값 가져오기 -->
	<%
		request.setCharacterEncoding("UTF-8");
		String all_book = (String) request.getAttribute("all_book");
		System.out.println(all_book);
		List<inputSellDto> list = searchSellDao.getInstance().searchTitle(all_book);
	%>
	<!-- 책 목록 보여주기 -->
	<div class="w3-row-padding w3-padding-16 w3-center">
		<%
			for (inputSellDto tmp : list) {
		%>
		<div class="cont w3-quarter" id="book_click" style="width: 25%; height: 400px;">
			<img src="/Project1/imageFile/<%=tmp.getBook_img()%>" style="width: 100%;" id="Bookimg" class="img">
			<h5><%=tmp.getBook_title()%></h5>
			<div class="btn_cont">
				<a class="btn w3-btn w3-teal" href="show_detail.jsp?num=<%=tmp.getSell_num()%>"
					style="width: 100%; height: 100%;"> 
					<br> <br> <br> <br> <br> <br> <i class="fas fa-check" style="font-size: 60px;"></i>
					 <!-- <br><br><br>보러가기 -->
				</a>
			</div>
		</div>
		<%
		}
		%>
	</div>

	<!-- 페이지 이동 -->
	<div class="w3-center w3-padding-32">
		<div class="w3-bar">
			<a href="#" class="w3-bar-item w3-button w3-hover-black">&laquo;</a>
			<a href="#" class="w3-bar-item w3-black w3-button">1</a> 
			<a href="#" class="w3-bar-item w3-button w3-hover-black">&raquo;</a>
		</div>
	</div>

	<!-- Q&A -->
	<div class="blog-masthead">
		<jsp:include page="qna.jsp" flush="false" />
	</div>

	<!-- footer -->
	<div class="blog-masthead">
		<jsp:include page="footer.jsp" flush="false" />
	</div>

	<!-- End page content -->
</div>

<script>
	/* 책 상세보기 */
	function showbook_open() {
		document.getElementById("showbook").style.display = "block";

	}
	function showbook_close() {
		document.getElementById("showbook").style.display = "none";
	}
	/* 책 상세보기 내 tab */
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
</script>