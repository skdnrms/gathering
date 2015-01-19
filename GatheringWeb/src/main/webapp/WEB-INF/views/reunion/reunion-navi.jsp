<!-- 

<div class="col-lg-2">
	<ul class="list-group">
		<li class="list-group-item"><span class="badge"></span><a href="#"> <span>Information</span></a></li>
		<li class="list-group-item"><span class="badge">1</span><a href="#"> Notice</a></li>
		<li class="list-group-item"><span class="badge">1</span><a href="#"> Members</a></li>
		<li class="list-group-item"><span class="badge">2</span><a href="#"> Q & A</a></li>
	</ul>
</div>

-->
<div class="list-group">
	<a href="${ContextPath}/gathering/group?gid=${gathering.gid}" class="list-group-item ${(reunionNaviActive == 'information')?'active':''}"> Information </a>
	<a href="${ContextPath}/gathering/notice?gid=${gathering.gid}" class="list-group-item ${(reunionNaviActive == 'notice')?'active':''}">
	<c:if test="${noticeCnt ne null && noticeCnt ne 0}">	
	<span class="badge" id="noticeCnt">
	${noticeCnt }
	</span> 
	</c:if>
	Notice 
	</a>
	<a href="${ContextPath}/gathering/members?gid=${gathering.gid}" class="list-group-item ${(reunionNaviActive == 'memberlist')?'active':''}"><span class="badge"></span> Members </a>
	<a href="${ContextPath}/gathering/qna?gid=${gathering.gid}" class="list-group-item ${(reunionNaviActive == 'qna')?'active':''}"><span class="badge"></span> QnA </a>
</div>
