<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
<%@ include file="../common/common.jsp"%>
<script type="text/javascript">

	var noticeCnt = 1000; // 아코디언 효과용
	var identifiedNoticeCnt; // 네비게이션 공지사항 숫자 표시용
	
	$(document).ready(function() {
		
		identifiedNoticeCnt = $(".badge.pull-right.noticeAlarm").length;
		
		$("#noticeCnt").val(identifiedNoticeCnt);
		// 공지사항(서버 전송)
		$("#saveBtn").click(function() {
			
			var nid = $("#nid").val();
			var gid = $("#gid").val();
			var title = $("#title").val();
			var comment = $("#comment").val();
			
			if(title.length <= 0 || comment.length <= 0) {
				alert("공란이 존재합니다");
			} else {
				if(nid == 0) {
				var request = $.ajax({
					url: "notice/addNotice.ajax"
					, type: "post"
					, data: {"nid" : nid, "gid" :gid, "title" : title, "comment" : comment}
					, datatype: "html"
				});
				
				request.done(function(data) {
					if(data != null) {
						$("#accordion").append(
								"<div class='panel panel-default'>"
								+	"<div class='panel-heading'>"
								+		"<h4 class='panel-title'>"
							 	+ 		"<a data-toggle='collapse' data-parent='#accordion' href='#collapse" + noticeCnt + "'>" 
							 	+ 			data.title 
							 	+ 		"</a>"
							 	+		"<span class='icon-remove2 pull-right' removeType='nid' removeId="+ data.nid +"> &nbsp; </span>"
							 	+		"<span class='icon-wrench pull-right' data-toggle='modal' data-target=''#myModal'> &nbsp; </span>"
							 	+		"</h4>"
							 	+	"</div>"
							 	+	"<div id='collapse" + noticeCnt + "' class='panel-collapse collapse'>"
							 	+ 		"<div class='panel-body'>" + data.comment + "</div>"
							 	+	"</div>"
							 	+"</div>");

						$("#title").val("");
						$("#comment").val("");
						$("#myModal").modal("hide");
						
						noticeCnt++;
					}
				});
				} else {
					$("#updateNotice").submit();
				}
			}
		});
	});
	
	// 확인된 공지사항의 view 및 ajax 처리
	function hiddenNewTag(element) {
		
		var newNotice = $(element).parents(".panel-title").children(".badge.pull-right.noticeAlarm");
		var noticeInfo = $(element).parents(".panel-title").children("[type='hidden']");
		
		if($(newNotice).text() != "") {
			var nid = $(noticeInfo[0]).val();
			var gid = $(noticeInfo[1]).val();
			
			var request = $.ajax({
				url: "identifiedNotice.ajax"
				, type: "get"
				, data: {"nid" : nid, "gid" : gid}
				, datatype: "html"
			});
		}
		
		$(newNotice).remove();
	}
	
	$(function() {
		// 공지사항 삭제 처리
		$("body").on("click", ".icon-remove2", function() {
			
			var result = confirm('삭제하시겠습니까?');
			if(result) {
				var noticeHide = $(this).parents(".panel.panel-default");
				var type = $(this).attr("removeType");
				var id = $(this).attr("removeId");
				
				$.getJSON("removeNotice.ajax", {
					type : type,
					id : id
				}).done(function(data) {

					// 공지사항을 삭제했을 경우
					if (type == "nid" && data != 0) {
						console.log("qid comin qid : " + data);
						$(noticeHide).hide("slow");
					}
				});
			}
		});
		// 공지사항 업데이트 처리
		$("body").on("click", ".icon-wrench", function() {
			
			var title = $(this).parent(".panel-title").children("a").text();
			var comment = $(this).parents(".panel.panel-default").children(".panel-collapse.collapse").children(".panel-body").text();
			var noticeInfo = $(this).parents(".panel-title").children("[type='hidden']").val();
			
			$("#title").val(title);
			$("#comment").val(comment);
			$("#nid").val(noticeInfo[0]);
			
		});
	});
	
</script>
</head>
<body>
	<%@ include file="../common/navigation.jsp"%>

	<div class="col-lg-2" id="reunionNavi">
		<c:set var="reunionNaviActive" value="notice"></c:set>
		<%@ include file="reunion-navi.jsp"%>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			<form action="${ContextPath }/gathering/notice/updateNotice.do" method="POST" id="updateNotice">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<input class="form-control" type="text" placeholder="제목" id="title" name="title">
				</div>
				<input type="hidden" id="gid" name="gid" value="${gathering.gid }"> 
				<input type="hidden" id="nid" name="nid">
				<div class="modal-body">
					<textarea class="form-control" rows="3" placeholder="내용" id="comment" name="comment"></textarea>
				</div>
			</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="saveBtn">Save</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 본문 -->
	<div class="col-lg-8">
		<fieldset>
		<legend>
			<span class="icon-bullhorn">&nbsp;공지사항</span>
			<c:if test="${grade eq 'M' }">
			<button type="button" class="pull-right btn-xs btn-default" data-toggle="modal" data-target="#myModal">
			글쓰기
			</button>
			</c:if>
		</legend>
		<ul class="nav nav-pills pull-right">
			<li><font size="2">총 누적 회비</font>&nbsp;&nbsp;
			<span class="badge">추후 공지</span></li>
		</ul>
		<!-- Default panel contents -->
		<div class="panel-heading" style="margin-bottom:10px"></div>
		<c:if test="${notices ne null}">
		<div class="panel-group" id="accordion">
			<c:forEach items="${notices }" var="notice" varStatus="chap">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" 
								href="#collapse${chap.count }" onclick="hiddenNewTag(this)">${notice.title }</a> 
							<c:if test="${grade eq 'M' }">
							<span class="icon-remove2 pull-right" removeType="nid" removeId="${notice.nid}"> &nbsp; </span>
							<span class="icon-wrench pull-right" data-toggle="modal" data-target="#myModal"> &nbsp; </span>
							</c:if>
							
							<input type="hidden" value="${notice.nid }">
							<input type="hidden" value="${notice.gid }">
								
							<c:if test="${notice.identified ne true &&  grade ne 'M'}">
								<span class="badge pull-right noticeAlarm">n</span>
							</c:if>
								
							<%-- <span class="pull-right">등록일:&nbsp;${notice.formatDate }</span> --%>
						</h4>
					</div>
					<div id="collapse${chap.count }" class="panel-collapse collapse">
						<div class="panel-body">${notice.comment }</div>
					</div>
				</div>
			</c:forEach>
		</div>
		</c:if>
		</fieldset>
	</div>
</body>
</html>