<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content {
		margin-left: 200px;
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
	
	<div class="content">
		<br><br>
		<div class="innerOuter">
			<form id="enrollForm" method="post" action="insert.no" enctype="multipart/form-data">
				<table align="center">
					<tr>
						<th><label for="title">제목</label></th>
						<td><input type="text" id="title" class="form-control" name="noticeTitle" required></td>
					</tr>
					<tr>
						<th><label for="content">내용</label></th>
						<td><textarea id="content" class="form-control" cols="90" rows="20" style="resize:none;" name="noticeName" required></textarea></td>
					</tr>
				</table>
				<br>
				
				<div align="center">
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="reset" class="btn btn-danger">취소</button>
				</div>
			</form>
		</div>
		<br><br>

	</div>
</body>
</html>