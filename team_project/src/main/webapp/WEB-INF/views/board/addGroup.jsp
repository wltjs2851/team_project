<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/views/include/header.jsp" %>

<script>
$(function() {
	$("#location").on("change", function() {
		var dno = $("#location").val();
		var url = "/group/getSno/" + dno;
		$("#s_location").empty();
		$.get(url, function(receivedData) {
			$.each(receivedData, function() {
				if(receivedData != null && receivedData != "") {	
					$("#s_location").show();
					$("#sg_location").hide();
					var sgg = "";
					sgg += "<option value=" + this.sno + ">" + this.lname + "</option>";
					console.log("sgg: " + sgg);
					$("#s_location").append(sgg);	
				}
			});
		});
	});
	
	$("#s_location").on("change", function() {
		var dno = $("#location").val();
		var sno = $("#s_location").val();
		var url = "/group/getSgno/" + dno + "/" + sno;
		$.get(url, function(receivedData) {
			console.log(receivedData)
			if(receivedData != null && receivedData != "") {				
				$("#sg_location").removeAttr('style');
				$("#sg_location").empty();
				$("#sg_location").show();
				$.each(receivedData, function() {
					var sgg = "";
					sgg += "<option value=" + this.sgno + ">" + this.lname + "</option>";
					console.log("sgg: " + sgg);
					$("#sg_location").append(sgg);	
				});
			} else {
				$("#sg_location").hide();
			}
		});
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form role="form" action="/group/addGroupRun" method="post" enctype="multipart/form-data">
			${ loginVo }
			<input type="hidden" name="g_leader" id="g_leader" value="${ loginVo.userid }">
				<div class="form-group">
					<label for="g_location">
						지역 
					</label> &nbsp;
<!-- 					select box 스크롤 사용 -->
					<div>
						<div class="col-md-2" style="display: inline-block;">
							<select id="location" name="dno" class="form-control">
								<c:forEach items="${ locationVo }" var="locationVo">
									<option value="${ locationVo.dno }">${ locationVo.lname }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-2" style="display: inline-block;">
							<select id="s_location" name="sno" class="form-control" style="display: none;">
							</select>
						</div>
						<div class="col-md-2" style="display: inline-block;">
							<select id="sg_location" name="sgno" class="form-control" style="display: none;">
							</select>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="g_name">
						그룹 이름
					</label>
					<input type="text" class="form-control" id="g_name" name="g_name"/>
				</div>
				
				<div class="form-group">
					<label for="excercise_type">
						운동 종류
					</label>
					<input type="text" class="form-control" id="excercise_type" name="excercise_type"/>
				</div>
				
				<div class="form-group">
					<label for="g_intro">
						그룹 소개
					</label>
					<input type="text" class="form-control" id="g_intro" name="g_intro"/>
				</div>
				
				<div class="form-group">
					<label for="g_attend">
						참가 인원
					</label>
					<input type="number" class="form-control" id="g_attend" name="g_attend"/>
				</div>
				
				<div>
					 
					<label for="file">
						File input
					</label>
					<input type="file" class="form-control-file" id="file" name="file"/>
					<p class="help-block">
						Example block-level help text here.
					</p>
				</div>
				
				<button type="submit" class="btn btn-primary">
					가입
				</button>
				<br>
				<br>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>