<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sell.searchSellDao"%>
<%@ page import="com.sell.searchSellDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-indigo.css">
<link href="style.css" rel="stylesheet" type="text/css">

<div class="blog-masthead">
	<jsp:include page="header.jsp" flush="false" />
</div>

<form class="sell w3-container w3-card w3-padding-32 w3-white"
	target="_blank" method="post" action="inputsell_n.jsp" enctype="Multipart/form-data">
	<div class="w3-main w3-content w3-padding" style="max-width: 1200px; margin-top: 200px">
		<div class="w3-row" id="contact">
			<div class="w3-half w3-teal w3-dark-grey w3-container" style="height: 1300px">
				<div class="w3-padding-64 w3-padding-large">
					<h1>교재 입력하기</h1>
					<p class="w3-opacity">등록할 교재의 기본 정보를 입력하세요.</p>
					<%
						request.setCharacterEncoding("UTF-8");
						String book_title = (String) request.getAttribute("book_title");
						searchSellDto dto = searchSellDao.getInstance().getSearch(book_title);
					%>
					<div class="sell w3-container w3-card w3-padding-32 w3-white">
						<div class="w3-container">
							<div class="w3-section">
								<p>교재 이미지</p>
								<input class="w3-input w3-border w3-round-large" type="file"
									placeholder="사진을 추가해주세요."
									accept='image/jpeg,image/gif,image/png'
									onchange='chk_file_type(this)' name="book_img">
							</div>
							<br>
							<div class="w3-section">
								<p>정가</p>
								<input class="w3-input" style="width: 100%;" type="number" value="<%=dto.getBook_price()%>" name="book_price">
							</div>
							<div class="w3-section">
								<p>책제목</p>
								<input class="w3-input" style="width: 100%;" type="text" value="<%=dto.getBook_title()%>" name="book_title">
							</div>
							<div class="w3-section">
								<p>출판사</p>
								<input class="w3-input" style="width: 100%;" type="text" value="<%=dto.getBook_comp()%>" name="book_comp">
							</div>
							<div class="w3-section">
								<p>저자</p>
								<input class="w3-input" style="width: 100%;" type="text" value="<%=dto.getBook_writer()%>" name="book_writer">
							</div>
							<div class="w3-section">
								<p>발행년도</p>
								<input class="w3-input" style="width: 100%;" type="text" value="<%=dto.getBook_date()%>" name="book_date"
										placeholder="2019년 5월 1일 혁식으로 입력해주세요.">
							</div>
							<div class="w3-section">
								<p>분류</p>
								<input class="w3-input" style="width: 100%;" type="text" value="<%=dto.getBook_group()%>" name="book_group">
							</div>
							<div class="w3-section">
								<p>내용</p>
								<input class="w3-input" type="text"
									value="<%=dto.getBook_content()%>" style="height: 150px;" name="book_content" id="memo">
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="w3-half w3-container w3-theme-d4" style="height: 1300px">
				<div class="w3-padding-64 w3-padding-large">
					<h1>판매 교재 등록</h1>
					<p class="w3-opacity">새로운 교재를 등록할 수 있습니다.</p>
					<div class="sell w3-container w3-card w3-padding-32 w3-white">
						<div class="w3-section">
							<p>판매가</p>
							<input class="w3-input" style="width: 100%;" type="text" name="sell_price">
						</div>
						<div class="w3-section">
							<p>책상태</p>
							<select class="w3-select" name="grade">
								<option value="grade" disabled selected>상태를 선택해주세요.</option>
								<option value="A+">A+ 새상품(미사용)</option>
								<option value="A">A 새상품</option>
								<option value="B+">B+ 거의 새것</option>
								<option value="B">B 중고상품</option>
								<option value="C">C 중고상품(하자있음)</option>
							</select>
						</div>
						<br>
						<div class="w3-section">
							<p>책상태 사진등록</p>
							<input class="w3-input w3-border w3-round-large" multiple="multiple" type="file" placeholder="사진을 추가해주세요."
								accept='image/jpeg,image/gif,image/png' onchange='chk_file_type(this)' name="state_img">
						</div>
						<br>
						<div class="w3-section">
							<p>책상태 메모</p>
							<input class="w3-input" placeholder="책상태 관련 메모를 입력하세요" style="height: 150px;" type="text" name="grade_memo">
						</div>
						<br>
						<div class="w3-section">
							<p>교재전달방법</p>
							
							<input class="w3-check" type="checkbox" name="campus" id="campus" checked="checked" value="캠퍼스에서 직접전달"> 							
							<label>캠퍼스에서 직접전달</label> 
							
							<input class="w3-check" type="checkbox" name="delivery" id="delivery" value="택배발송"> 							
							<label>택배발송</label> 
							
							<input class="w3-check" type="checkbox" name="direct" id="direct" value="기타 직거래"> 							
							<label>기타 직거래</label>
							
						</div>
						<br>
						<div class="w3-section">
							<p>교재전달방법 추가 메모</p>
							<input class="w3-input" placeholder="예시: 택배거래시 택배비 착불 / 서울 종로구 직거래 가능합니다"
								style="height: 150px" type="text" name="del_memo">
						</div>
					</div>
					<button type="submit" class="w3-button w3-card w3-margin-top w3-dark-grey w3-round-large"
						style="width: 100%; height: 50px">등록하기</button>
				</div>
			</div>

		</div>
	</div>
</form>
</body>
<script type="text/javascript">
	function chk_file_type(obj) {
		var file_kind = obj.value.lastIndexOf('.');
		var file_name = obj.value.substring(file_kind + 1, obj.length);
		var file_type = file_name.toLowerCase();

		var check_file_type = new Array();

		check_file_type = [ 'jpg', 'gif', 'png', 'jpeg', 'bmp' ];

		if (check_file_type.indexOf(file_type) == -1) {
			alert('이미지 파일만 선택할 수 있습니다.');
			var parent_Obj = obj.parentNode
			var node = parent_Obj.replaceChild(obj.cloneNode(true), obj);
			return false;
		}
	}
</script>
</html>


