<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>메인화면</title>
<%@ include file="../common/common.jsp"%>

<link href="/GatheringWeb/resources/shared/css/fullcalendar.css" rel="stylesheet" type="text/css" />
<link href="/GatheringWeb/resources/shared/css/fullcalendar.print.css" rel="stylesheet" type="text/css" media='print' />

<script src="/GatheringWeb/resources/shared/js/fullcalendar.min.js" type="text/javascript"></script>
<script src="/GatheringWeb/resources/shared/js/gatheringfullcalendar.js" type="text/javascript"></script>

<script type="text/javascript">
	
	var noticeCnt;
	
	$(document).ready(function() {
		
		noticeCnt = $("#noticeCnt").val();
	});
	
	// 공지사항 new 심볼 숨기기 효과
	function deleteNotice(element) {
		
		var noticeInfo = $(element).parents(".alert.alert-dismissable.alert-warning").children("[type='hidden']");
		
		var nid = $(noticeInfo[0]).val();
		var gid = $(noticeInfo[1]).val();
		
		var request = $.ajax({
			url: "gathering/identifiedNotice.ajax"
			, type: "get"
			, data: {"nid" : nid, "gid" : gid}
			, datatype: "html"
		});
		
		--noticeCnt;
		if(noticeCnt === 0) {
			$("#newNoticeAlarm").attr("style", "VISIBILITY:hidden;display:none");
		}
	};	
</script>

<style type="text/css">
	/* 긴문장을 "..."으로 줄이는 설정 */
	.ellipsis {text-overflow:ellipsis; white-space:nowrap; overflow:hidden;}
</style>

