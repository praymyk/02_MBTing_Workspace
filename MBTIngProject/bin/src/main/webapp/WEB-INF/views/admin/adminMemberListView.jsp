<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원관리</title>

<style>

/* 회원관리 스타일 */
 #member-table{
    width: 1000px;
    margin-left: 100px;
    text-align: center;
 }
 #searchForm{
    width: 450px;
    margin: auto;
    margin-top: 100px;
 }
.btn-primary{
   margin-left: 1000px;;
   margin-bottom: 30px;
}
.checkbox{
    margin: auto;
    display: block;
}
#wrap {
	margin-left: 250px;
    margin-top: 100px;
}
</style>
</head>
<body>
	<jsp:include page="../common/adminMenubar.jsp" />
	
 	<div id="wrap">

        <div class="search">

            <form id="searchForm" action="">
                <div style="display: flex; align-items: center; margin-top: 40px">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search" id="searchbar" name="">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </div>
            </form>

        <form id="" action="list.adme">

            <button type="button" class="btn btn-primary">정지/해제</button>

        <table border="1" id="member-table">
            
            <thead>
                <th><input type="checkbox" class="checkbox" onclick="toggleAllCheckboxes()"></th>
                <th>순번</th>
                <th>이름</th>
                <th>MBTI</th>
                <th>이메일</th>
                <th>
                	<form action="#">
				        <label for="gen"></label>
				        <select name="gender" id="gen">
				            <option value="both">성별</option>
				            <option value="man">남자</option>
				            <option value="woman">여자</option>
				        </select>
				    </form>
                </th>
                <th>상태</th>
                
            </thead>
            <tbody id="searchResultBody">
            	<c:forEach var="a" var="vs" var="str" items="${requestScope.list}">
			    <script>
			        var abc = 1;
			        var ${str} = 'switch' + ${abc};
			    </script>
			
			    <tr>
			        <th><input type="checkbox" class="checkbox"></th>
			        <th class="amno">${a.userNo}</th>
			        <th>${a.userName}</th>
			        <th>${a.mbti}</th>
			        <th>${a.email}</th>
			        <th>${a.gender}</th>
			        <th>
			            <form>
			                <div class="custom-control custom-switch">
			                    <input type="checkbox" class="custom-control-input" 
			                           id="${str}" ${a.status == 'Y' ? 'checked' : ''}>
			                    <label class="custom-control-label" for="${str}"></label>
			                </div>
			            </form>
			        </th>
			    </tr>
			</c:forEach>

            </tbody>
           
        </table>
     </div>
  
    </form>
    
    <!-- 체크박스 전체 설정/해제 -->
    <script>
	    function toggleAllCheckboxes() {
	        // 체크박스 상태 가져오기
	        var isChecked = document.querySelector('.checkbox').checked;
	
	        // 모든 체크박스 상태 변경
	        var checkboxes = document.querySelectorAll('.checkbox');
	        checkboxes.forEach(function (checkbox) {
	            checkbox.checked = isChecked;
	        });
	    }
	</script>
    
	
	
    
    
    
</div>

</body>
</html>
    