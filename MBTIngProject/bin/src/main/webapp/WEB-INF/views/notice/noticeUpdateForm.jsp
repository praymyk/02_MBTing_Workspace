<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.innerOuter {
		margin-left: 200px;
		margin-top: 100px;
	}
	.form-control {
		margin-left: 30px;
	}
	#title {
	margin-bottom: 10px;
	}
</style>
</head>
<body>

	<jsp:include page="../common/adminMenubar.jsp" />
	
	<div class="innerOuter">
	
	<form id="updateForm" method="post" action="update.no" enctype="multipart/form-data">
		<input type="hidden" name="noticeNo" value="${ requestScope.n.noticeNo }">
		<table align ="center">
			<tr>
				<th><label for="title">제목</label></th>
				<td><input type="text" id="title" class="form-control" value="${ requestScope.n.noticeTitle }" name="noticeTitle" required></td>
			</tr>
			<tr>
				<th><label for="content">내용</label></th>
				<td><textarea id="content" class="form-control" cols="90" rows="20" style="resize:none;" name="noticeName" required>${ requestScope.n.noticeName }</textarea>
			</tr>
		</table>
		<br>
		
		<div align="center">
			<button type="submit" class="btn btn-primary">수정하기</button>
			<button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
		</div>
	
	</form>
	
	</div>
	
	
	
</body>
</html>