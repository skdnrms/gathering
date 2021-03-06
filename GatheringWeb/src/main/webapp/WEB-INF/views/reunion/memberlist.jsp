<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>소모임 멤버</title>
<%@ include file="../common/common.jsp"%>
</head>
<body>
	<%@ include file="../common/navigation.jsp"%>
	
	<div class="col-lg-2" id="reunionNavi">
		<c:set var="reunionNaviActive" value="memberlist"></c:set>
		<%@ include file="reunion-navi.jsp"%>
	</div>
	
	<div class="col-lg-8">
	<fieldset>
		<legend>
			<span class="icon-users">&nbsp;회원들</span>
			<ul class="pull-right list-inline">
				<li><font size="2">모임장 </font><span class="badge">홍길동</span></li>
				<li><font size="2">&nbsp;멤버 수 </font><span class="badge">${gathering.gatheringMembersNum}</span></li>
			</ul>
		</legend>
		<c:forEach var="member" items="${gathering.gatheringMembers}">
			<div class="col-xs-6 col-md-3">
				<%-- <a href="${ContextPath}/gathering/group?gid=${member.gid}"> --%>
					<div class="thumbnail gatheringBox">
						<img class="img-rounded" style="width: 80px; height: 80px;"
						src="${ContextPath}/resources/shared/img/member/${member.photo}">
						<div class="caption">
							<h3 class="ellipsis"><nobr>${member.name}</nobr></h3>
							<p class="ellipsis"><nobr>${member.email}</nobr></p>
						</div>
					</div>
				<!-- </a> -->
			</div>
		</c:forEach>
	</fieldset>
	</div>
</body>
</html>