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
    <title>MBTIng - 만남후기 수정</title>

    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>

    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    
    <style>
        .outer {
            width: 100%;
            margin: auto;
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
        form {
            width: 1200px;
            margin: auto;
        }
        .writereview-title {
            width: 300px;
            font-size: large;
            font-weight: bold;
        }
        .writereview-title input {
            width: 250px;
            border: none;
            border-bottom: 2px solid pink;
            font-family: 'NanumSquare';
        }
        .writereview-content {
            font-size: large;
            font-weight: bold;
        }
        .writereview-content textarea {
            width: 100%;
            height: 500px;
            border-radius: 5px;
            border: 2px solid pink;
            resize: none;
        }
        .writereview-photo {
            width: 1200px;
            text-align: center;
        }
        .writereview-photo img {
            width: 150px;
            height: 150px;
            border-radius: 10px;
        }
        .writereview-photo input {
            font-size: smaller;
        }
        .reviewphoto-table-thumbnail td {
            border: 2px solid pink;
            width: 250px;
            height: 250px;
        }
        .reviewphoto-table-photos td {
            border: 2px dotted pink;
            width: 250px;
            height: 250px;                    
        }
        .reviewupdate-button button {
            width: 90px;
            height: 30px;
            border: none;
            border-radius: 5px;
            background-color: pink;
        }
        .reviewupdate-button button:hover {
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

        <form id="updateForm" method="post" action="update.bo" enctype="multipart/form-data">

            <br>

            <input type="hidden" name="boardNo" value="${ requestScope.b.boardNo }">
            <div class="writereview-title">
                제목&nbsp;&nbsp;<input type="text" id="title" name="boardTitle" value="${ requestScope.b.boardTitle }" maxlength="15" required>
            </div>

            <br>

            <div class="writereview-content">
                내용
                <br>

                <textarea id="content" name="boardContent" maxlength="1300" required>${ requestScope.b.boardContent }</textarea>
            </div>

            <br>

            <div class="writereview-photo" align="left">
                <table>
                    <tr>
                        <td>
                            <table class="reviewphoto-table-thumbnail">
                                <tr>
                                    <td>
                                        <img src="<%= contextPath %>/<%= list.get(0).getChangeName() %>">
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <% for(int i=1; i < list.size(); i++) { %>
                            <td>    
                                <table class="reviewphoto-table-photos">
                                    <tr>
                                        <td>
                                            <img src="<%= contextPath %>/<%= list.get(i).getChangeName() %>">
                                        </td>                                   
                                    </tr>
                                </table>
                            </td>
                        <% } %>
                    </tr>
                </table>
            </div>

            <br>

            <div class="reviewupdate-button" align="right">
                <button type="submit">수정하기</button>
                <button onclick="javascript:history.go(-1);">수정취소</button>
            </div>
        </form>

        <br><br>

    </div>

    <jsp:include page="../common/footer.jsp" />    

</body>
</html>