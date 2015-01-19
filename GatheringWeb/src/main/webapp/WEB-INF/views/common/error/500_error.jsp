<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../common/common.jsp"%>
	<style type="text/css">
		body { margin-top: 5em;}
	</style>
</head>
<body>

<div class="jumbotron col-lg-offset-1">
	<h1 class="col-lg-offset-2">500 - Error</h1>
	<p class="col-lg-offset-2">로그인이 종료되었습니다. 재접속하세요.</p>
	<p class="col-lg-offset-2"><input type="button" class="btn btn-primary btn-lg" onclick="location.href='${ContextPath}'" value="메인 페이지"></p>
</div>

</body>
</html>