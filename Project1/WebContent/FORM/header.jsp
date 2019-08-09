<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String menu = request.getParameter("menu");
	menu = (menu == null) ? "home" : menu;
%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="style.css" rel="stylesheet" type="text/css">
<!-- 사이드바 -->
<nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left"
	 style="display: none; z-index: 2; width: 40%; min-width: 300px" id="sidebar">
	<a href="MAIN_FORM.jsp" onclick="sidebar_close()" class="w3-bar-item w3-button">Home</a> 
	<a href="javascript:void(0)" onclick="Search_open()" class="w3-bar-item w3-button">Sell</a> 
	<a href="MYPAGE_FORM.jsp" class="w3-bar-item w3-button">Mypage</a> 
	<a href="#Q&A" onclick="sidebar_close()" class="w3-bar-item w3-button">Q&A</a>
	<span onclick="sidebar_close()" class="w3-button w3-xlarge w3-display-topright">&times;</span>
</nav>

<!-- 상단 메뉴 -->
<div class="w3-top">
	<div class="w3-white w3-xlarge" style="max-width: 1200px; margin: auto">
		<div class="w3-button w3-padding-16 w3-left" onclick="sidebar_open()">&#9776;</div>
		<div class="w3-right w3-padding-16" style="font-size: 15px;">
			<a href="javascript:void(0)" onclick="location.href='LOGOUT.jsp'">Logout</a>
		</div>
		<div class="w3-center" id="usedbook" onclick="location.href='MAIN_FORM.jsp'">
			<img src="usedbook.jpg" name="usedbook">
		</div>
	</div>
	<!-- 검색바 -->
	<div class="w3-white w3-padding-16 w3-container" id="searchbar">
		<div class="w3-quarter w3-container" style="margin-left: 130px;"></div>
		<form class="sall w3-half container" action="titleSearch.jsp">
			<input type="search" id="search" placeholder="검색할 책 제목을 입력해주세요."name="all_book" />
			<button class="allsearchbtn icon" type="submit" onclick="searchTitle()">
				<i class="fa fa-search"></i>
			</button>
		</form>
		<div class="w3-quarter w3-container"></div>
	</div>
</div>

<!-- search modal -->
<div id="Search" class="w3-modal">
	<div class="w3-modal-content w3-card-4 w3-animate-zoom">
		<header class="w3-container">
			<span onclick="Search_close()" class="w3-button w3-xlarge w3-display-topright">&times;</span>
		</header>

		<form class="w3-container w3-card w3-padding-32 w3-white" target="_blank" method="post" action="searchdata.jsp">
			<div class="box">
				<div class="container-search">
					<input type="search" id="search" placeholder="등록할 책 제목을 입력해주세요." name="book_title" />
					<button class="icon"><i class="fa fa-search"></i></button>
				</div>
			</div>
		</form>
	</div>
</div>


<!-- 상단으로 이동하기 -->
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
<script>
	// 사이드바 open() / close()
	function sidebar_open() {
		document.getElementById("sidebar").style.display = "block";
	}
	function sidebar_close() {
		document.getElementById("sidebar").style.display = "none";
	}
	//search modal
	function Search_open() {
		document.getElementById("Search").style.display = "block";
	}
	function Search_close() {
		document.getElementById("Search").style.display = "none";
	}
	// 스크
	// 스크롤 동작시 상단으로 이동 버튼 나타내기
	window.onscroll = function() {
		scrollFunction()
	};

	function scrollFunction() {
		if (document.body.scrollTop > 20
				|| document.documentElement.scrollTop > 20) {
			document.getElementById("myBtn").style.display = "block";
		} else {
			document.getElementById("myBtn").style.display = "none";
		}
	}
	// 이동하기 버튼 클릭시 상단으로 이동
	function topFunction() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	}
	//책 검색하기
	function searchTitle() {
		document.sall.submit();
	}
</script>