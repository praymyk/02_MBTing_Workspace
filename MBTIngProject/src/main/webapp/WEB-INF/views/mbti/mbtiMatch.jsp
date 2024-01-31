<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 인연 찾기</title>

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">


<style>

    @font-face {
        font-family: 'KOTRAHOPE';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/KOTRAHOPE.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }

    .wrap {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0;
        height: 100%;
        padding: 20px;
    }

    .matchList {
        display: flex;
        justify-content: center;
        height: auto;
        width: 1400px;
        margin-top: 30px;
        margin-bottom: 30px;
    }

    .mbtiMatch,
    .randomMatch {
        display: flex;
        flex-direction: column;
        align-items: center;
        border-radius: 10px;
        width: 500px;
        margin: auto;
        margin: 0px 150px;
    }

    .userPf {
        display: flex;
        align-items: center;
        border-radius: 20px;
        width: 700px;
        height: 300px;
        margin: 20px 0px;
        padding: 10px;
        background-color: rgb(244, 244, 244);   
    }
    
    #userPfImg {
        border-radius: 50%;
        width: 420px;
        height: 250px;
        object-fit: cover;
        margin-right: 10px;
        margin-left: 10px;
        overflow: hidden;
    }

    #userPfImg img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border-radius: 50%;
    }


    .userInfo {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 100%;
        padding: 20px;
    }

    .userName {
        margin: 0;
        padding: 0;
        font-weight: bold;
        font-size: 18px;
        margin-bottom: 5px;
        text-align: start;
    }

    .userIntroduce {
        margin-top: 5px;
        text-align: start;
        margin-left: 15px;
    }

    .chatRequestBtn {
        border: 0;
        border-radius: 10px;
        background-color: pink;
        width: 300px;
        margin-top: 10px;
        cursor: pointer;
        color: white;
        padding: 8px;
        font-size: 14px;
        transition: background-color 0.3s ease;
    }

    .chatRequestBtn:hover {
        background-color: #ff66b2;
    }


</style>
</head>

<jsp:include page="../common/header.jsp"/>

<body>

    <div class="wrap">

        <c:if test="${ not empty sessionScope.alertMsg }">
            <script>
                alertify.alert('Alert', '${ sessionScope.alertMsg }', function(){ alertify.success('Ok'); });
            </script>
            
            <!-- session 의 alertMsg 지우기 -->
            <c:remove var="alertMsg" scope="session" />
        </c:if>
        
        <div class="matchList">
            <span class="mbtiMatch">
                <h2 style="font-family: 'NanumSquareBold'; margin: 30px 0px;">내 운명의 인연</h2>
                
                <c:choose>
                    <c:when test="${not empty requestScope.matchList}">
                        <c:forEach var="u" items="${requestScope.matchList}">
                            <div class="userPf">
                                <img id="userPfImg" src="${pageContext.request.contextPath}${ u.profileImg }">
                                <div class="userInfo" id="userInfo" onclick="clickUser(this);">
                                    <p class="userName">${u.userName} (${u.mbti})</p>
                                    <p class="userIntroduce">${u.introduce}</p>
                                    <input type="hidden" class="clickUserNo" name="" value="${u.userNo}">
                                    <form action="updateMatchRequestList.mb" method="get">
                                        <button type="submit" class="chatRequestBtn">채팅 요청하기</button>
                                        <input type="hidden" name="userNo" value="${ sessionScope.loginMember.userNo }" id="userNo">
                                        <input type="hidden" name="receiverNo" value="${u.userNo}" id="receiverNo">
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p>일치하는 회원이 없습니다.</p>
                    </c:otherwise>
                </c:choose>
            </span>
            
            <span class="randomMatch">
                <h2 style="font-family: 'NanumSquareBold'; margin: 30px 0px;">랜덤으로 추천하는 인연</h2>
                
                <c:choose>
                    <c:when test="${not empty requestScope.randomList}">
                        <c:forEach var="u" items="${requestScope.randomList}">
                            <div class="userPf">
                                <img id="userPfImg" src="${pageContext.request.contextPath}${ u.profileImg }">
                                <div class="userInfo">
                                    <p class="userName">${u.userName} (${u.mbti})</p>
                                    <p class="userIntroduce">${u.introduce}</p>
                                    <form action="updateMatchRequestList.mb" method="get">
                                        <button type="submit" class="chatRequestBtn" >채팅 요청하기</button>
                                        <input type="hidden" name="userNo" value="${ sessionScope.loginMember.userNo }" id="userNo">
                                   <input type="hidden" name="receiverNo" value="${u.userNo}" id="receiverNo">
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p>회원이 없습니다.</p>
                    </c:otherwise>
                </c:choose>
            </span>
        </div>
    </div>

	<jsp:include page="../common/footer.jsp" />

</body>

<script>
    $(document).ready(function() {
        // 채팅 요청하기 버튼 클릭 시
        $(".chatRequestBtn").click(function(e) {
            e.preventDefault();

            // 필요한 데이터 수집
            var form = $(this).closest("form");
            var formData = form.serialize();
		
            //console.log(formData);
            // Ajax 요청
            $.ajax({
                type: "GET",
                url: "updateMatchRequestList.mb",
                data: formData,
                success: function(response) {
                    if (response.success) {
                        // 성공 메시지 표시
                        alertify.alert('Alert', response.message, function() {
                            alertify.success('Ok');
                        });

                        // 채팅 요청하기 버튼 비활성화 및 텍스트 변경
                        var btn = form.find(".chatRequestBtn");
                        btn.prop("disabled", true);
                        btn.css("background-color", "#ccc"); // 회색으로 변경
                        btn.text("수락 대기 중");

                        // 코인 수 업데이트
                        var matchCoin = Number('${sessionScope.matchCoin}') - 1;
                        // 세션의 matchCoin 값을 업데이트하는 코드를 추가해야 합니다.
                        // 예: sessionScope.matchCoin = matchCoin;
                    } else {
                        // 실패 메시지 표시
                        alertify.alert('Alert', response.message, function() {
                            alertify.error('Error');
                        });

                        // 코인 부족 시 처리
                        if (response.message.includes("코인 부족")) {
                            alert("코인이 부족합니다. 코인 충전 후 다시 시도해 주세요.");
                        }
                    }
                },

                error: function() {
                    // 에러 처리
                    alertify.error('Error occurred while processing the request.');
                }
            });
        });
    });
</script>





</html>