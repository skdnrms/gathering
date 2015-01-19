<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>정보</title>
<%@ include file="../../common/common.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#editBtn").click(function(){
			$("#basic").hide( 300, function(){
				$("#editgathering").show(300);	
			});
		});
		
		$("#cansel").click(function(){
			$("#editgathering").hide( 300, function(){
				$("#basic").show(300);	
			});
		});
	});
</script>

</head>
<body>
	<%@ include file="../../common/navigation.jsp"%>
	<div class="col-lg-2" id="reunionNavi">
		<c:if test="${ grade ne null }">
			<c:set var="reunionNaviActive" value="information"></c:set>
			<%@ include file="../reunion-navi.jsp"%>
		</c:if>
	</div>
	<div class="col-lg-8">
		<!-- title -->
		<div class="bs-component">
			<h2>
				Information&nbsp;&nbsp;
				<c:if test="${ grade eq null && gathering.population != gathering.gatheringMembersNum}">
					<input type="button" class="btn btn-primary pull-right" value="가입하기" id="joinBtn"
					onclick="location.href='${ContextPath}/gathering/joinGat?gid=${gathering.gid}'">
				</c:if>
			</h2>
		</div>
		
		<ul class="nav nav-tabs" style="margin-bottom: 15px;">
			<li class="active"><a href="#home" data-toggle="tab">기본정보</a></li>
			<li><a href="#profile" data-toggle="tab">커리큘럼</a></li>
		</ul>
		
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade active in" id="home">
				<%@ include file="basic.jsp"%>
				<c:if test="${ grade eq 'M' }">
					<%@ include file="editgathering.jsp"%>
				</c:if>
			</div>
			<div class="tab-pane fade" id="profile">
				<%@ include file="curriculum.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>