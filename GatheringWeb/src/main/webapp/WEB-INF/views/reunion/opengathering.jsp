<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/common.jsp"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->

<script src="${ContextPath}/resources/shared/js/field.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		var firstNameFocus = false;
		$("#name").blur(function() {
			name = $("#name").val();
			
			if (name.trim().length != 0) {
				userUrl = "${ContextPath}/gathering/open.ajax?name=" + name;
				$.getJSON(userUrl, function(info){
					if (info.result == "fail") {
						$(".nameDiv").removeClass( "has-error has-success" ).addClass( "has-error" );
						$("#useableName").empty();
						$("#useableName").append("<span class='icon-blocked'></span>");
						$("#useableName").removeClass("text-danger text-success").addClass("text-danger").append("이름이 존재합니다.");
						if (!firstNameFocus) {
							$("#name").focus();
							firstNameFocus = !firstNameFocus;test
						}
					} else {
						$(".nameDiv").removeClass( "has-error has-success" ).addClass( "has-success" );
						$("#useableName").empty();
						$("#useableName").append("<span class='icon-checkmark'></span>");
						$("#useableName").removeClass("text-danger text-success").addClass("text-success").append("사용가능한 이름입니다.");
					}
				});
			}
		});
		
		$("#openGathering").click(function(){
			var isInputName = $(".nameDiv").hasClass( "has-success" );
			if (isInputName) {
				$("#gatheringForm").submit();
			} else {
				$("#name").focus();
			}
		});
		
		$("#field1").trigger('change');
	});

</script>
<script src="${ContextPath}/resources/shared/js/location.js"></script>
</head>
<body>
	<!-- top navi  -->
	<c:set var="active" value="gathering"></c:set>
	<%@ include file="../common/navigation.jsp"%>

	<div class="col-lg-6 col-lg-offset-3">
		<div class="bs-component">
			<h2 align="center">소모임 개설하기</h2>
		</div><br>
		<form id="gatheringForm" class="bs-component" method="post" action="${ContextPath}/gathering/open.do">
			<div id="nameDiv" class="form-group">
				<label class="control-label" for="name"> 소모임 이름 </label>
				<label class="pull-right" id="useableName"></label>
				<div class="row">
					<div class="nameDiv col-md-12">
						<input type="text" class="form-control" id="name" name="name" required />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label" for="inputDefault">분야</label>
				<div class="row">
					<div class="col-md-4 col-xs-4">
						<select class="form-control" id="field1" name="field">
							<option value="A01">어학</option>
							<option value="A02">IT</option>
							<option value="A03">취업</option>
							<option value="A04">기타</option>
						</select>
					</div>
					<div class="col-md-4 col-xs-4">
						<select class="form-control" id="field2" name="field" disabled>
						</select>
					</div>
					<div class="col-md-4 col-xs-4">
						<select class="form-control" id="field3" name="field" disabled>
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="row">
					<div class="col-md-6">
						<label class="control-label" for="inputDefault">지역</label> 
						<select class="form-control" id="location" name="location"></select>
					</div>
					<div class="col-md-6">
						<label class="control-label" for="inputDefault">시간</label> 
						<input type="time" class="form-control" id="time" name="time">
					</div>
				</div>
			</div>

			<div class="form-group">
				<div class="row">
					<div class="col-md-6">
						<label class="control-label" for="inputDefault">인원수</label> 
						<select class="form-control" id="population" name="population" >
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
							<option>13</option>
							<option>14</option>
							<option>15</option>
							<option>16</option>
							<option>17</option>
							<option>18</option>
							<option>19</option>
							<option>20</option>
						</select>
					</div>
					
					<div class="col-md-6">
						<label class="control-label" for="inputDefault">요일</label>
						<div class="input-group">
							<div class="btn-group btn-group-justified" data-toggle="buttons">
							<!-- 
								btn-style, btn-default, btn-primary, btn-success, btn-info, btn-warning, btn-danger, btn-link
							-->
								<label class="btn btn-success"> 
									<input type="checkbox" value="sun" name="date"> 일
								</label> 
								<label class="btn btn-success"> 
									<input type="checkbox" value="mon" name="date"> 월
								</label> 
								<label class="btn btn-success"> 
									<input type="checkbox" value="tue" name="date"> 화
								</label> 
								<label class="btn btn-success"> 
									<input type="checkbox" value="wed" name="date"> 수
								</label> 
								<label class="btn btn-success"> 
									<input type="checkbox" value="thu" name="date"> 목
								</label> 
								<label class="btn btn-success"> 
									<input type="checkbox" value="fri" name="date"> 금
								</label> 
								<label class="btn btn-success"> 
									<input type="checkbox" value="sat" name="date"> 토
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="row">
					<div class="col-md-6 col-xs-6">
						<label for="startDate">시작 날짜</label> 
						<input type="date" class="form-control" id="startDate" name="startDate_chanage">
					</div>
					<div class="col-md-6 col-xs-6">
						<label for="endDate">종료 날짜</label>
						<input type="date" class="form-control" id="endDate" name="endDate_chanage">
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="row">
					<div class="col-md-12">
						<label class="control-label" for="inputDefault">소개글</label>
						<textarea rows="3" class="form-control" id="introduction" name="introduction"></textarea>
					</div>
				</div>
			</div>
			<input type="button"  style="margin-bottom:10px" 
			class="btn btn-primary btn-lg col-xs-12" id="openGathering" value="소모임 개설하기">
		</form>
	</div>

</body>
</html>