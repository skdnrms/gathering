<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>QnA</title>
<%@ include file="../common/common.jsp"%>
	<script type="text/javascript">
		
		// QnA post ajax 처리
		$(function(){
			$( "body" ).on( "submit", "#addQnAForm", function( event ) {
				  // Stop form from submitting normally
				  event.preventDefault();
				 
				  // Get some values from elements on the page:
				  var $form = $( this ),
				  	formGid = $form.find( "#QnAgid" ).val(),
				  	formEmail = $( "#email" ).val(),
				  	formComment = $form.find( "#QnAcomment" ).val(),
				    url = $form.attr( "action" );
				  
				  // 빈문자열 처리
				  if($.trim(formComment).length == 0){
					  $form.find( "#QnAcomment" ).val("");
					  $('#myModal').modal('hide');
					  return;
				  }
				  
				  // Send the data using post
				  var posting = $.post( url, { comment: formComment, gid: formGid, email: formEmail} );
				 
				  // Put the results in a div
				  posting.done(function( QnA ) {
					$('#myModal').modal('hide');
					$("#QnAcomment").val("");
					$("#mediaTitle").after(
									"<div class='addQnA' hidden>"
									+	"<form class='addReplyForm' method='post' action='${ContextPath }/gathering/addReply.ajax'>"
									+		"<div class='media panel panel-default' style='padding: 10px;'>"
									+			"<div class='replyAppend media-body'>"
									+				"<span class='pull-left'><span class='icon-user2'></span> " + QnA.email + "</span>"
									+				"<span class='pull-right'>"
									+					"<span class='icon-remove2'  removeType='qid' removeId=" + QnA.qid + "> &nbsp; </span>"
									+					"<span class='icon-clock'></span> " + QnA.dateFormat + " &nbsp;&nbsp;&nbsp; "
									+					"<a class='replyBtn'><span class='icon-bubbles3'></span>댓글 (<span class='replyLength'>0</span>)</a>"
									+				"</span>"
									+				"<br>"
									+				"<h4 class='media-heading'> " + QnA.comment + "</h4>"
									+				"<div class='replyInput' hidden>"
									+					"<input type='hidden' name='qid' value='" + QnA.qid + "'>"
									+					"<div class='addReplyInput input-group'>"
									+						"<input type='text' name='comment' class='form-control'>"
									+						"<span class='input-group-btn'>"
									+							"<button class='btn btn-default' type='submit'>reply</button>"
									+						"</span>"
									+					"</div><!-- /input-group -->"
									+				"</div>"
									+			"</div>"
									+		"</div>"
									+	"</form>"
									+"</div>");
					
					$( "div:hidden:first" ).slideDown( "slow" );
				});
			});
		});
		
		
		// 답글 post ajax 처리
		$(function(){
			$( "body" ).on( "submit", ".addReplyForm", function( event ) {
				  // Stop form from submitting normally
				  event.preventDefault();
				 
				  // Get some values from elements on the page:
				  var $form = $( this ),
				  	formEmail = $( "#email" ).val(),
				  	formQid = $form.find( "input[name='qid']" ).val(),
				  	formComment = $form.find( "input[name='comment']" ).val(),
				    url = $form.attr( "action" );
				  
				  // 빈문자열 처리
				  if($.trim(formComment).length == 0){
					  $form.find( "input[name='comment']" ).val("");
					  return;
				  }
				  
				  
				  // Send the data using post
				  var posting = $.post( url, { comment: formComment, qid: formQid, email: formEmail} );
				 
				  // Put the results in a div
				  posting.done(function( data ) {
					$form.find( "input[name='comment']" ).val("");
					$form.find( ".addReplyInput" ).before(
								"<div hidden class='media panel panel-default panel-footer' style='padding: 10px;'>"
								+	"<div class='media-body'>"
								+		"<span class='pull-left'><span class='icon-user2'></span> " + data.email + "</span>"
								+		"<span class='pull-right'>"
								+			"<span class='icon-remove2' removeType='rid' removeId=" + data.rid + "> &nbsp; </span>"
								+			"<span class='icon-clock'></span> " + data.dateFormat
								+ 		"</span>"
								+		"<br>"
								+		"<h5 class='media-heading'> " + data.comment + "</h5>"
								+	"</div>"
								+"</div>");
					
					var length = $form.find( ".replyLength" ).text();
					$form.find( ".replyLength" ).text(Number(length)+1);
					$form.find( "div:hidden:first" ).slideDown( "slow" );
				});
			});
		});
		
		
		
		// 답글 클릭시
		$(function() {
			$("body").on("click", ".replyBtn", function() {
				var replyParent = $(this).parents(".replyAppend");
				$(replyParent).children(".replyInput").slideToggle("slow");
			});
		});

		// 질문 및 답글 삭제 처리
		$(function() {
			$("body").on("click", ".icon-remove2", function() {
				var result = confirm('삭제하시겠습니까?', "삭제확인");
				if(result) {
					var QnAHide = $(this).parents(".addQnA");
					var replyHide = $(this).parents(".panel-footer");
					var type = $(this).attr("removeType");
					var id = $(this).attr("removeId");
					
					$.getJSON("qnaRemove.ajax", {
						type : type,
						id : id
					}).done(function(data) {
	
						// 질문을 삭제했을 경우
						if (type == "qid" && data != 0) {
							$(QnAHide).hide("slow");
						}
						// 질문의 답글을 삭제했을 경우
						else if (type == "rid" && data != 0) {
							var length = QnAHide.find(".replyLength").text();
							console.log("length : " + length);
							QnAHide.find(".replyLength").text(Number(length)-1);
							$(replyHide).hide("slow");
						}
					});
				}
			});
		});
	</script>