</head>
<body>
	<c:set var="active" value="home"></c:set>
	<%@ include file="../common/navigation.jsp"%>
	<div class="col-lg-8 col-lg-offset-2">
		<div class="media">
			<span class="pull-left">
				<c:choose>
					<c:when test="${userInfo.photo eq ''}">
						<img class="media-object img-rounded" 
							src="${ContextPath }/resources/shared/img/member/member-defult.png"
							 style="width: 100px; height: 100px;">				
					</c:when>
					<c:when test="${userInfo.photo ne ''}">
						<img class="media-object img-rounded" 
							src="${ContextPath }/resources/shared/img/member/${userInfo.photo}"
							 style="width: 100px; height: 100px;">
					</c:when>
				</c:choose>
			</span>
			<div class="media-body">
				<h5 class="media-heading">
				<span class="icon-user">&nbsp;${userInfo.name }</span>&nbsp;&nbsp;${birthday }
				</h5>
				<span class="icon-envelope">&nbsp;${userInfo.email }</span><br>
				<span class="icon-location">&nbsp;${userInfo.location }</span>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-lg-6">
			<fieldset>
				<legend><span class="icon-calendar">&nbsp;스터디 일정</span></legend>
				<c:forEach var="registGathering" items="${userInfo.registGatherings }">
					<input class="gatheingGids" type="hidden" value="${registGathering.gid}">
				</c:forEach>
				<!-- THE CALENDAR -->
				<div id="calendar" class="col-xs-12" style="padding-bottom: 20px"></div>
			</fieldset>
			</div>
			<div class="col-lg-6">
			<fieldset>
				<legend>
				<span class="icon-bullhorn">&nbsp;공지사항</span>
				<c:if test="${newNotice ne null }">&nbsp;<span class="badge" id="newNoticeAlarm">new</span></c:if>
				<input type="hidden" value=${noticeCnt } id="noticeCnt">
				</legend>
				<c:forEach var="notice" items="${newNotice}">
				<div class="col-md-12 col-xs-12">
				<div class="alert alert-dismissable alert-warning">
					<input type="hidden" value="${notice.nid }">
					<input type="hidden" value="${notice.gid }">
 					 <button type="button" class="close" data-dismiss="alert" onclick="deleteNotice(this)">×</button>
 					 <h4 class="ellipsis">${notice.title }</h4>
 					 <p class="ellipsis">${notice.comment }</p>
				</div>
				<!-- Danger box -->
				<%-- <div class="box box-solid box-danger">
					<div class="box-header">
						<span class="box-title ellipsis"><nobr>${notice.title }</nobr></span>
						<div class="box-tools pull-right">
							<input type="hidden" value="${notice.nid }">
							<input type="hidden" value="${notice.gid }">
							<button class="btn btn-default btn-sm" data-widget="remove" onclick="deleteNotice(this)">
							<span class="icon-switch"></span>
							</button>
						</div>
					</div>
					<div class="box-body">
						<p>${notice.comment }</p>
					</div>
					<!-- /.box-body -->
				</div> --%>
				<!-- /.box -->
				</div>
				</c:forEach>
				<legend>
				<span class="icon-users">&nbsp;새로운 회원</span>
				</legend>
				<c:forEach var="newMember" items="${newMembers }">
					<div class="media">
					<span class="pull-left">
					<c:choose>
					<c:when test="${newMember.photo ne '' }">
						<img class="media-object img-rounded" 
								src="${ContextPath }/resources/shared/img/member/${newMember.photo}" 
								style="width: 64px; height: 64px;">
					</c:when>
					<c:when test="${newMember.photo eq '' }">
						<img class="media-object img-rounded" 
								src="${ContextPath }/resources/shared/img/member/member-defult.png"
								style="width: 100px; height: 100px;">	
					</c:when>
					</c:choose>
					</span>
					<div class="media-body">
						<h5 class="media-heading">
						<span class="icon-user">&nbsp;${newMember.name }</span>&nbsp;&nbsp;${birthday }
						</h5>
						<span class="icon-envelope">&nbsp;${newMember.email }</span><br>
						<span class="icon-location">&nbsp;${newMember.location }</span>
					</div>
					</div>
				</c:forEach>
		</fieldset>
			</div>
		</div>
		
		<%-- 
		
		<fieldset>
			<legend><span class="icon-calendar">&nbsp;스터디 일정</span></legend>
			<c:forEach var="registGathering" items="${userInfo.registGatherings }">
				<input class="gatheingGids" type="hidden" value="${registGathering.gid}">
			</c:forEach>
			<!-- THE CALENDAR -->
			<div id="calendar" class="col-xs-12 col-md-10 col-md-offset-1"></div>
			<legend><br>
			<span class="icon-bullhorn">&nbsp;공지사항</span>
			<c:if test="${newNotice ne null }">&nbsp;<span class="badge" id="newNoticeAlarm">new</span></c:if>
			<input type="hidden" value=${noticeCnt } id="noticeCnt">
			</legend>
			<c:forEach var="notice" items="${newNotice}">
			<div class="col-md-4 col-xs-12">
				<!-- Danger box -->
				<div class="box box-solid box-danger">
					<div class="box-header">
						<h3 class="box-title"><span class="ellipsis"><nobr>${notice.title }</nobr></span></h3>
						<div class="box-tools pull-right">
							<input type="hidden" value="${notice.nid }">
							<input type="hidden" value="${notice.gid }">
							<button class="btn btn-default btn-sm" data-widget="remove" onclick="deleteNotice(this)">
							<span class="icon-switch"></span>
							</button>
						</div>
					</div>
					<div class="box-body">
						<p>${notice.comment }</p>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			</c:forEach>
			<legend>
			<span class="icon-users">&nbsp;새로운 회원</span>
			<span class="icon-arrow-down2 pull-right"></span>
			</legend>
			<c:forEach var="newMember" items="${newMembers }">
				<div class="media">
				<span class="pull-left"> 
					<img class="media-object img-rounded" 
					src="${ContextPath }/resources/shared/img/member/${newMember.photo}" 
					style="width: 64px; height: 64px;">
				</span>
				<div class="media-body">
					<h5 class="media-heading">
					<span class="icon-user">&nbsp;${newMember.name }</span>&nbsp;&nbsp;${birthday }
					</h5>
					<span class="icon-mail">&nbsp;${newMember.email }</span><br>
					<span class="icon-location">&nbsp;${newMember.location }</span>
				</div>
				</div>
			</c:forEach>
		</fieldset>
		
		 --%>
	</div>
</body>
</html>