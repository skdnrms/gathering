<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<%@ include file="../common/common.jsp"%>
<script type="text/javascript">
	$(function(){
		$( "body" ).on( "blur", "#email", function( event ) {
			var email = $("#email").val();
			if(email.length > 0) {

				var request = $.ajax({
					url: "userfilter.ajax"
					, type: "post"
					, data: {"email" : email}
					, datatype: "html"
				});
				
				request.done(function(data) {
					if(data == "failId") {
						$("#useableId").empty();
						$("#useableId").append("<span class='icon-blocked'></span>");
						$("#useableId").removeClass("text-success").addClass("text-danger").append("중복된 이메일 입니다");
					} else if(data == "useableId") {
						$("#useableId").empty();
						$("#useableId").append("<span class='icon-checkmark'></span>");
						$("#useableId").removeClass("text-danger").addClass("text-success").append("사용 가능한 이메일입니다");
					}
				});
			} else {
				alert("아이디를 입력하세요");
			}
			
		});
		
		$( "body" ).on( "submit", "#userInfoForm", function( event ) {
				  
				var isInputName = $("#useableId").hasClass( "text-success" );
			
			  	if (isInputName) {
			  		return;
			  	} else {
			  		event.preventDefault();
					$("#email").focus();
				}
			  	
			});
	});
</script>
<script src="${ContextPath}/resources/shared/js/location.js"></script>
</head>
<body>
	<div class="col-lg-4 col-lg-offset-4">
		<div class="bs-component">
			<h2 align="center">소모임에 가입하세요.</h2>
		</div>
		<form class="bs-component" method="post" action="${ContextPath }/registMember.do" id="userInfoForm">
			<div class="form-group">
				<label class="control-label" for="inputDefault">이메일</label>
				<label class="pull-right" id="useableId"></label>
				<input type="email" class="form-control" id="email" name="email" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="inputDefault">비밀번호</label> 
				<input type="password" class="form-control" name="password" required>
			</div>
			
			<div class="form-group">
				<label class="control-label" for="inputDefault">이름</label> 
				<input type="text" class="form-control" name="name" required>
			</div>
			
			<div class="form-group">
				<label class="control-label" for="inputDefault">전화번호</label> 
				<input type="tel" class="form-control" name="phone" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="inputDefault">성별</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				남 <input type="radio" name="gender" value="m">
				&nbsp;
				여 <input type="radio" name="gender" value="f">
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col-md-6 col-xs-6">
						<label class="control-label" for="inputDefault">생일</label>
						<input class="form-control" type="date" name="userBirthday" required>
					</div>
					<div class="col-md-6 col-xs-6">
						<label class="control-label" for="inputDefault">지역</label>
						<select class="form-control" name="location" id="location" >
						</select>
					</div>
				</div>
			</div>
			<input type="submit"  style="margin-bottom:10px" 
			class="btn btn-primary btn-lg col-xs-12"  id="joinBtn" value="가입하기">
		</form>
		<!-- 
		<form action="registPhoto.do" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label" for="inputDefault">이미지</label> 
				<input type="file" class="form-control" name="photo" size="20">
			</div>
			<input type="submit" value="저장">
		</form>
		 -->
	</div>
</body>
</html>