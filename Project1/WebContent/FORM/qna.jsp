<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Q&A -->
<hr id="Q&A">
<div class="w3-container w3-content w3-padding-64"
	style="max-width: 800px" id="contact">
	<h2 class="w3-wide w3-center">Q&A</h2>
	<div class="w3-row w3-padding-32">
		<div class="w3-col m6 w3-large w3-margin-bottom">
			<i class="fa fa-map-marker" style="width: 30px"></i> Seoul, Korea<br>
			<i class="fa fa-phone" style="width: 30px"></i> Phone: +82 12345678<br>
			<i class="fa fa-envelope" style="width: 30px"> </i> Email : mail@naver.com<br>
		</div>
		<div class="w3-col m6">
			<form action="" target="_blank">
				<div class="w3-row-padding" style="margin: 0 -16px 8px -16px">
					<div class="w3-half">
						<input class="w3-input w3-border" type="text" placeholder="Name"
							required name="Name">
					</div>
					<div class="w3-half">
						<input class="w3-input w3-border" type="text" placeholder="Email"
							required name="Email">
					</div>
				</div>
				<input class="w3-input w3-border" type="text" placeholder="Message"
					required name="Message">
				<button class="w3-button w3-black w3-section w3-right" type="submit"
					onclick="send()">SEND</button>
			</form>
		</div>
	</div>
</div>
<hr>

<script>
	function send() {
		alert('문의 메세지를 보냈습니다.');
	}
</script>