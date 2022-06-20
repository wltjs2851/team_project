<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>

<script>
$(function() {
	
	$("#btnSearch").click(function() {
		$("#shopping").empty();
		var query = $("#query").val();
		var url = "/recipe/shoppingRun";
		sendData = {
				"query" : query
		};
		$.get(url, sendData, function(receiveData) {
			var json = receiveData;
			var array = json.items;
			console.log(json.items[0].title);
			$.each(json.items, function() {
				var query = "";
				query += "<a href='" + this.link + "'>링크 </a>";
				query += "<img src='" + this.image + "' style='width: 50px'>"
				$("#shopping").append(query);
			});
		});
	});
});
</script>
쇼핑
<div id="shopping">

</div>
<input type="text" id="query" name="query">
<button class="btn" id="btnSearch">검색</button>
<!-- 검색어 입력 후 받아 온 데이터  json parse 이미지 및 가격 띄우기 -->
<!-- https://5sangs.tistory.com/201?category=963858 -->
<%@include file="/WEB-INF/views/include/footer.jsp"%>