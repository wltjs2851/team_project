<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(function() {
	
	$("#btnSearch").click(function() {
		var query = $("#query").val();
		var url = "/recipe/shoppingRun";
		sendData = {
				"query" : query
		};
		$.get(url, sendData, function(receiveData) {
			var json = receiveData;
			var array = json.items;
			$("#shopping > tbody").empty();
			$.each(json.items, function() {
				var list = "";
				list += "<tr><td id='category'>" + this.category2 + "</td>";
				var title = this.title.replace('<b>', '');
				title = title.replace('</b>', '');
				console.log(title);
				list += "<td id='title'><a class='select'>" + title + "</td>";
				list += "<td id='lprice'>" + this.lprice + "원</td>";
				list += "<td id='maker'>" + this.maker + "</td>";
				list += "<td><a id='link' href='" + this.link + "'>상품 보기 </a><input type='hidden' id='image' value='" + 
					this.image + "'></td></tr>";
				$("#shopping > tbody").append(list);
			});
		});
		
	});
	
	$("#shopping").on("click", ".select", function() {
		var tr = $(this).parent().parent();
		var obj = new Object();
		obj.category = tr.find("td:eq(0)").text();
		obj.title = tr.find("td:eq(1)").text();
		obj.lprice = tr.find("td:eq(2)").text();
		obj.maker = tr.find("td:eq(3)").text();
		obj.link = tr.find("a[id='link']").attr("href");
		obj.image = tr.find("input[id='image']").val();
		window.opener.setProduct(obj);
		window.close();
	});
});
</script>	
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="margin-top: 20px; display:inline-block">
			<div style="display:inline-block; width: 80%">
				<input class="form-control" type="text" id="query" name="query">
			</div>
			<div style="display:inline-block">
				<button class="btn btn-primary" id="btnSearch">검색</button>
			</div>
		</div>

			<div class="col-md-12">
				<table class="table" id="shopping">
					<thead>
						<tr>
							<th>분류</th>
							<th>이름</th>
							<th>가격</th>
							<th>판매원</th>
							<th>링크</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>