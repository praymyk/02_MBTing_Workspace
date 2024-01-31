<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, com.kh.mbting.board.model.vo.BoardImg" %>
<% 
    ArrayList<BoardImg> list = (ArrayList<BoardImg>)request.getAttribute("list");
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MBTIng - 만남후기</title>

    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>

    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

    <style>
        .outer {
            width: 100%;
            margin: auto;
            margin-top: 10px;
        }
        .reviewBanner {
            position: relative; 
            width: 100%;
            height: 150px;
            overflow: hidden; 
        }
        .reviewBanner * {
            font-family: 'NanumSquare';
        }
        .reviewBanner h3 {
            position: absolute;
            font-size: 30px;
            font-weight: bold;
            top: 50%;
            left: 50%; 
            transform: translate(-50%, -50%); 
            color: white; 
            z-index: 1; 
        }
        .reviewBanner img {
            width: 100%;
            height: 100%; 
            object-fit: cover; 
        }
        .reviewdetail-top-button {
            width: 1200px;
            margin: auto;
        }
        .reviewdetail-top-button button {
            width: 65px;
            height: 30px;
            border: none;
            border-radius: 5px;
            background-color: pink;
        }
        .reviewdetail-top-button button:hover {
            border: 1px solid pink;
            background-color: white;            
        }
        .reviewdetail-area {
            width: 1200px;
            margin: auto;
        }
        .reviewdetail-table {
            width: 1200px;
        }
        .reviewdetail-table *{
            font-size:large;
        }
        .reviewdetail-table-title {
            font-size: xx-large;
            font-weight: bold;
            font-family: 'NanumSquare';
        }
        .table-underline {
            width: 1200px;
            margin-top: 10px;
            border: 1px solid pink;
        }
        .thumbnail-img {
            width: 33%;
        }
        .reviewdetail-content {
            margin-bottom: 40px;
        }
        .reviewdetail-content p {       
            white-space: pre-wrap;
        }
        .content-img {
            width: 250px;
        }
        .heart-border {
            width : 100px;
            height: 100px;
            padding-top: 15px;
            border: 1px solid lightgray;
            border-radius: 50px;
        }
        .reviewdetail-like {
            font-size: x-large;
            font-weight: bold;
        }
        #checkThumb:hover{
            cursor:pointer;
        }
        .reviewdetail-bottom-button {
            width: 1200px;
            margin: auto;            
        }
        .reviewdetail-bottom-button button {
            width: 65px;
            height: 30px;
            border: none;
            border-radius: 5px;
            background-color: pink;
        }
        .reviewdetail-bottom-button button:hover {
            border: 1px solid pink;
            background-color: white;            
        }
    </style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />

    <div class="outer">
        <div class="reviewBanner">
            <h3>만남후기</h3>
            <img src="./resources/images/NoticeBanner.jpg">
            </div>
        </div>
        
        <br>

        <div class="reviewdetail-top-button" align="right">
            <button onclick="location.href='list.bo';">목록</button>
        </div>

        <br>
        
        <div class="reviewdetail-area">
            <table class="reviewdetail-table">
                <tr>
                    <td class="reviewdetail-table-title">${ requestScope.b.boardTitle }</td>
                    <td align="right">
                        ${ requestScope.b.enrollDate }
                        <br>
                        <i class="fas fa-user"></i>&nbsp;${ requestScope.b.userName }&nbsp;
                        <i class="fas fa-eye"></i>&nbsp;${ requestScope.b.views }&nbsp;
                        <i class="fas fa-heart"></i>&nbsp;${ requestScope.b.thumbCount }
                    </td>
                </tr>
            </table>

            <div class="table-underline"></div>

            <br>

            <div class="reviewdetail-content">

                <br>

                <div align="center">
                    <img src="<%= contextPath %>/<%= list.get(0).getChangeName() %>" class="thumbnail-img">
                </div>
                <table align="center">
                    <tr>
                    <% for(int i = 1; i < list.size(); i++) { %>
                        <td>
                            <img src="<%= contextPath %>/<%= list.get(i).getChangeName() %>" class="content-img">
                        </td>
                    <% } %>
                    </tr>
                </table>

                <br>

                <p style="padding: 20px;">${ requestScope.b.boardContent }</p>
            </div>
            <div class="reviewdetail-like" align="center">
            	<c:if test="${empty sessionScope.loginMember}">
            		<div class="heart-border">
                        <i class="fas fa-heart fa-lg"></i><br>
            		    ${ requestScope.b.thumbCount }
                    </div>
                </c:if>
                <c:if test="${not empty sessionScope.loginMember}">
                    <c:choose>
                        <c:when test="${ checkThumb == 1 }">
                            <div class="heart-border">
                                <div id="checkThumb">
                                    <i class="fas fa-heart fa-lg"></i><br>
                                    ${ requestScope.b.thumbCount }
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="heart-border">
                                <div id="checkThumb">
                                <i class="far fa-heart fa-lg"></i><br>
                                ${ requestScope.b.thumbCount }
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </div>
            <script>
                $(function() {
	                $("#checkThumb").click(function() {
                        $.ajax({
	                    		url     : "changeThumb.bo",  
	                    		type    : "get",
	                    		data    : {
                                    boardNo : ${ b.boardNo },
                                    userNo : ${ sessionScope.loginMember.userNo },
                                    checkThumb : ${ checkThumb },
                                    success : function() {
                                        location.reload();
                                    }
                                },
	                    });
	                });
	            });   
            </script>
            
            <br>

        </div>
        <div class="reviewdetail-bottom-button" align="right">
            <c:if test="${ not empty sessionScope.loginMember and sessionScope.loginMember.userNo eq requestScope.b.userNo }">
				<button onclick="postFormSubmit(1);">수정</button>
                <button onclick="postFormSubmit(2);">삭제</button>
                <form id="postForm" action="" method="post">
                    <input type="hidden" name="bno" value="${ requestScope.b.boardNo }">
                </form>
                <script>
                    function postFormSubmit(num) {
                        if(num == 1) {
                            $("#postForm").attr("action", "updateForm.bo").submit();
                        } else {
                            $("#postForm").attr("action", "delete.bo").submit();
                        }
                    }
                </script>
            </c:if>
        </div>

        <br><br>

    </div>

    <jsp:include page="../common/footer.jsp" />

</body>
</html>