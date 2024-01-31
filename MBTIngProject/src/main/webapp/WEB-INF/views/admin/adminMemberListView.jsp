<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원관리</title>

    <style>
        /* 회원관리 스타일 */
        #memberList {
            width: 900px;
            font-size: 14px; 
            margin-left: 75px;
            text-align: center;
            margin: auto;
        }
		
        #searchForm {
            width:500px;
    		margin:auto;
            
        }

        .btn-primary {
            margin-left: 1000px;
            margin-bottom: 30px;
        }

        .checkbox {
            margin: auto;
            display: block;
        }

        #wrap {
            margin-left: 70px;
        }

        #pagingArea {
            width: fit-content;
            margin: auto;
            margin-top : 50px;
        }
        #memberList>tbody>tr:hover {cursor:pointer;}
        #toggleSave {
        	margin-top : 20px;
        	margin-bottom : 20px;
        	margin-left : 69%;
        	width:100px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/adminMenubar.jsp" />

<div id="wrap">

    <div class="search">
        <form id="searchForm" action="search.adme" method="get">
            <div style="display: flex; align-items: center; margin-top: 60px">
                <input class="form-control mr-sm-2" type="text" placeholder="Search" id="searchbar" name="keyword">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </div>
        </form>
    </div>
    <button id="toggleSave" type="button" class="btn btn-primary" onclick="updateSelectedStatus();">저장</button>

    <table id="memberList"  class="table table-hover" align="center">
        <thead>
        <th><input type="checkbox" class="checkbox" onclick="toggleAllCheckboxes();"></th>
        <th>순번</th>
        <th>이름</th>
        <th>MBTI</th>
        <th>이메일</th>
        <th>성별</th>
        <th>계정</th>
        <th>상태</th>
        </thead>

        <tbody id="searchResultBody" >
        <c:forEach var="a" varStatus="vs" items="${requestScope.list}">
            <!-- 상태토글 한 회원씩 클릭 가능하게 하는 script -->
            <script>
                var abc = 1;
                var str_${vs.index + 1} = 'switch' + abc;
            </script>

            <tr>
                <th ><input type="checkbox" class="checkbox"></th>
                <th class="amno" data-userNo="${a.userNo}">${a.userNo}</th>
                <th class="detailView" data-userNo="${a.userNo}">${a.userName}</th>
                <th class="detailView" data-userNo="${a.userNo}">${a.mbti}</th>
                <th class="detailView" data-userNo="${a.userNo}">${a.email}</th>
                <th class="detailView" data-userNo="${a.userNo}">${a.gender}</th>
                
                <c:choose>
				    <c:when test="${not empty a.orderDate}">
				        <th>프리미엄</th>
				    </c:when>
				    <c:otherwise>
				        <th>일반</th>
				    </c:otherwise>
				</c:choose>
                
                <th>
                    <div class="custom-control custom-switch">
                        <input type="checkbox" class="custom-control-input toggle" onchange="toggleStatus(switch${a.userNo})"
                               id="switch${a.userNo}" ${a.status == 'Y' ? 'checked' : ''}>
                        <label class="custom-control-label" for="switch${a.userNo}"></label>
                    </div>
                </th>
            </tr>
            <tr>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    
    <script>
    // JavaScript로 클릭 이벤트 처리
    document.querySelectorAll('.detailView').forEach(title => {
        title.addEventListener('click', function() {
            const userNo = this.getAttribute('data-userNo');
            const cpage = ${requestScope.pi.currentPage};
            window.location.href = '${pageContext.request.contextPath}/detail.adme?userNo=' + userNo + '&currentPage=' + cpage;
       
        });
    });
    
    function toggleStatus(checkbox) {
        // 체크박스의 상태 확인
        const isChecked = checkbox.checked;
        const checkboxId = checkbox.id;
        const [, switchString, switchNumber] = checkboxId.match(/^(switch)(\d+)$/);
        console.log('체크된 체크박스의 아이디: ' + switchNumber);
		let check = "";	
        // isChecked 값에 따라 원하는 작업 수행
        if (isChecked) {
        	check = "Y";
            alert('정상');
        } else {
        	check = "N";
            alert('회원 정지 완료');
        }
        $.ajax({
        	url : "update-status",
        	method : "get",
        	data : {
        		"status" : check,
        		"userNo" : switchNumber
        	},
        	success : function(result) {
        		console.log(result);
     			console.log("성공공공");
     		},
     		error : function() {
     			console.log("실패패패");
     		}
        	
        })
    }
       /*  // 체크박스의 상태 확인
        const isChecked = checkbox.checked;

        // 체크된 회원의 userNo 가져오기
        const userNo = checkbox.getAttribute('data-userNo');

        // AJAX를 사용하여 서버로 데이터 전송
        const xhr = new XMLHttpRequest();
        const url = 'update-status?userNo=' + userNo + '&isChecked=' + isChecked;
        xhr.open('GET', url, true);
        xhr.onload = function () {
            if (xhr.status === 200) {
                console.log('서버 응답 성공');
            } else {
                console.error('서버 응답 실패');
            }
        };
        xhr.send();

        // 폼 전송 방지
        return false;
    } */
    
    
    
    /*
    function toggleStatus(checkbox) {
    	
    	 // 체크박스의 상태 확인
        const isChecked = checkbox.checked;
		
     	// 체크된 회원의 userNo 가져오기
        const userNo = checkbox.getAttribute('data-userNo');
    	 
     	$.ajax({
     		url = 'update-status?userNo=' + userNo + '&isChecked=' + isChecked;
     		type : "get",
     		data : {"userNo", userNo},
     		success : function() {
     			console.log("성공공공");
     		},
     		error : function() {
     			console.log("실패패패");
     		}
     		
     	});
     	
        // isChecked 값에 따라 원하는 작업 수행
        if (isChecked) {
            alert('checked');
        } else {
            alert('not checked');
        }
		
    }
    function toggleStatus(checkbox) {
        // 체크박스의 상태 확인
        const isChecked = checkbox.checked;

        // 체크된 회원의 userNo 가져오기
        const userNo = checkbox.getAttribute('data-userNo');

        // AJAX를 사용하여 서버로 데이터 전송
        const xhr = new XMLHttpRequest();
        const url = 'update-status?userNo=' + userNo + '&isChecked=' + isChecked;
        xhr.open('GET', url, true);
        xhr.onload = function () {
            if (xhr.status === 200) {
                console.log('서버 응답 성공');
            } else {
                console.error('서버 응답 실패');
            }
        };
        xhr.send();

        // 폼 전송 방지
        return false;
    }
	*/
    
    	
    	/* 
    	var toggle = document.getElmentByName('toggle').value;
    	console.log(toggle); */
    	
    	/* $.ajax({
    		url : "toggleStatus.adme",
    		type : "get",
    		data : "",
    		function success() {
    			
    			let value = document.getElementsByClassName('toggle').value;

    	    	console.log(value);
    		},
    		function error() {
    			console.log("실패");
    		}
    	}); */
    	
	</script>

    <div id="pagingArea">
    <ul class="pagination">
        <c:choose>
            <c:when test="${requestScope.pi.currentPage eq 1}">
                <li class="page-item disabled">
                    <a class="page-link" href="#">Previous</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="list.adme?cpage=${requestScope.pi.currentPage - 1}">Previous</a>
                </li>
            </c:otherwise>
        </c:choose>
        
        <c:forEach var="p" begin="${requestScope.pi.startPage}" end="${requestScope.pi.endPage}" step="1">
            <li class="page-item">
                <a class="page-link" href="list.adme?cpage=${p}">${p}</a>
            </li>
        </c:forEach>
        
        <c:choose>
            <c:when test="${requestScope.pi.currentPage eq requestScope.pi.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link" href="#">Next</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="list.adme?cpage=${requestScope.pi.currentPage + 1}">Next</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>


    <!-- 체크박스 전체 설정/해제 -->
    <script>
    // 체크박스 전체 설정/해제 및 회원 저장
    function toggleAllCheckboxes() { //전체 회원을 클릭한 상태
        // 체크박스 상태 가져오기
        var isChecked = document.querySelector('.checkbox').checked;
		//isChecked에는 true라는 값이 담김.
		
		//console.log("isChecked" + isChecked);
        // 모든 체크박스 상태 변경
        
        var checkboxes = document.querySelectorAll('.checkbox');
        //=> [object HTMLInputElement] => checkbox인 전체 선택의 
        // 7개 input요소가 담김. 
        //var checkboxArray = [...checkboxes];
        //console.log("checkboxArray" + checkboxArray);
        
        checkboxes.forEach(
        		function (checkbox) { //checkboxes 안에 있는 checkbox요소들 
            		checkbox.checked = isChecked;
        		    //=> 그 checkbox의 checked 속성을 true 값으로 넣어준다는 뜻. 
        });
        
        var checkboxArray = [...checkboxes];
        console.log(document.querySelector('checkboxArray').checked);
        
        // 체크된 회원들의 상태를 서버로 전송
        //updateSelectedStatus(); 
    }
    
    

    </script>
</div>

</body>
</html>