</head>
<body>
	<%@ include file="../common/navigation.jsp"%>
	
	<div class="col-lg-2" id="reunionNavi">
		<c:set var="reunionNaviActive" value="qna"></c:set>
		<%@ include file="reunion-navi.jsp"%>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<input id="email" type="hidden" value="${userInfo.email}">
			
			<!-- QnA 모달 폼 -->
			<form id="addQnAForm" method="post" action="${ContextPath }/gathering/addQnA.ajax">
				<input id="QnAgid" type="hidden" value="${gathering.gid}">
				<div class="modal-content">
					<div class="modal-body">
						<div class="form-group">
							<textarea id="QnAcomment" class="form-control" rows="3" name="comment" placeholder="내용"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" id="saveBtn" class="btn btn-primary">Save</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<div class="col-lg-8">
		<!-- title -->
		<div class="bs-component">
			<fieldset>
				<legend>Q&A&nbsp;<font size="2">자유롭게 질문하세요</font>
					<button type="button" class="pull-right btn-xs btn-default" data-toggle="modal" data-target="#myModal">
						글쓰기
					</button>
				</legend>
			<div id="mediaTitle"></div>

			<c:forEach var="QnA" items="${QnaList}">
				<div class="addQnA">
					<!-- 댓글 폼 -->
					<form class="addReplyForm" method="post" action="${ContextPath }/gathering/addReply.ajax">
						<div class="media panel panel-default" style="padding: 10px;">
							<!-- <a class="pull-left" href="#">
								<img class="media-object" src="..." alt="..." style="width: 50px">
							</a> -->
							<div class="replyAppend media-body">
								<span class='pull-left'>
									<span class='icon-user2'></span> ${QnA.email}
								</span>
								<span class="pull-right">
									<c:if test="${QnA.email == userInfo.email}">
										<span class='icon-remove2'  removeType="qid" removeId="${QnA.qid}"> &nbsp; </span>
									</c:if>
									<span class="icon-clock"></span> ${QnA.dateFormat} &nbsp;&nbsp;&nbsp;
									<a class="replyBtn" style=""><span class="icon-bubbles3"></span>댓글 (<span class="replyLength">${replyLength[QnA.qid]}</span>)</a>
								</span>
								<br>
								<h4 class="media-heading">${QnA.comment}</h4>
								
								<!-- 댓글영역 -->
								<div class="replyInput" hidden>
									<input type="hidden" name="qid" value="${QnA.qid}">
									
									<c:forEach var="reply" items="${resultReply[QnA.qid]}">
										<div class='media panel panel-default panel-footer' style='padding: 10px;'>
											<!-- <a class='pull-left' href='#'>
												<img class='media-object' src='...' alt='...'>
											</a> -->
											<div class='media-body'>
												<span class='pull-left'><span class='icon-user2'></span> ${reply.email}</span>
												<span class='pull-right'>
													<c:if test="${reply.email == userInfo.email}">
														<span class='icon-remove2' removeType="rid" removeId="${reply.rid}"> &nbsp; </span>
													</c:if>
													<span class='icon-clock'></span>${reply.dateFormat}
												</span>
												<br>
												<h5 class='media-heading'> ${reply.comment}</h5>
											</div>
										</div>
									</c:forEach>
									
									<div class="addReplyInput input-group">
										<input type="text" name="comment" class="form-control">
										<span class="input-group-btn">
											<button class="btn btn-default" type="submit">reply</button>
										</span>
									</div><!-- /input-group -->
								</div>
							</div>
						</div>
					</form>
				</div>
			</c:forEach>
		</fieldset>
		</div>
	</div>
</body>
</html>