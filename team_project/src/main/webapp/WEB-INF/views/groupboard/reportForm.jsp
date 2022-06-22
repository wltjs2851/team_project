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
// var userid = window.opener.document.getElementById("userid").value;
// var gno = window.opener.document.getElementById("gno").value;

$(function() {
	var userid = "${userid}";
	var gno = "${gno}";
	
	console.log(userid);
	console.log(gno);
	
	$("#reportUser").text(userid);
	$("#reportGno").text(gno);
	
	$("#btnReport").click(function() {
		console.log("Click");
		
		
		var rep_cause = $(":radio[name='rep_cause']:checked").val();
		console.log(rep_cause);
		var url = "/groupboard/report";
		
		var sData = {
				"userid" : userid,
				"gno" : gno,
				"rep_cause" : rep_cause
		}
		
		$.get(url, sData, function(rData) {
			console.log(rData);
			if(rData == "true") {
				alert("신고 완료");
			}
		});
	});
	
	$("#btnClose").click(function() {
		window.close();
	});
});
</script>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				</div>
				
				<div class="col-md-6">
					<form role="form">
					
						<div>
							<h2><span id="reportGno"></span>번 그룹 <span id="reportUser"></span> 신고</h2>
						</div>
						
						<div class="form-group">
						
							<div><input type="radio" name="rep_cause" value="부적절한 사진 게시">부적절한 사진 게시</div>
							<div><input type="radio" name="rep_cause" value="부적절한 글 게시">부적절한 글 게시</div>
							<div><input type="radio" name="rep_cause" value="불법적인 홍보">불법적인 홍보</div>
							<div><input type="radio" name="rep_cause" value="방정하지 못한 언행">방정하지 못한 언행</div>
							<div><input type="radio" name="rep_cause">기타</div>
							 
							<label for="rep_cause">
								기타
							</label>
							<input type="text" class="form-control" id="rep_cause" name="rep_cause" />
						</div>
						
						<button type="button" id="btnReport" class="btn btn-danger">
							신고하기
						</button>
						<button type="button" id="btnClose" class="btn btn-success">닫기</button>
					</form>
				</div>
				
				
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
</div>


