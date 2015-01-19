<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#addBtn").click(function() {
			$("#curriInfo").append(
					"<div class='curriForm addedForm'>"
					+	"<div class='form-group'>"
					+		"<div class='row'>"
					+			"<div class='col-xs-6 col-md-4'>"
					+				"<input type='date' class='form-control' name='schedule'>"
					+			"</div>"
					+			"<button type='button' class='btn btn-default' onclick='deleteCurri(this)'>"
					+				"<span class='glyphicon glyphicon-trash'></span>"
					+			"</button>"
					+		"</div>"
					+	"</div>"
					+	"<div class='form-group'>"
					+		"<input type='text' class='form-control title' placeholder='제목'>"
					+	"</div>"
					+	"<div class='form-group'>"
					+		"<textarea class='form-control comment' rows='3' placeholder='내용'></textarea>"
					+	"</div>"
					+"</div>");
			
			CurriculumCnt++;
		});
		
		$("#saveBtn").click(function() {
			
			var curriCnt = 0;
			var titles = $(".title");
			var comments = $(".comment");
			
			$(titles).each(function() {
				$(this).prop("name", "curriculums[" + curriCnt + "].title");
				curriCnt++;
			});
			
			curriCnt = 0;
			$(comments).each(function() {
				$(this).prop("name", "curriculums[" + curriCnt + "].comment");
				curriCnt++;
			});
			
			$("#curriInfo").submit();
		});
		
		$("#updateBtn").click(function() {
			
			$("*[readonly]").each(function() {
				$(this).prop("readonly", false);
			});
			
			$("#updateBtn").attr("style", "display:none");
			
			$("#addBtn").attr("style", "display:done");
			$("#savetBtn").attr("style", "display:done");
			$("#cancelBtn").attr("style", "display:done");
			
			$("#accordion").attr("hidden", true);
			$("#blockCurri").attr("hidden", false);
		});
	});
	
	function updateCurri() {
		// hidden 처리된 <div>를 remove() 한다
		// 소모임과 관련된 모든 커리큘럼 delete, 새로운 커리큘럼 insert
		var curriCnt = 0;
		var titles = $(".title");
		var comments = $(".comment");
		
		$(titles).each(function() {
			$(this).attr("name", "curriculums[" + curriCnt + "].title");
			curriCnt++;
		});
		
		curriCnt = 0;
		$(comments).each(function() {
			$(this).attr("name", "curriculums[" + curriCnt + "].comment");
			curriCnt++;
		});
		
		$("#curriInfo").submit();
	}
	
	function cancel() {
		
		$(".addedForm").remove();
		
		$("#updateBtn").attr("style", "display:done");
		
		$("#addBtn").attr("style", "display:none");
		$("#savetBtn").attr("style", "display:none");
		$("#cancelBtn").attr("style", "display:none");
		
		$("#accordion").attr("hidden", false);
		$("#blockCurri").attr("hidden", true);
		
	}
	
	function deleteCurri(element) {
		
		var curriForm = $(element).parents(".curriForm");
		curriForm.remove();
	}
</script>

	<c:choose>
		<c:when test="${grade eq 'M' && curriculums eq null }">
		<blockquote>
			<form class="form-horizontal" id="curriInfo" method="post" action="${ContextPath }/gathering/registCurri.do">
				<div class="curriForm">
				<input type="hidden" value=${gathering.gid } name="gid">
				<div class="form-group">
					<div class="row">
						<div class="col-xs-6 col-md-4">
							<input type="date" class="form-control" name="schedule">
						</div>
					</div>
				</div>
				<div class="form-group">
					<input type="text" class="form-control title" name="curriculums[0].title" placeholder="제목">
				</div>
				<div class="form-group">
					<textarea class="form-control comment" rows="3" name="curriculums[0].comment" placeholder="내용"></textarea>
				</div>
			</div>
			</form>
			<div class="row">
				<div class="col-md-3 col-md-offset-3 pull-right">
					<!-- <input type="button" class="btn btn-default" value="추가" id="addBtn">
					<input type="button" class="btn btn-primary" value="저장하기" id="saveBtn"> -->
					<input type="button" class="btn btn-default pull-right" value="편집하기" id="updateBtn">
				</div>
			</div>
			</div>
		</blockquote>
		</c:when>
		<c:when test="${grade eq 'M' && curriculums ne null }">
		<blockquote hidden="true" id="blockCurri">
			<form class="form-horizontal" id="curriInfo" method="post" action="${ContextPath }/gathering/updateCurri.do">
				<input type="hidden" value=${gathering.gid } name="gid">
				<c:forEach items="${curriculums }" var="curriculum" varStatus="chap">
				<div class="curriForm">
					<div class="form-group">
						<div class="row">
							<div class="col-xs-6 col-md-4">
								<input type="date" class="form-control pull-right" name="schedule" value="${curriculum.formatDate }" readonly>
							</div>
							<button type="button" class="btn btn-default" onclick="deleteCurri(this)">
								<span class="glyphicon glyphicon-trash"></span>
							</button>
						</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control title" value="${curriculum.title }" readonly>
					</div>
					<div class="form-group">
						<textarea class="form-control comment" rows="3" readonly>${curriculum.comment }</textarea>
					</div>
				</div>
				</c:forEach>
			</form>
		</blockquote>
		</c:when>
	</c:choose>
	<c:if test="${curriculums ne null }">
		<div class="panel-group" id="accordion">
			<c:forEach items="${curriculums }" var="curriculum" varStatus="chap">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapse${chap.count }"> ${chap.count })&nbsp;${curriculum.title }</a>
							<c:if test="${curriculum.inProgress }">
							<span class="icon-checkmark pull-right" style="color:green">진행중</span> 
							</c:if>
						</h4>
					</div>
					<div id="collapse${chap.count }" class="panel-collapse collapse">
						<c:if test="${curriculum.formatDate ne '' }">
						<span class="pull-right">시작일:&nbsp;${curriculum.formatDate }</span>
						</c:if>
						<div class="panel-body">${curriculum.comment }</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
	
	<c:if test="${grade eq 'M' }">
		<div class="pull-right" id="btnGroup">
		<c:if test="${curriculums ne null }">
			<input type="button" class="btn btn-default pull-right" value="편집하기" id="updateBtn">
		</c:if>
			<input type="button" class="btn btn-default" style="display:none" value="추가" id="addBtn">&nbsp;
			<input type="button" class="btn btn-primary" style="display:none" value="수정하기" id="savetBtn" onclick="updateCurri()">&nbsp;
			<input type="button" class="btn btn-default" style="display:none" value="취소" id="cancelBtn" onclick="cancel()">&nbsp;
		</div>
	</c:if>
