<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MBTIng - 만남후기 작성</title>

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
            width: 1200px;
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
        .reviewenroll-button button {
            width: 90px;
            height: 30px;
            border: none;
            border-radius: 5px;
            background-color: pink;
        }
        .reviewenroll-button button:hover {
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

        <form id="enrollForm" method="post" action="insert.bo" enctype="multipart/form-data">

            <br>

            <input type="hidden" id="writer" name="userNo" value="${ sessionScope.loginMember.userNo }">
            <div class="writereview-title">
                제목&nbsp;&nbsp;<input type="text" id="title" name="boardTitle" placeholder="15자 이내로 작성해 주세요." maxlength="15" required>
            </div>

            <br>

            <div class="writereview-content">
                내용
                <br>

                <textarea id="content" name="boardContent" placeholder="내용을 작성해 주세요." maxlength="1300" required></textarea>
            </div>

            <br>

            
            <div class="writereview-photo" align="left">
                <table>
                    <tr>
                        <td>
                            <table class="reviewphoto-table-thumbnail">
                                <tr>
                                    <td>
                                        <img id="thumbImg">

                                        <br><br>

                                        <input type="file" id="file1" multiple name="upfile" onchange="loadImg(this, 1);" required>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>    
                            <table class="reviewphoto-table-photos">
                                <tr>
                                    <td>
                                        <img id="contentImg1">

                                        <br><br>

                                        <input type="file" id="file2" multiple name="upfile" onchange="loadImg(this, 2);">
                                    </td>                                   
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table class="reviewphoto-table-photos">
                                <tr>
                                    <td>
                                        <img id="contentImg2">

                                        <br><br>

                                        <input type="file" id="file3" multiple name="upfile" onchange="loadImg(this, 3);">
                                    </td>                                   
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table class="reviewphoto-table-photos">
                                <tr>
                                    <td>
                                        <img id="contentImg3">
    
                                        <br><br>
    
                                        <input type="file" id="file4" multiple name="upfile" onchange="loadImg(this, 4);">
                                    </td>                                   
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>

            <script>
                $(function() {
                    $("#thumbImg").click(function() {
                        $("#file1").click();
                    });

                    $("#contentImg1").click(function() {
                        $("#file2").click();
                    });

                    $("#contentImg2").click(function() {
                        $("#file3").click();
                    });

                    $("#contentImg3").click(function() {
                        $("#file4").click();
                    });
                });

                function loadImg(inputFile, num) {
                    if(inputFile.files.length == 1) {
                        let reader = new FileReader();
                        reader.readAsDataURL(inputFile.files[0]);
                        reader.onload = function(e) {
                            switch(num) {
                                case 1 : $("#thumbImg").attr("src", e.target.result); break;
                                case 2 : $("#contentImg1").attr("src", e.target.result); break;
                                case 3 : $("#contentImg2").attr("src", e.target.result); break;
                                case 4 : $("#contentImg3").attr("src", e.target.result); break;
                            }
                        };
                    } else {
                        switch(num) {
                            case 1 : $("#thumbImg").attr("src", null); break;
                            case 2 : $("#contentImg1").attr("src", null); break;
                            case 3 : $("#contentImg2").attr("src", null); break;
                            case 4 : $("#contentImg3").attr("src", null); break;
                        }
                    }
                }
            </script>

            <br>

            <div class="reviewenroll-button" align="right">
                <button type="submit">등록하기</button>
                <button onclick="javascript:history.go(-1);">등록취소</button>
            </div>
        </form>
		
		<br><br>
		
    </div>

    <jsp:include page="../common/footer.jsp" />

</body>
</html>