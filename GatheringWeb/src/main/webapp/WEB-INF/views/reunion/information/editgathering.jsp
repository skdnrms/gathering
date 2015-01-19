<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="${ContextPath}/resources/shared/js/location.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		function readURL(input) {
			if(input.files && input.files[0]) {
				
				var reader = new FileReader();
				reader.onload = function(e) {
					
					$("#userPhoto").attr("src", e.target.result);
				};
				
				reader.readAsDataURL(input.files[0]);
			}
		}
		
		$("#photo").change(function() {
			
			readURL(this);
		});
		
 		$("#location").children("option[ value = " + $("#gatLocation").text() + "]" ).prop("selected", true);
 		$("#population").children("option[ value = " + $("#gatPopulation").text() + "]" ).prop("selected", true);
 		
 		var dateArray = $("#gatDate").val().split(',');
 		for (var i = 0; i < dateArray.length; i++) {
 			$("input[value=" + dateArray[i] + "]").parent().trigger("click");
		}
 		
	});
</script>

	<div class="col-lg-12" id="editgathering" hidden="true">
		<form id="gatheringForm" class="bs-component"  enctype="multipart/form-data" method="post" action="${ContextPath}/gathering/update.do">
			<div class="form-group" hidden="true">
				<input type="text" id="gid" name="gid" value="${gathering.gid}">
			</div>
			<div class="form-group">
				<img src="${ContextPath }/resources/shared/img/group/${gathering.photo}" id="userPhoto" width="100" height="100">
			</div>
			<div class="form-group">
				<input type="file" id="photo" name="photoFile">
			</div>
			<div id="nameDiv" class="form-group">
				<div class="row">
					<div class="nameDiv col-md-8">
						<font size="5"><b>${gathering.name}&nbsp;</b></font>
						<span class="icon-book"></span><span> 분야 : ${gathering.fieldFormat}</span>
					</div>
				</div>
			</div>
			

			
			
			<div class="form-group">
				<div class="row">
					<div class="col-md-4">
						<label class="control-label" for="inputDefault">지역</label> 
						<select class="form-control" id="location" name="location"></select>
					</div>
					<div class="col-md-4">
						<label class="control-label" for="inputDefault">시간</label> 
						<input type="time" class="form-control" id="time" name="time" value="${gathering.time}">
					</div>
					
					<div class="col-md-4">
						<label class="control-label" for="inputDefault">요일</label>
						<div class="input-group">
							<div class="btn-group btn-group-justified" id="dayOfWeek" data-toggle="buttons">
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
					<div class="col-md-4">
						<label class="control-label" for="inputDefault">인원수</label> 
						<select class="form-control" id="population" name="population" >
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
						</select>
					</div>
					<div class="col-md-4 col-xs-6">
						<label for="startDate">시작 날짜</label> 
						<input type="date" class="form-control" id="startDate" name="startDate_chanage" value="${gathering.startDateFormat}">
					</div>
					<div class="col-md-4 col-xs-6">
						<label for="endDate">종료 날짜</label>
						<input type="date" class="form-control" id="endDate" name="endDate_chanage" value="${gathering.endDateFormat}">
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="row">
					<div class="col-md-8">
						<label class="control-label" for="inputDefault">소개글</label>
						<textarea rows="3" class="form-control" id="introduction" name="introduction">${gathering.introduction}</textarea>
					</div>
				</div>
			</div>
			<div class="pull-right" style="margin-bottom:10px">
			<input type="submit" class="btn btn-primary btn-lg" id="editGathering" value="수정하기">
			<input type="button" class="btn btn-default btn-lg" id="cansel" value="취소">
			</div>
		</form>
	</div>
