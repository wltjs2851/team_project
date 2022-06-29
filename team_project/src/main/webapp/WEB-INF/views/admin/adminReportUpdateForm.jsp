<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
</head>
<style>
.card-title {
	margin-top: 5px;
	margin-bottom: 0px;
}
.card-body {
	width: 100%;
}

.d-flex {
	width: 35%;
	float: left;
}

.userInfo {
	width: 65%;
	float: right;
}

th, td {
	padding: 7px;
}

.groupMember{
	padding: 7px;
}

.hide1 {
	display: none;
}

.hide2 {
	display: none;
}
</style>
<!-- PLUGINS CSS STYLE -->
<link href="/resources/plugins/jquery-ui/jquery-ui.min.css"
	rel="stylesheet">
<!-- Bootstrap -->
<link href="/resources/plugins/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/admin.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	// 신고 내역 처리 닫기 버튼
	$("#btnClose").click(function() {
		window.close();
	});
	
	// 신고 처리
	$("#btnReportUpdateRun").click(function(){
		var userid = "${reportBoardVo.receiver}";
		var rno = "${reportBoardVo.rno}";
		var uno = "${reportBoardVo.uno}";
		var fno = "${reportBoardVo.fno}";
		var rcno = "${reportBoardVo.rcno}";
		var urcno = "${reportBoardVo.urcno}";
		var fcno = "${reportBoardVo.fcno}";
		var recno = "${reportBoardVo.recno}";
		var board = "";
		
		var rbno = "${reportBoardVo.rbno}";
		console.log("신고 처리 버튼 누름");
		var reportRun = $(":radio[name='reportRun']:checked").val();
		console.log("reportRun:", reportRun);
		if (reportRun == "boardDelete"){
			var url = "/admin/removeArticle";
			sendData = {
					"rbno" : rbno,
					"uno" : uno,
					"rno" : rno,
					"fno" : fno,
					"rcno" : rcno,
					"urcno" : urcno,
					"fcno" : fcno,
					"rcno" : rcno,
					"recno" : recno
			}
			$.get(url, sendData, function(rData){
				console.log("delete article:", rData);
				if (rData == "true"){
					alert("해당 게시글 규제 완료");
				window.close();
				}
			});
		} else if (reportRun == "userWarning"){
			console.log("신고받은 회원 경고주기");
			var sender = "admin01";
			var receiver = "${reportBoardVo.receiver}";
			var rep_cause = "${reportBoardVo.rep_cause}";
			
			if (rno > 0){
				board = "식단 게시판";
			} else if (uno > 0 ){
				board = "루틴게시판";
			} else if (fno > 0) {
				board = "자유게시판";
			} else if (rcno > 0) {
				board = "식단게시판 댓글";
			} else if (urcno > 0) {
				board = "루틴게시판 댓글";
			} else if (fcno > 0) {
				board = "자유게시판 댓글";
			} else if (recno > 0) {
				board = "추천운동게시판 댓글";
			}
			
			var message = userid +"님 "+ board +"\u00a0" + "[" + rep_cause;
			if ("${reportBoardVo.rep_etc}" != null && "${reportBoardVo.rep_etc}" != "") {
				message += "사유(${reportBoardVo.rep_etc})"; 
			}
			message += "]로 인해 신고접수 되었습니다.";
			var url = "/admin/userWarning";
			var sData = {
					"rbno" : rbno,
				"receiver" : receiver,
				"sender" : sender,
				"message": message
			};
			$.post(url, sData, function(rData){
				console.log("userWarning:", rData);
				if(rData == "true"){
					alert("회원에게 경고주기 완료");
					window.close();
				}
			});
			console.log(message);
		} else {
			console.log("신고받은 회원 추방");
			var url = "/admin/userOutRun/" + userid;
// 			var sData = {
// 					"userid" : userid
// 			};
			$.get(url,{"rbno" : rbno}, function(rData){
				console.log("userOutResult:", rData);
				if (rData == "true"){
					alert("회원 추방 완료");
					window.close();
				}
			});
			
		}
		var rbno = "${reportBoardVo.rbno}";
// 		var url = "/admin/reportBoardUpdateRun";
		
// 		var sData = {
// 				"rbno" : rbno,
// 				"reportRun" : reportRun,
// 				"receiver" : receiver
// 		}
		
	});
	
	
});
</script>
<%-- ${memberVo } --%>
<body>
	<div class="row" style="margin-top: 20px;">
		<div class="col-md-2"></div>
		<div class="col-md-8" style="margin-left: 20px;">
			<form action="/action_page.php">
			  <p>신고내역 처리하기</p>
			  <div>
				  <input type="radio" id="html" name="reportRun" value="boardDelete">
				  <label for="boardDelete">해당 글/댓글 규제하기</label><br>
				
				  <input type="radio" id="css" name="reportRun" value="userWarning">
				  <label for="userWarning">${reportBoardVo.receiver } 회원 경고</label><br>
				
				  <input type="radio" id="javascript" name="reportRun" value="userOut">
				  <label for="userOut">${reportBoardVo.receiver } 회원 강제 탈퇴</label>
			</div>
			<button type="button" id="btnReportUpdateRun" class="btn btn-outline-danger">
				처리 완료 
			</button>
			<button type="button" id="btnClose" class="btn btn-outline-success">닫기</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</body>
</html>