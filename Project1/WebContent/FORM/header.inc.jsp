<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
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
	<a onclick="Login_open()" href="MAIN_FORM.jsp" class="w3-bar-item w3-button">Home</a> 
	<a onclick="Login_open()" class="w3-bar-item w3-button">Sell</a> 
	<a onclick="Login_open()" class="w3-bar-item w3-button">Mypage</a> 
	<a href="#Q&A" onclick="sidebar_close()" class="w3-bar-item w3-button">Q&A</a> 
	<span onclick="sidebar_close()" class="w3-button w3-xlarge w3-display-topright">&times;</span>
</nav>

<!-- 상단 메뉴 -->
<div class="w3-top">
	<div class="w3-white w3-xlarge" style="max-width: 1200px; margin: auto">
		<div class="w3-button w3-padding-16 w3-left" onclick="sidebar_open()">&#9776;</div>
		<div class="w3-right w3-padding-16" style="font-size: 15px;">
			<a href="javascript:void(0)" onclick="Login_open()">Login</a> 
			<a href="javascript:void(0)" onclick="Join_open()">Join</a>
		</div>
		<div class="w3-center" id="usedbook" onclick="location.href='MAIN_FORM.jsp'">
			<img src="usedbook.jpg" name="usedbook">
		</div>
	</div>
	<!-- 검색바 -->
	<div class="w3-white w3-padding-16 w3-container" id="searchbar">
		<div class="w3-quarter w3-container" style="margin-left: 130px;"></div>
		<form class="sall w3-half container" action="titleSearch.jsp">
			<input type="search" id="search" placeholder="검색할 책 제목을 입력해주세요." name="all_book" />
			<button class="allsearchbtn icon" type="submit" onclick="searchTitle()">
				<i class="fa fa-search"></i>
			</button>
		</form>
		<div class="w3-quarter w3-container"></div>
	</div>
</div>

<!-- Login modal -->
<div id="Login" class="w3-modal" style="z-index: 2">
	<div class="w3-modal-content w3-animate-zoom" style="max-width: 600px">
		<div class="w3-container w3-padding w3-black">
			<span onclick="Login_close()" class="w3-button w3-black w3-right w3-xxlarge">
				<i class="fa fa-remove"></i>
			</span>
			<h2>로그인</h2>
		</div>
		<form class="w3-container" action="LOGIN.jsp" onsubmit="return Login_Check()">
			<div class="w3-section">
				<label><b>Id</b></label> 
				<input class="w3-input w3-border w3-margin-bottom" id="login_id" name="login_id" 
					type="text" placeholder="Id를 입력해주세요." required>
				
				<label><b>Password</b></label> 
				<input class="w3-input w3-border w3-margin-bottom" id="login_pwd" name="login_pwd" 
					type="password" placeholder="Password를 입력해주세요." required>
					
				<button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Login</button>
			</div>
		</form>
		<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
			<button onclick="Login_close()" type="button" class="w3-button w3-red">Cancel</button>
		</div>
	</div>
</div>

<!-- Join modal -->
<form method="post" action="JOIN.jsp" class="form-horizontal" onsubmit="return Join_Check()">
	<div id="Join" class="w3-modal" style="z-index: 4">
		<div class="w3-modal-content w3-animate-zoom" style="max-width: 600px">
			
			<div class="w3-container w3-padding w3-black">
				<span onclick="Join_close()" class="w3-button w3-black w3-right w3-xxlarge">
					<i class="fa fa-remove"></i>
				</span>
				<h2>회원가입</h2>
			</div>
			
			<div class="w3-panel">
				<label>*ID</label> 
				<input class="w3-input w3-border w3-margin-bottom" id="user_id"
					name="user_id" type="text" placeholder="Id를 입력해주세요." required>
					
				<label>＊PASSWORD</label> 
				<input class="w3-input w3-border w3-margin-bottom" id="user_pw"
					name="user_pw" type="password" placeholder="Password를 입력해주세요." required>
										 
				<label>＊CONFIRM PASSWORD</label> 
				<input class="w3-input w3-border w3-margin-bottom" id="user_pw2"
					name="user_pw2" type="password" placeholder="같은 Password를 입력해주세요." required> 	
									
				<label>*E-MAIL</label> 
				<input class="w3-input w3-border w3-margin-bottom" id="email" 
					name="email" type="email" placeholder="E-mail을 입력해주세요." required>
					
				<div class="w3-row">
					<div class="w3-threequarter">
						<label>*UNIVERSITY</label> 
						<input class="w3-input w3-border w3-margin-bottom w3-" id="user_sch"
							name="user_sch" type="text" placeholder="재학중인 대학교를 불러옵니다." readonly="readonly">
					</div>
					<div class="w3-quarter w3-center">
						<label>대학교 등록</label> 
						<input class="w3-button w3-blue-gray" type="button" value="Search" onclick="doModal()">
					</div>
				</div>

				<div class="w3-section">
					<button onclick="Join_close()" type="button" class="w3-button w3-red">Cancel</button>
					<button class="w3-button w3-light-green w3-right" type="submit">Join
						<i class="fa fa-paper-plane"></i>
					</button>
				</div>
			</div>
			
		</div>
	</div>
</form>
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
	function Join_open() {
		document.getElementById("Join").style.display = "block";
	}
	function Join_close() {
		document.getElementById("Join").style.display = "none";
	}
	function Login_open() {
		document.getElementById("Login").style.display = "block";
	}
	function Login_close() {
		document.getElementById("Login").style.display = "none";
	}

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

	// 회원가입시 id, email형식 
	function Join_Check() {
		// 같은 비밀번호인지 확인하기 
		var user_pw = document.getElementById("user_pw").value;
		var user_pw2 = document.getElementById("user_pw2").value;
		var email = document.getElementById("email").value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

		if (user_pw != user_pw2 && exptext.test(email) == true) {
			alert('비밀번호가 틀렸습니다.');
			return false;
		} else if (user_pw == user_pw2 && exptext.test(email) == false) {
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우         
			alert("이메일형식이 올바르지 않습니다.");
			return false;
		} else if (user_pw != user_pw2 && exptext.test(email) == false) {
			alert("이메일형식이과 비밀번호가 틀렸습니다.");
			return false
		}
	}
	// 학교 등록
	function doModal() {
		window.name = "schhol_window";
		var add_sub = window.open('SEARCH_SCHOOL.jsp', '대학교 등록하기',
				'width=500,height=500,location=no,status=no,scrollbars=yes');
	}
	//책 검색하기
	function searchTitle() {
		document.sall.submit();
	}
</script>