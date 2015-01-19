<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>소모임 리스트</title>
<%@ include file="../common/common.jsp"%>

<style type="text/css">
	/* 모임 박스의 높이를 지정 */
	.gatheringBox {height:200px;}
	/* 긴문장을 "..."으로 줄이는 설정 */
	.ellipsis {text-overflow:ellipsis; white-space:nowrap; overflow:hidden;}
	/* 모임의 이미지 사이즈를 설정 */
	/* .img-rounded {height:100px ;} */
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$('#accordion').on('shown.bs.collapse', function () {
			$('#searchSpecBtn').removeClass("glyphicon-chevron-down glyphicon-chevron-up").addClass("glyphicon-chevron-up");
		});
		$('#accordion').on('hidden.bs.collapse', function () {
			$('#searchSpecBtn').removeClass("glyphicon-chevron-down glyphicon-chevron-up").addClass("glyphicon-chevron-down");
		});
	});
</script>
<script src="${ContextPath}/resources/shared/js/field.js"></script>
<script src="${ContextPath}/resources/shared/js/location.js"></script>
</head>
<body>
	<c:set var="active" value="gathering"></c:set>
	<%@ include file="../common/navigation.jsp"%>
	<div class="col-lg-8 col-lg-offset-2">
		<!-- title -->
		<legend><span class="icon-feed">&nbsp;Search</span></legend>
		<form class="bs-component" method="post" action="${ContextPath}/gathering/search.do">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row">
							<div class="col-md-1 col-xs-2">
								<h3 class="panel-title">
									<a class="accordion-toggle btn btn-link btn-block" class="accordion-toggle" data-toggle="collapse"
										data-parent="#accordion" href="#collapseOne">
										<span id="searchSpecBtn" class="glyphicon glyphicon-chevron-down"></span>
									</a>
								</h3>
							</div>
							<div class="col-md-11 col-xs-10">
								<div class="input-group">
									<input type="text" class="form-control" name="name" placeholder="Search">
								    <span class="input-group-btn">
										<button class="btn btn-primary">
											<span class="glyphicon glyphicon-search"></span>
										</button>
								    </span>
							    </div>
							</div>
						</div>
					</div>
					<div id="collapseOne" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="row">
								<div class="col-md-3 col-lg-offset-1">
									<label class="control-label" for="inputDefault">지역</label> 
									<select class="form-control" id="location" name="location">
										<option value="null" disabled selected>지역을 선택하세요</option>
									</select>
								</div>
								<div class="form-group col-md-7">
									<label class="control-label" for="inputDefault">분야</label>
									<div class="row">
										<div class="col-md-4 col-xs-4">
											<select class="form-control" id="field1" name="field">
												<option value="null" disabled selected>분야를 선택하세요</option>
												<option value="A01">어학</option>
												<option value="A02">IT</option>
												<option value="A03">취업</option>
												<option value="A04">기타</option>
											</select>
										</div>
										<div class="col-md-4 col-xs-4">
											<select class="form-control" disabled id="field2" name="field">
											</select>
										</div>
										<div class="col-md-4 col-xs-4">
											<select class="form-control" disabled id="field3" name="field">
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3 col-lg-offset-1">
									<label class="control-label" for="inputDefault">시간</label> 
									<select class="form-control" id="time" name="time">
										<option value="null" disabled selected>시간을 선택하세요</option>
										<option value="아침">아침 : 06:00 ~ 12:00</option>
										<option value="점심">점심 : 12:00 ~ 18:00</option>
										<option value="저녁">저녁 : 18:00 ~ 24:00</option>
									</select>
								</div>
								<div class="col-md-7">
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
					</div>
				</div>
			</div>
		</form>
		
		<div class="well well-sm">
			<a href="${ContextPath}/gathering/opengathering"><span class="glyphicon glyphicon-plus">&nbsp;모임만들기</span></a>
		</div>
		
		<c:forEach var="gathering" items="${gatheringList}">
			<div class="col-xs-6 col-md-3">
				<a href="${ContextPath}/gathering/group?gid=${gathering.gid}">
					<div class="thumbnail gatheringBox">
						<img class="img-rounded" src="${ContextPath}/resources/shared/img/group/${gathering.photo}" style="height: 100px;">
						<div class="caption">
							<h3 class="ellipsis"><nobr>${gathering.name}</nobr></h3>
							<p class="ellipsis"><nobr>${gathering.introduction}</nobr></p>
						</div>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>
	
</body>
</html>