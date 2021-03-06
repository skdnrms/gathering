<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="common/common.jsp"%>
<script src="/GatheringWeb/resources/shared/js/jquery.cookie.js"></script>
<style type="text/css">
		body { 
			/*
			background: url('${ContextPath}/resources/shared/img/group/gathering_rgb.jpg') no-repeat center center fixed;
			background: url('${ContextPath}/resources/shared/img/group/gathering (1).jpg') no-repeat center center fixed;
			background: url('${ContextPath}/resources/shared/img/group/group-people-gathering-around-planet-earth-26999841.jpg') no-repeat center center fixed;
			*/
		  
			background: url('${ContextPath}/resources/shared/img/group/group-people-gathering-around-planet-earth-26999841.jpg') 50% 200px no-repeat #FFF;
			background-size: 700px;
		
		}
		
		.panel-default {
			opacity: 0.9;
			margin-top:30px;
		}
		
		.control-label {
			padding-right:0px;
		}
		
		.form-group.last { margin-bottom:0px; }
</style>
<script type="text/javascript">
	$(document).ready(function() {
		/* $("#loginBtn").click(function() {
			
			var email = $("#email").val();
			var password = $("#password").val();
			
			if(email.length === 0 || password.length === 0) {
				$("#isInfo").text("ID or 비밀번호가 공란입니다.");
			} else {
				var request = $.ajax({
					url: "userfilter.ajax"
					, type: "post"
					, data: {"email" : email, "password" : password}
					, datatype: "html"
				});
				
				request.done(function(data) {
					if(data == "useableId") {
						$("#isInfo").text("등록되지 않은 아이디입니다.");
					} else if(data == "failPassword") {
						$("#isInfo").text("비밀번호가 틀렸습니다");
					} else if(data == "success"){
						location.href="/GatheringWeb";
					} 
				});
			}
		}); */
		
		
		// logIn post ajax 처리
		$( "#LoginForm" ).submit(function( event ) {
			  // Stop form from submitting normally
			  event.preventDefault();
			 
			  // Get some values from elements on the page:
			  var $form = $( this ),
			  	email = $( "#email" ).val(),
			  	password = $( "#password" ).val(),
			    url = $form.attr( "action" );
			  
			  // Send the data using post
			  var posting = $.post( url, { email: email, password: password} );
			 
			  // Put the results in a div
			  posting.done(function( data ) {
				  if(data == "useableId") {
						$("#isInfo").text("등록되지 않은 아이디입니다.");
						$("#isInfo").parent().show("fast");
					} else if(data == "failPassword") {
						$("#isInfo").text("비밀번호가 틀렸습니다");
						$("#isInfo").parent().show("fast");
					} else {
						var isSaveEmail = $( "input:checkbox" ).prop("checked");
						if(isSaveEmail){
							$.cookie("LoginUserEmail", email, { expires : 10 });
						} else {
							$.removeCookie("LoginUserEmail");
						}
						location.href="/GatheringWeb";
					}
			});
		});
		
		// 쿠키에서 이메일 정보 호출
		var saveEmail = $.cookie("LoginUserEmail");
		if ( saveEmail != null ) {
			$( "#email" ).val(saveEmail);			
			$( "input:checkbox" ).prop("checked", true);
		}
	});
</script>
</head>
<body>
	<%-- <div class="col-lg-6 col-lg-offset-4">
		<form class="form-signin" method="post">
			<h2 class="form-signin-heading">소모임</h2>
			<div class="row form-group">
				<div class="col-md-6">
					<input type="email" class="form-control" placeholder="Email address" id="email" name="email" autofocus>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-md-6">
					<input type="password" class="form-control" placeholder="password" id="password" name="password">
				</div>
			</div>
			<br><b><label class="text-warning" id="isInfo"></label></b><br>
			<input type="button" class="btn btn-lg btn-primary" id="loginBtn" value="로그인"><!-- 연결 -->
			<input type="button" class="btn btn-lg btn-warning" value="회원가입" onclick="location.href='${ContextPath}/join'"><!-- 연결 -->
		</form>
	</div> --%>
	
	
	<div class="container">
	    <div class="row">
	        <div class="body col-md-4 col-md-offset-8">
	            <div class="panel panel-default">
	                <div class="panel-heading">
	                    <span class="icon-lock"></span> Login</div>
	                <div class="panel-body">
	                    <form id="LoginForm" class="form-horizontal" role="form" action="${ContextPath}/userfilter.ajax" method="post">
	                    <div class="form-group">
	                        <label for="email" class="col-sm-3 control-label">
	                            Email</label>
	                        <div class="col-sm-9">
	                            <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="password" class="col-sm-3 control-label">
	                            Password</label>
	                        <div class="col-sm-9">
	                            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
	                        </div>
	                    </div>
                        <div class="col-sm-offset-3 col-sm-9" hidden="true">
	                        <span class="icon-blocked" style="color: red;"></span>
	                        <label id="isInfo"></label>
                        </div>
	                    <div class="form-group">
	                        <div class="col-sm-offset-3 col-sm-9">
	                            <div class="checkbox">
	                                <label>
	                                    <input type="checkbox"/>
	                                    Remember me
	                                </label>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="form-group last">
	                        <div class="col-sm-offset-3 col-sm-9">
	                            <button type="submit" id="loginBtn" class="btn btn-success">Sign in</button>
	                            <button type="button" class="btn btn-default" onclick="location.href='${ContextPath}/join'">Regist now</button>
	                        </div>
	                    </div>
	                    </form>
	                </div>
	                <div class="panel-footer">
	                    <!-- Not Registred? <a href="http://www.jquery2dotnet.com">Register here</a> -->
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	
</body>
</html>