<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        #noticeList {
        	width: 900px;
        	text-align:center; 
        	margin: auto;
        	
        }
        #noticeList>tbody>tr:hover {cursor:pointer;}

        #pagingArea {width:fit-content; margin:auto; margin-top : 50px;}

        #searchForm {
            width:500px;
            margin:auto;
        }
        #searchForm>* {
            margin:5px;
        }
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {width:20%;}

        .content {
            margin-left: 55px;
            margin-top: 70px;
        }
        .btn-primary, .btn-danger {
            width: 100px;
            margin-bottom: 30px;
            
        }
        .btn-danger { margin-left : 10px; }
        #testttt {
        	margin-left : 1010px;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/adminMenubar.jsp" />

    <div class="content">
        <div class="search">
            <form id="searchForm" action="search.no" method="get">
                <div style="display: flex; align-items: center; margin-top: 40px">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search" id="searchbar" name="keyword">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </div>
            </form>
        </div>
        <div class="innerOuter" style="padding:1% 8%;">
        	<div id="testttt">
            <button type="button" class="btn btn-primary" onclick="location.href='enrollForm.no'">등록</button>
            <button type="button" class="btn btn-danger">삭제</button>
            </div>
            <table id="noticeList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th><input type="checkbox" class="checkbox"></th>
                        <th>순번</th>
                        <th>제목</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody id="searchResultBody">
                    <c:forEach var="n" items="${ requestScope.list }">
                        <tr>
                            <th><input type="checkbox" class="checkbox"></th>
                            <th class="nno">${ n.noticeNo }</th>
                            <th>${ n.noticeTitle }</th>
                            <th>${ n.views }</th>
                            <th>${ n.enrollDate }</th>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
       
			
			<script>
			    $(document).ready(function() {
			        $("#noticeList>tbody>tr").click(function() {
			            let nno = $(this).children(".nno").text();
			
			            // AJAX를 이용하여 서버에 조회수 업데이트 요청
			            $.ajax({
			                type: "POST",
			                url: "updateViews.no",
			                data: { "nno": nno },
			                success: function(response) {
			                    // 서버에서 성공적으로 응답받으면 상세화면으로 이동
			                    location.href = "detail.no?nno=" + nno;
			                },
			                error: function(error) {
			                    console.error("Error updating views: ", error);
			                }
			            });
			        });
			    });
			</script>
			
            <div id="pagingArea">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${ requestScope.pi.currentPage eq 1 }">
                            <li class="page-item disabled">
                                <a class="page-link" href="#">Previous</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="list.no?cpage=${ requestScope.pi.currentPage - 1 }">Previous</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach var="p" begin="${ requestScope.pi.startPage }" end="${ requestScope.pi.endPage }" step="1">
                        <li class="page-item">
                            <a class="page-link" href="list.no?cpage=${ p }">${ p }</a>
                        </li>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
                            <li class="page-item disabled">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="list.no?cpage=${ requestScope.pi.currentPage + 1 }">Next</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
