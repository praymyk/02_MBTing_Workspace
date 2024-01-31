<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 인연 찾기</title>

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
        margin-top: 30px;
    }

    .mbtiMatch,
    .randomMatch {
        display: flex;
        flex-direction: column;
        align-items: center;
        border-radius: 10px;
        width: 500px;
        margin: 0px 30px;
    }

    .userPf {
        display: flex;
        align-items: center;
        border-radius: 20px;
        width: 430px;
        height: 160px;
        margin: 20px 0px;
        padding: 10px;
        background-color: rgb(244, 244, 244);   
    }
    
    #userPfImg {
        border-radius: 20px;
        width: 130px;
        height: 130px;
    }

    .userInfo {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-start;
        width: 100%;
        padding: 20px;
    }

    .userName,
    .userIntroduce {
        height: 20px;
        text-align: center;
    }

    .userName {
        font-weight: bold;
        font-size: 18px;
    }

    .chatRequestBtn {
        border: 0;
        border-radius: 10px;
        background-color: pink;
        width: 100%;
        margin-top: 10px;
    }

</style>


</head>

<jsp:include page="../common/header.jsp"/>

<body>



    <div class="wrap">

        <div class="matchList">


            <span class="mbtiMatch ">

                <h2 style="font-family: 'KOTRAHOPE'; margin: 30px 0px;">추천하는 운명의 인연</h2>


                <div class="userPf">

                    <img id="userPfImg" src="./resources/images/ENFJ.png">

                    <div class="userInfo">

                        <p class="userName">임유나</p>
                        <p class="userIntroduce">클라이밍 좋아해요 ㅎㅎ 운동!</p>

                        <button class="chatRequestBtn">채팅 요청하기</button>

                    </div>
                    
                </div>

                <div class="userPf">

                    <img id="userPfImg" src="./resources/images/ENFJ.png">

                    <div class="userInfo">

                        <p class="userName">임유나</p>
                        <p class="userIntroduce">클라이밍 좋아해요 ㅎㅎ 운동!</p>

                        <button class="chatRequestBtn">채팅 요청하기</button>

                    </div>
                    
                </div>

                <div class="userPf">

                    <img id="userPfImg" src="./resources/images/ENFJ.png">

                    <div class="userInfo">

                        <p class="userName">임유나</p>
                        <p class="userIntroduce">클라이밍 좋아해요 ㅎㅎ 운동!</p>

                        <button class="chatRequestBtn">채팅 요청하기</button>

                    </div>
                    
                </div>

                <div class="userPf">

                    <img id="userPfImg" src="./resources/images/ENFJ.png">

                    <div class="userInfo">

                        <p class="userName">임유나</p>
                        <p class="userIntroduce">클라이밍 좋아해요 ㅎㅎ 운동!</p>

                        <button class="chatRequestBtn">채팅 요청하기</button>

                    </div>
                    
                </div>

            </span>

            <span class="randomMatch">

                <h2 style="font-family: 'KOTRAHOPE'; margin: 30px 0px;">랜덤으로 추천하는 인연</h2>
                

                <div class="userPf">

                    <img id="userPfImg" src="./resources/images/INTJ.png">

                    <div class="userInfo">

                        <p class="userName">김밍제</p>
                        <p class="userIntroduce">프로그래밍데 운영 중</p>

                        <button class="chatRequestBtn">채팅 요청하기</button>

                    </div>
                    
                </div>

                <div class="userPf">

                    <img id="userPfImg" src="./resources/images/ENTJ.png">

                    <div class="userInfo">

                        <p class="userName">오진표</p>
                        <p class="userIntroduce">안녕하세요~</p>

                        <button class="chatRequestBtn">채팅 요청하기</button>

                    </div>
                    
                </div>

                <div class="userPf">

                    <img id="userPfImg" src="./resources/images/ESTJ.png">

                    <div class="userInfo">

                        <p class="userName">김민제</p>
                        <p class="userIntroduce">안녕하세용가리</p>

                        <button class="chatRequestBtn">채팅 요청하기</button>

                    </div>
                    
                </div>

                <div class="userPf">

                    <img id="userPfImg" src="./resources/images/ENFJ.png">

                    <div class="userInfo">

                        <p class="userName">밍마씨윋</p>
                        <p class="userIntroduce">인스타 팔로워 600만 명 인플루언서</p>

                        <button class="chatRequestBtn">채팅 요청하기</button>

                    </div>
                    
                </div>

            </span>

        </div>



    </div>

</body>

<script>

</script>

</html>