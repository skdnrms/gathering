<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style type="text/css">
	.icons {font-size:20px;}
</style>	

<div class="row" id="basic">
	<br>
	<div class="col-md-4 text-center">
		<img src="${ContextPath}/resources/shared/img/group/${gathering.photo}"
			style="width: 200px; height: 200px" class="img-circle">
	</div>
	<div class="col-md-8">
		<div class="row">
			<div class="col-xs-12">
				<c:if test="${ grade eq 'M'}">
					<button id="editBtn" type="button" class="pull-right btn btn-default">
						<span class="glyphicon glyphicon-pencil"></span>
					</button>
				</c:if>
				<font size="7">${gathering.name}</font>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-12">
				<p>${gathering.introduction}</p>
				<div class="row">
					<div class="col-xs-8">
						<ul class="list-inline">
							<li><span class="icons icon-book"></span><span> ${gathering.fieldFormat}</span></li>
						</ul>
						<ul class="list-inline">
							<li><span class="icons icon-calendar"></span><span> ${gathering.startDateFormat} ~ ${gathering.endDateFormat}</span></li>
						</ul>
					</div>
					<div class="col-xs-4">
						<!-- Progress bars -->
						<div class="clearfix"  style="margin-bottom: 5px;">
						<span class="pull-left icons icon-users2"></span> 
							<span class="pull-right">${gathering.gatheringMembersNum} / <span id="gatPopulation">${gathering.population}</span></span>
						</div>
						<div class="progress xs">
							<span class="progress-bar" style="width:${(gathering.gatheringMembersNum / gathering.population) * 100}%;"></span>
						</div>
					</div>
				</div>
				<ul class="list-inline">
					<li><span class="icons icon-map2""></span><span id="gatLocation"> ${gathering.location}</span></li>
					<li><span class="icons icon-clock"></span><span> ${gathering.time}</span></li>
					<li><span class="icons icon-calendar2"></span><span> ${gathering.dateFormat}</span></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<input id="gatDate" type="hidden" value="${gathering.date}"/>
