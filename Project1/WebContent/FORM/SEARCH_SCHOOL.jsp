<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">

	<h3> 서울 지역 내 대학교</h3>
	<div class="w3-bar w3-border-bottom">
		<button class="tablink w3-bar-item w3-button"
			onclick="search_school(event, 'search_1')">ㄱ - ㄷ</button>
		<button class="tablink w3-bar-item w3-button"
			onclick="search_school(event, 'search_2')">ㄹ - ㅅ</button>
		<button class="tablink w3-bar-item w3-button"
			onclick="search_school(event, 'search_3')">ㅇ - ㅊ</button>
		<button class="tablink w3-bar-item w3-button"
			onclick="search_school(event, 'search_4')">ㅋ -ㅎ</button>
	</div>

	<div id="search_1" class="w3-container book">
		<div class="margintop" style="margin: 20px;"></div>
			<ul>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li1" value="가톨릭대학교(성신)">가톨릭대학교(성신)</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li2" value="가톨릭대학교(성의)">가톨릭대학교(성의)</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li3" value="감리교신학대학교">감리교신학대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li4" value="건국대학교">건국대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li5" value="경기대학교(서울)">경기대학교(서울)</a></li>
			</ul>			
			<ul>				
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li6" value="경희대학교">경희대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li7" value="고려대학교">고려대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li8" value="광운대학교">광운대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li9" value="국민대학교">국민대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li10" value="그리스도대학교">그리스도대학교</a></li>
			</ul>
			<ul>								
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li11" value="덕성여자대학교">덕성여자대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li12" value="동국대학교">동국대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li13" value="동덕여자대학교">동덕여자대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li14" value="디지털서울문화예술대학교">디지털서울문화예술대학교</a></li>
			</ul>	
	</div>

	<div id="search_2" class="w3-container book">
		<div class="margintop" style="margin: 20px;"></div>
			<ul>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li15" value="명지대학교">명지대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li16" value="삼육대학교">삼육대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li17" value="상명대학교">상명대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li18" value="서강대학교">서강대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li19" value="서경대학교">서경대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li20" value="서울과학기술대학교">서울과학기술대학교</a></li>
			</ul>			
			<ul>								
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li21" value="서울교육대학교">서울교육대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li22" value="서울기독대학교">서울기독대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li23" value="서울대학교">서울대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li24" value="서울시립대학교">서울시립대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li25" value="서울여자대학교">서울여자대학교</a></li>
			</ul>
			<ul>								
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li26" value="성공회대학교">성공회대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li27" value="성균관대학교">성균관대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li28" value="성신여자대학교">성신여자대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li29" value="세종대학교">세종대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li30" value="숙명여자대학교">숙명여자대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li31" value="숭실대학교">숭실대학교</a></li>
			</ul>		
	</div>

	<div id="search_3" class="w3-container book">
		<div class="margintop" style="margin: 20px;"></div>
			<ul>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li32" value="연세대학교">연세대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li33" value="연세대학교(원주)">연세대학교(원주)</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li34" value="이화여자대학교">이화여자대학교</a></li>
			</ul>			
			<ul>								
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li35" value="장로회신학대학교">장로회신학대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li36" value="중앙대학교">중앙대학교</a></li>
			</ul>
			<ul>								
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li37" value="총신대학교">총신대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li38" value="추계예술대학교">추계예술대학교</a></li>
			</ul>	
	</div>
	
	<div id="search_4" class="w3-container book">
		<div class="margintop" style="margin: 20px;"></div>
			<ul>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li39" value="한국방송통신대학교">한국방송통신대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li40" value="한국성서대학교">한국성서대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li41" value="한국예술종합학교">한국예술종합학교</a></li>
			</ul>
			<ul>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li42" value="한국외국어대학교">한국외국어대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li43" value="한국체육대학교">한국체육대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li44" value="한성대학교">한성대학교</a></li>
			</ul>
			<ul>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li45" value="한양대학교">한양대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li46" value="한영신학대학교">한영신학대학교</a></li>
				<li><a href="javascript:void(0);" onclick="listValue(this.id);" id="li47" value="홍익대학교">홍익대학교</a></li>
			</ul>
	</div>


<script>
	/* 책 상세보기 내 tab */
	document.getElementsByClassName("tablink")[0].click();
	function search_school(evt, bookName) {
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

	function listValue(li) {
		var li1 = document.getElementById(li);
		alert(li1.getAttribute("value"));
		opener.document.getElementById("user_sch").value = li1
				.getAttribute("value");
		window.close();
	}
</script>





