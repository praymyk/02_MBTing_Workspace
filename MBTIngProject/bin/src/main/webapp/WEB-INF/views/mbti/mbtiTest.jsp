<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>연애 MBTI 테스트</title>
    
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
      integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
      crossorigin="anonymous" />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />

      <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>

  <style>

    

    @font-face {
        font-family: 'EASTARJET-Medium';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/EASTARJET-Medium.woff2') format('woff2');
        font-weight: 500;
        font-style: normal;
    }

    @font-face {
        font-family: 'NPSfontBold';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontBold.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }

    body {
      margin: 0;
      height: 100vh;
    }

    article {
        display: flex;
        flex-direction: column;
    }


    .btn {
        background-color: #808080;
        border-color: #808080;
    }

    .question {
        display: none;
    }

    .questionMain {
        font-size: 30px;
        margin-top: 50px;
        text-align: center;
    }

    .result {
        display: none;
        text-align: center;
        align-items: center;
    }

    .subtitle {
        font-weight: bolder;
        text-align: center;
        font-size: 50px;
        margin-bottom: 20px;
    }

    .resulttitle {
        font-weight: bolder;
        text-align: center;
        font-size: 30px;
        margin-bottom: 40px;
    }

    .resultcontent {
        font-size: 30px;
        margin-bottom: 70px;
        font-family: 'EASTARJET-Medium';
        font-size: 20px;
        line-height: 1.5;
        width: 800px;
        text-align: center;
    }

    #img {
        width: 300px;
        margin: 0 auto;
        margin-bottom: 50px;
    }

    .questionMain:before,
    .questionMain:after {
        color: black;
        content: '"';
        font-size: 30px;
    }

    .arrow_box,
    .arrow_downbox {
        position: relative;
        background: #ffffff;
        border: 2px solid #0c0e0f;
        border-radius: 20px 20px 20px 20px;
    }

    .arrow_box:after,
    .arrow_box:before,
    .arrow_downbox:after,
    .arrow_downbox:before {
        top: 100%;
        content: "";
        height: 0;
        width: 0;
        position: absolute;
        pointer-events: none;
    }

    .arrow_box:after {
        left: 90%;
        border-color: rgba(255, 255, 255, 0);
        border-top-color: #ffffff;
        border-width: 10px;
        margin-left: -10px;
    }

    .arrow_box:before {
        left: 90%;
        border-color: rgba(12, 14, 15, 0);
        border-top-color: #0c0e0f;
        border-width: 13px;
        margin-left: -13px;
    }

    .arrow_downbox:after {
        left: 10%;
        border-color: rgba(255, 255, 255, 0);
        border-top-color: #ffffff;
        border-width: 10px;
        margin-left: -10px;
    }

    .arrow_downbox:before {
        left: 10%;
        border-color: rgba(12, 14, 15, 0);
        border-top-color: #0c0e0f;
        border-width: 13px;
        margin-left: -13px;
    }

    .start,
    .result {
        margin-top: 80px;
    }

    .question {
      margin-top: 100px;
    }

    .mt-5 {
        margin-top: 5rem !important;
    }

    .progress-bar {
        background-color: #ff80ab !important;
    }
    

    .text-center {
      font-family: 'NPSfontBold';
    }

    .memberMatch {
      padding: 10px 30px;
      border: 0;
      color: white;
      border-radius: 5px;
      font-family: 'EASTARJET-Medium';
      background-color: #ff7ba7;
    }

    .memberMatch:hover {
      cursor: pointer;
      text-decoration: none;
      background-color: #ff6498;
      color: white;
    }

    #startbtn {
      align-items: center; 
      margin-top: 100px;
      background-color: rgb(255, 119, 219); 
      color: white;
      border: 0;
      border-radius: 5px;
      width: 400px;
      height: 40px;
      font-family: 'EASTARJET-Medium';
    }
    
    #startbtn:hover {
      cursor: pointer;
      background-color: rgb(255, 107, 215);
    }


  .splash-text {
    text-align: center;
    font-size: 50px;
    opacity: 0;
    transform: translateY(-100px);
    transition: opacity 1s, transform 1s;
    position: relative;
    z-index: 1;
  }

  .smoke {
    position: absolute;
    width: 30px;
    height: 30px;
    background-color: #f59fff;
    border-radius: 50%;
    transform: scale(1);
    animation: smokeAnimation 1s ease-out;
  }

  @keyframes smokeAnimation {
    0% {
      transform: scale(1);
      opacity: 0.5;
    }

    100% {
      transform: scale(25);
      opacity: 0;
    }
  }

  .tableImg {
    width: 200px;
  }

  #up,
  #down {
    font-family: 'NPSfontBold';
    color: rgb(91, 91, 91);
    padding: 20px;
    background-color: rgb(245, 245, 245);
    border: 0;
    border-radius: 5px;
    font-size: 20px;
  }

  #up:hover,
  #down:hover {
    color: black;
  }



</style>


  <body>

    <jsp:include page="../common/header.jsp"/>

    <article class="start" style="display: flex; align-items: center;">

        <div class="splash-container" style="margin-top: 20px;">
            <h1 class="mt-5 text-center splash-text">나와 잘맞는 MBTI는 뭘까?</h1>
        </div>

        <button type="button" id="startbtn" onclick="start();"> 연애 테스트 시작하기 </button>

    </article>

    <div class="wrap" style="display: flex; justify-content: center;">

        <article class="question animate__animated animate__fadeIn" style="width: 800px;">

            <div class="progress">
                <div class="progress-bar" role="progressbar"></div>
            </div>

            <h2 id="title" class="questionMain" style="font-family: 'EASTARJET-Medium';">문제</h2>

            <input id="type" type="hidden" value="EI" />

            <div style="display: flex; flex-direction: column; margin-top: 25px;">
                <button id="up" type="button" class="mt-5">Primary</button>
                <button id="down" type="button" class="mt-5">Primary</button>
            </div>

        </article>

        <article class="result animate__animated animate__fadeIn" style="margin-bottom: 50px">

            <h3 id="subTitle" class="subtitle" style="font-family: 'NPSfontBold';">설명</h3>
            <img id="img" alt="item" />
            <h4 class="resulttitle" style="font-family: 'NPSfontBold'; color: #ff7ba7;">연애스타일 특징</h4>

            <div style="display: flex; justify-content: center;">
                <h5 class="resultcontent" id="workexplain" name="연애스타일 특징"></h5>
            </div>

            <div style="display: flex; justify-content: center; margin-bottom: 50px;">
                <table style="font-family: 'EASTARJET-Medium';">
                    <tr>
                        <td width="300" height="40" style="color: rgb(222, 25, 25)">
                            <i class="fas fa-heart"></i> 환상의 궁합
                        </td>
                        <td width="300" height="40" style="color: rgb(116, 116, 116)">
                            <i class="fas fa-heart-broken"></i> 환장의 궁합
                        </td>
                    </tr>
                    <tr>
                        <td height="50" class="goodRel" id="goodRel" style="font-size: 20px" name="잘 맞는 MBTI"></td>
                        <td height="50" class="badRel" id="badRel" style="font-size: 20px" name="안 맞는 MBTI"></td>
                    </tr>
                    <tr>
                        <td>
                            <img class="tableImg" id="goodRelImg" alt="goodRelImg">
                        </td>
                        <td>
                            <img class="tableImg" id="badRelImg" alt="badRelImg">
                        </td>
                    </tr>
                </table>
            </div>

            <a href="mbtiMatch.mb" class="memberMatch">내 인연 만나러 가기!</a>

        </article>


    <input type="hidden" id="EI" value="0" />
    <input type="hidden" id="SN" value="0" />
    <input type="hidden" id="TF" value="0" />
    <input type="hidden" id="JP" value="0" />

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    

    <script>
      var num = 1;
      var q = {
        1: {
          title: "한가한 주말 오후, 전화벨이 울린다.",
          type: "EI",
          up: "(반갑게) 여보세요~ 웬일이야?",

          down: "(망설이다가) 여보세요. 무슨 일이야?",
        },

        2: {
          title: "친구가 소개팅을 주선해 준다고 한다면?",
          type: "JP",
          up: "(깊게 생각하지 않고) 당연히 해야지~ 고마워!",

          down: "(개인 일정 확인 후) 스케줄 괜찮아, 할게.",
        },

        3: {
          title: "전화를 끊은 후, 내 머릿속은?",
          type: "SN",
          up: "'좋은 사람이었으면 좋겠다~' 하고 만다.",

          down: "어떤 상대가 나올지 궁금해하며 결혼까지 상상한다.",
        },

        4: {
          title: "소개팅 만남 코스, 어떻게 하지?",
          type: "JP",
          up: "만나는 장소와 음식 등 계획적으로 준비!",

          down: "만났을 때 즉석에서 정하면 되지~",
        },

        5: {
          title: "약속한 소개팅 시간, 상대방이 지각이라면?",
          type: "JP",
          up: "아니... 약속이 6시인데 왜 안 오시지?",

          down: "저녁시간이라 차가 막히나? 좀 늦으시네.",
        },

        6: {
          title: "카페에서 첫 만남, 나의 행동은?",
          type: "EI",
          up: "엇?! 저랑 같은 핸드폰이시네요? (술술~ 주절주절)",

          down: "(상대가 먼저 말을 걸 때까지 기다린다.)",
        },

        7: {
          title: "맛집에 가서 메뉴를 고를 때, 나의 선택은?",
          type: "SN",
          up: "실패할 일이 없는 안전한 선택을 해야지. 평소에 먹어본 익숙한 메뉴",
          down: "시그니처가 있으면 먹어봐야지! 먹어본 적 없는 시그니처 메뉴",
        },

        8: {
          title: "집에서 반대하는 만남, 어떻게 하시겠어요?",
          type: "TF",
          up: "힘들겠지만 다시 고민해봐야겠죠.",

          down: "제 마음이 더 중요하죠. 부모님을 설득할 거예요!",
        },

        9: {
          title: "평소 주위사람들이 나에게 내리는 평가는?",
          type: "TF",
          up: "솔직하고 논리적인 사람",
          down: "자상하고 섬세한 사람",
        },

        10: {
          title: "소개팅 상대와 간단하게 술을 먹으러 간다. <br>\ 내가 더 선호하는 장소는?",
          type: "EI",
          up: "사람 많고 신나는 술집",
          down: "조용하고 프라이빗한 술집",
        },

        11: {
          title: "집에 가는 길. 좀비가 나타났을 때 <br>\ 어떻게 할 것인지 물어본다면?",
          type: "SN",
          up: "에이, 세상에 좀비가 어딨어요~",
          down: "저는 좀비가 나타난다면 바로 집으로 달려가서...",
        },

        12: {
          title: "오늘 만난 소개팅 상대가 마음에 든다면?",
          type: "TF",
          up: "(그래도 생각할 시간이 필요해) 제가 또 연락드릴게요.",
          down: "(과감하게 밀어 붙이겠어!) 이번 주말에 시간 괜찮으세요?",
        },
      };
      
      //결과
      var result = {
        ISTJ: {
          item: "청렴결백 논리주의자(ISTJ)",
          subTitle: "신중한 거북이 ( ISTJ )",
          workexplain:
            "꼼꼼하고 철두철미한 성향에 리액션 버튼이 고장 난 것처럼 감정 표현은 서툴지만, <br> \
            마음속으론 '사랑해~ 고마워~'를 외치는  내적 사랑 가득한 연애봇이에요. <br> \
            연애도 나만의 원칙에 맞게 계획적으로 차근차근 진행하기 때문에 <br> \
            시작이 다소 느릴 수 있어요. 하지만 눈치가 빨라 상대의 생각을 잘 읽고 <br> \
            맞춰 줘서 한 번 시작하면 갈등 없이 가장 안정적으로 연애를 하는 스타일이기도 해요. <br> \
            나의 계획성과 꼼꼼함을 존중해주고 인정해주는 사람을 만나면 <br> \
            더없이 행복한 연애가 가능할 거예요.",
          goodRel: "활기찬 토끼 ( ESFP )",
          badRel: "열정적인 말 ( ENFJ )",
          goodRelImg: "./resources/images/ESFP.png",
          badRelImg: "./resources/images/ENFJ.png",
          img: "./resources/images/ISTJ.png",
        },

        ISFJ: {
          item: "용감한 수호자(ISFJ)",
          subTitle: "섬세한 곰 ( ISFJ )",
          workexplain:
            "작은 기념일, 이벤트까지 꼼꼼하게 챙기며 연인의 행복을 확실히 서포트하는 사랑덕후예요. <br> \
            상대를 행복하게 해주는 것이 연애의 의무 중 하나라 생각하기 때문이죠. <br> \
            누구보다 아낌없이 사랑을 주는 만큼 때때로 상대의 사랑을 확인하고 싶기도 할 거예요. <br> \
            감정 표현에 서툰 사람을 만나면 내가 주는 만큼 받지 못하는 것 같아 <br> \
            오랫동안 뒤끝이 남을 수도 있어요. 나의 노력을 존중해주고 진심으로 <br> \
            감사할 줄 아는 사람을 만나면 오랫동안 사랑 넘치는 연애를 기대해도 좋아요. <br> \
            남의 눈치를 보는 데에 너무 많은 시간을 쓰지 말고 <br> \
            내 감정부터 충실하게 살피고 표현하는 것도 잊지 마세요.",
          goodRel: "상냥한 사슴 ( INFP )",
          badRel: "활기찬 토끼 ( ESFP )",
          goodRelImg: "./resources/images/INFP.png",
          badRelImg: "./resources/images/ESFP.png",
          img: "./resources/images/ISFJ.png",
        },

        INFJ: {
          item: "선의의 옹호자(INFJ)",
          subTitle: "따뜻한 고래 ( INFJ )",
          workexplain:
            "좋아하는 사람이 다가오면 속으론 행복해해도 겉으론 차갑게 반응하는 연기파예요. <br> \
            이상형은 확실하지만, 표현이 서툴러서 짝사랑과 속앓이를 가장 많이 하는 스타일이기도 해요. <br> \
            하지만 일단 시작하면 삶의 1순위가 연애로 바뀌기 때문에 연애를 방해하는 <br> \
            모든 장애물을 다 부수며 상대에게 올인해요. 표정 관리를 너무 잘해서 <br> \
            상대가 내 마음을 전혀 눈치채지 못할 때도 많을 거예요. 남의 눈치를 보는 데에 <br> \
            너무 많은 시간을 쓰지 말고 내 감정을 조금 더 솔직하게 표현해 보세요. <br> \
            그동안 꿈꿔왔던 연애가 시작될 거예요.",
          goodRel: "날카로운 여우 ( ENTP )",
          badRel: "강력한 사자 ( ESTJ )",
          goodRelImg: "./resources/images/ENTP.png",
          badRelImg: "./resources/images/ESTJ.png",
          img: "./resources/images/INFJ.png",
        },

        INTJ: {
          item: "용의주도한 전략가(INTJ)",
          subTitle: "똑똑한 독수리 ( INTJ )",
          workexplain:
            "호불호 강하고 주관이 뚜렷해서 가치관이나 관심사가 맞지 않으면 관심이 1도 없어요. <br> \
            하지만 전형적인 츤데레 스타일이라 겉보다 속이 훨씬 따뜻해요. 애정표현은 조금 서툴러도 <br> \
            이 사람이다 싶으면 철저하게 분석하고 계획해서 썸에서 연애까지 빠르게 추진해요. <br> \
            덕분에 연애 성공률도 높은 편. 아이디어와 상상력이 넘쳐서 남들이 하지 않는 <br> \
            색다른 데이트를 창조하고 즐기는 경우가 많아요. 연애에서도 완벽을 추구하기 때문에 <br> \
            늘 분석하고 탐구하지만 때로는 마음을 따라가는 게 정답일 때도 있다는 걸 잊지 마세요.",
          goodRel: "ENFP",
          badRel: "섬세한 곰 ( ISFJ )",
          goodRelImg: "./resources/images/ENFP.png",
          badRelImg: "./resources/images/ISFJ.png",
          img: "./resources/images/INTJ.png",
        },

        ISTP: {
          item: "만능 재주꾼(ISTP)",
          subTitle: "재치있는 원숭이 ( ISTP )",
          workexplain:
            "연애도 인생도 일관성 있게 마이웨이! 서로의 생활을 존중하고 구속하지 않는 <br> \
            자유로운 연애를 좋아해요. 연애할 때에도 반드시 혼자만의 시간이 필요하고 <br> \
            그렇지 못하면 스트레스를 받아요. 상대의 감정이나 생각을 잘 읽는 편이지만 <br> \
            마이웨이답게 눈치를 보며 행동하지는 않아요. 처음엔 속마음을 잘 꺼내지 않지만 <br> \
            내 사람이 되었다고 생각하면 박찬호급 투머치토커로 돌변하는 스타일이기도 해요. <br> \
            애정표현이나 스킨십은 다소 소극적인 편이라 좋아하는 사람이 생겨도 티가 잘 안 나요. <br> \
            감정을 먼저 표현하려 조금 더 노력한다면 연애 성공률을 200% 끌어올릴 수 있을 거예요.",
          goodRel: "강력한 사자 ( ESTJ )",
          badRel: "상냥한 사슴 ( INFP )",
          goodRelImg: "./resources/images/ESTJ.png",
          badRelImg: "./resources/images/INFP.png",
          img: "./resources/images/ISTP.png",
        },

        ISFP: {
          item: "호기심 많은 예술가(ISFP)",
          subTitle: "창의적인 고양이 ( ISFP )",
          workexplain:
            "성선설은 나를 보고 나온 말 아닐까? 감정이입 잘하고 선한 성격 덕에 <br> \
            연애에서도 빛과 소금 그 자체인 사람이에요. 공감력 200%로 상대방의 특이 취향까지 <br> \
            존중해 주고 맞춰 주며 긍정에너지를 마구마구 전파해요. 하지만 가끔은 갈등이나 논쟁이 그저 <br> \
            귀찮아서 좋게좋게 넘어갈 때도 있다는 사실! 거절을 잘 못 해서 부탁도 하소연도 잘 들어주지만, <br> \
            상대의 감정만 받아주다 보면 정작 나에게 소홀해질 때도 있을 거예요. <br> \
            내 안에 잠재된 세미관종력을 잘 발휘해서 조금 더 내 감정과 생각을 솔직하게 표현해도 좋아요.",
          goodRel: "활기찬 토끼 ( ESFP )",
          badRel: "열정적인 말 ( ENFJ )",
          goodRelImg: "./resources/images/ESFP.png",
          badRelImg: "./resources/images/ENFJ.png",
          img: "./resources/images/ISFP.png",
        },

        INFP: {
          item: "열정적인 중개자(INFP)",
          subTitle: "상냥한 사슴 ( INFP )",
          workexplain:
            "연애 시작과 동시에 앞으로 행복할 일, 싸울 일, 우울할 일을 미리 상상하고 기뻐하고 <br> \
            걱정하는 스타일이에요. 상대의 감정에 잘 공감해 주지만 내 감정은 잘 표현하지 않아서 <br> \
            막상 좋아하는 사람이 다가와도 철벽을 칠 때가 있어요. 하지만 속으로는 김칫국 한 사발 마시고 <br> \
            점 찍어 뒀던 맛집, 핫플레이스로 데이트 풀코스 계획 완료. 연애를 시작하면 언제 철벽을 쳤는지 <br> \
            기억도 안 날 정도로 애정표현도 스킨십도 적극적으로 하는 편이에요. 나만의 철두철미한 <br> \
            연애 기준 5만 개 중 5천 개 정도만 타협하면 더 빠르게 인연이 다가올지도 몰라요.",
          goodRel: "뛰어난 늑대 ( ENTJ )",
          badRel: "창의적인 고양이 ( ISFP )",
          goodRelImg: "./resources/images/ENTJ.png",
          badRelImg: "./resources/images/ISFP.png",
          img: "./resources/images/INFP.png",
        },

        INTP: {
          item: "논리적인 사색가(INTP)",
          subTitle: "지혜로운 부엉이 ( INTP )",
          workexplain:
            "기존의 연애 방식을 거부하고 나만의 연애를 만들어 가는 스타일이에요! <br> \
            늘 새로운 아이디어가 넘치고 나만의 연애를 끊임없이 탐구하기 때문에 유니크하고 특별한 <br> \
            연애를 하는 경우가 많아요. 남의 눈치를 보지 않고 자존감도 높아서 상대의 외모나 조건보다는 <br> \
            사고방식, 대화 스타일 등이 나와 잘 맞는지가 더 중요해요. 워낙 직설적이고 논리적인 편이라 <br> \
            의견을 이야기하는 것뿐인데도 의도치 않게 팩폭하고 있는 내 모습을 발견할 수 있을 거예요. <br> \
            조금만 더 상대의 감정을 읽으려 노력한다면 오랫동안 안정적인 연애가 가능할 거예요.",
          goodRel: "친절한 양 ( ESFJ )",
          badRel: "똑똑한 독수리 ( INTJ )",
          goodRelImg: "./resources/images/ESFJ.png",
          badRelImg: "./resources/images/INTJ.png",
          img: "./resources/images/INTP.png",
        },

        ESTP: {
          item: "모험을 즐기는 사업가(ESTP)",
          subTitle: "용감한 호랑이 ( ESTP )",
          workexplain:
            "모르는 사람과도 10분 만에 절친이 되는 핵인싸에게 연애는 식은 죽 먹기죠. <br> \
            이상형을 만나면 어마어마한 애정 폭발력으로 썸부터 연애까지 빠르게 직진하는 스타일이에요. <br> \
            남의 눈치를 보지 않고 애정표현이나 스킨십도 적극적으로 하는 편이라 연인에게 <br> \
            사랑받는 느낌을 듬뿍 주는 프로 표현러군요! 갈등이 생겨도 피하지 않고 뒤끝도 없어서 <br> \
            쿨한 연애가 가능해요. 얽매이는 걸 싫어하는 자유영혼이기 때문에 지나치게 구속하지 않고 <br> \
            다양한 데이트를 즐기며 취미를 공유할 수 있는 사람을 만나는 걸 추천해요.",
          goodRel: "섬세한 곰 ( ISFJ )",
          badRel: "열정적인 말 ( ENFJ )",
          goodRelImg: "./resources/images/ISFJ.png",
          badRelImg: "./resources/images/ENFJ.png",
          img: "./resources/images/ESTP.png",
        },

        ESFP: {
          item: "자유로운 영혼의 연예인(ESFP)",
          subTitle: "활기찬 토끼 ( ESFP )",
          workexplain:
            "연애할 때 한없이 다정하고 콩깍지가 단단히 씌어서 매일 연애 1일 차 같은 설렘과 <br> \
            이벤트가 가득할 거예요. 썸 추진력도 5G급이라 연애 성공률은 걱정할 것 없겠네요! <br> \
            하지만 생각이 자주 바뀌는 편이라 나도 모르는 사이 마음이 갈대처럼 흔들릴 수 있어요. <br> \
            당신의 무한동력 같은 에너지로 연인과 함께 파티, 스포츠처럼 활동적인 데이트를 즐기다 보면 <br> \
            다시 마음이 불타오를 수 있어요. 또 '한 번뿐인 인생, 즐겁게 살자'는 나의 가치관을 <br> \
            응원해주는 사람이라면 오랫동안 즐거운 연애가 가능할 거예요.",
          goodRel: "섬세한 곰 ( ISFJ )",
          badRel: "신중한 거북이 ( ISTJ )",
          goodRelImg: "./resources/images/ISFJ.png",
          badRelImg: "./resources/images/ISTJ.png",
          img: "./resources/images/ESFP.png",
        },

        ENFP: {
          item: "재기발랄한 활동가(ENFP)",
          subTitle: "화려한 앵무새 ( ENFP )",
          workexplain:
            "개성을 존중하고 자유를 사랑하는 나에게 구속하는 연애란 있을 수 없죠. <br> \
            어떤 옷, 어떤 헤어스타일이든 간섭 제로, 취향 존중. 연인이 갑자기 일을 그만두고 <br> \
            여행을 떠나겠다고 하면 묻지도 따지지도 않고 응원해 줄 스타일이에요. 한 번 빠지면 <br> \
            화끈하게 올인하기 때문에 헌신적인 연애를 할 가능성이 높아요. 어느 정도의 <br> \
            보답을 원하기도 해서 상대가 너무 받기만 하면 혼자 꿍해서 토라질 때도 있을 거예요. <br> \
            나의 헌신과 응원에 진심으로 감사할 줄 알고 내 모습을 있는 그대로 <br> \
            존중해줄 수 있는 사람을 만난다면 오랫동안 행복한 연애를 할 수 있을 거예요.",
          goodRel: "똑똑한 독수리 ( INTJ )",
          badRel: "용감한 호랑이 ( ESTP )",
          goodRelImg: "./resources/images/INTJ.png",
          badRelImg: "./resources/images/ESTP.png",
          img: "./resources/images/ENFP.png",
        },

        ENTP: {
          item: "논쟁을 즐기는 변론가(ENTP)",
          subTitle: "날카로운 여우 ( ENTP )",
          workexplain:
            "썸 추진력 상위 1%, 좋으면 앞뒤 안 재고 돌진하며 썸도 연애도 빠르게 시작하는 금사빠! <br> \
            말발이 타고나서 격렬한 토론도 좋아해요. 관심 있는 주제로 밤새 떠들 수 있는 상대라면 <br> \
            운명적인 연애를 시작할 수 있을 거예요. 호불호 확실하고 싫증을 빨리 내는 편이라 <br> \
            새로운 핫플이나 액티비티를 함께 찾아다닐 수 있는 사람을 만나면 지루할 틈 없이 <br> \
            다이나믹한 연애를 즐길 수 있어요. 하지만 개인의 시간도 중시해서 모든 시간을 <br> \
            상대와 공유하고 싶진 않을 거예요. 자기 계발을 위한 시간도 필요하다는 걸 <br> \
            연인에게 잘 설명한다면 갈등 없이 연애할 수 있을 거예요.",
          goodRel: "INFJ",
          badRel: "강력한 사자 ( ESTJ )",
          goodRelImg: "./resources/images/INFJ.png",
          badRelImg: "./resources/images/ESTJ.png",
          img: "./resources/images/ENTP.png",
        },

        ESTJ: {
          item: "엄격한 관리자(ESTJ)",
          subTitle: "강력한 사자 ( ESTJ )",
          workexplain:
            "밀당이라곤 일절 모르는 솔직담백 스타일이에요. <br> \
            꼿꼿하고 체계적인 성향 덕분에 마치 21세기를 사는 선비 같아요. 당신의 가식 없고 <br> \
            쿨한 매력에 많은 이성이 호감을 느낄 거예요. 책임감이 강해서 약속을 반드시 지키기 때문에 <br> \
            연인에게 금방 신뢰를 얻는 편이기도 해요. 연애 초반엔 감정 표현이 서툴러도 연애도 사랑도 <br> \
            열심히 학습하는 노력파이기 때문에 시간이 갈수록 연애 표현력은 점점 좋아질 거예요. <br> \
            다만 명확한 호불호와 냉철한 성향 때문에 의도치 않게 연인에게 상처를 줄 수 있어요. <br> \
            '역지사지'를 마음에 품고 상대의 마음을 헤아려 보는 노력을 해보세요.",
           goodRel: "창의적인 고양이 ( ISFP )",
          badRel: "열정적인 말 ( ENFJ )",
          goodRelImg: "./resources/images/ISFP.png",
          badRelImg: "./resources/images/ENFJ.png",
          img: "./resources/images/ESTJ.png",
        },

        ESFJ: {
          item: "사교적인 외교관(ESFJ)",
          subTitle: "친절한 양 ( ESFJ )",
          workexplain:
            "상대방의 감정을 잘 읽고 맞춰줘서 연애할 때 갈등이 적어요. 오지랖 넓고 주변을 잘 챙겨서 <br> \
            누구든 당신 곁에서 편안함을 느낄 거에요. 하지만 사실은 호불호가 명확해서 연인의 행동에 <br> \
            간섭하고 싶지만, 갈등을 만들고 싶지 않아서 불만이 있어도 속에 쌓아두는 편이네요. <br> \
            가끔 속마음을 표현할 때에도 불편한 말이 다 필터링 된 예쁜 말만 해주려고 노력해요. <br> \
             이런 당신의 빛나는 센스 덕에 결혼까지 생각한 연인들이 많았겠어요. <br> \
             하지만 갈등은 피할수록 깊어지는 법. 더 솔직하고 편안한 연애를 위해, <br> \
             어렵더라도 고민을 바로 이야기해 보는 건 어떨까요?",
          goodRel: "지혜로운 부엉이 ( INTP )",
          badRel: "날카로운 여우 ( ENTP )",
          goodRelImg: "./resources/images/INTP.png",
          badRelImg: "./resources/images/ENTP.png",
          img: "./resources/images/ESFJ.png",
        },

        ENFJ: {
          item: "정의로운 사회운동가(ENFJ)",
          subTitle: "열정적인 말 ( ENFJ )",
          workexplain:
            "빠른 눈치로 연인의 감정을 척척 알아맞히고 연애를 위해 시간과 노력을 아끼지 않는 <br> \
            스타일이에요. 장점을 알아보고 응원해 주는 데에 능숙해서 연인에게 든든한 치어리더가 <br> \
            되어줄 수 있어요. 1분에 100마디씩 칭찬해 줘서 자존감 낮은 사람도 당신과 함께라면 <br> \
            언제나 파워당당! 하지만 상처받기 싫은 마음에 갈등을 피하고 좋은 말만 계속한다면 <br> \
            문제는 해결되지 않고 깊어질 거예요. 힘들 때 자기 생각과 감정을 솔직하게 표현하는 것도 <br> \
            중요해요. 애정 표현, 썸 추진력은 상위 1%이니 연애 성공률은 걱정할 필요가 없겠네요.",
          goodRel: "창의적인 고양이 ( ISFP )",
          badRel: "재치있는 원숭이 ( ISTP )",
          goodRelImg: "./resources/images/ISFP.png",
          badRelImg: "./resources/images/ISTP.png",
          img: "./resources/images/ENFJ.png",
        },

        ENTJ: {
          item: "대담한 통솔자(ENTJ)",
          subTitle: "뛰어난 늑대 ( ENTJ )",
          workexplain:
            "일? 사랑? 아무것도 포기할 수 없어! 야망 가득한 워커홀릭인 데다 <br> \
            사랑도 일처럼 척척 해치우는군요. 불도저 정신으로 썸에서 연애까지 시속 200km로 직진. <br> \
            연인이 고민할 때 빠르게 해결책을 제시하고, 싸울 때도 잘잘못을 확실히 따지는 편이에요. <br> \
            하지만 단호하고 이성적인 모습이 연인에게 상처를 줘서 관계가 와장창 깨진 적도 있을 거예요. <br> \
            남의 눈치를 보지 않고 주도적으로 행동하다 보면 나도 모르는 사이 상대방에게 <br> \
            상처를 줄 수 있어요! 상대의 감정을 조금 더 생각해 주려 노력한다면 <br> \
            오랫동안 안정적인 연애를 할 수 있을 거예요.",
          goodRel: "상냥한 사슴 ( INFP )",
          badRel: "활기찬 토끼 ( ESFP )",
          goodRelImg: "./resources/images/INFP.png",
          badRelImg: "./resources/images/ESFP.png",
          img: "./resources/images/ENTJ.png",
        },
      };

      function start() {
        $(".start").hide();
        $(".question").show();
        next();
      }

      // 위의 버튼 클릭 시 점수 계산
      $("#up").click(function () {
        var type = $("#type").val();
        var preValue = $("#" + type).val();
        $("#" + type).val(parseInt(preValue) + 1);
        next();
      });

      $("#down").click(function () {
        next();
      });

      // 버튼 클릭 시 발생하는 이벤트
      function next() {
        if (num == 13) {
          $(".question").hide();
          $(".result").show();
          $("#img").show();
          $("#subTitle").show();
          $("#workexplain").show();
          var mbti = "";
          $("#EI").val() < 2 ? (mbti += "I") : (mbti += "E");
          $("#SN").val() < 2 ? (mbti += "N") : (mbti += "S");
          $("#TF").val() < 2 ? (mbti += "F") : (mbti += "T");
          $("#JP").val() < 2 ? (mbti += "P") : (mbti += "J");
          console.log(mbti);
          $("#img").attr("src", result[mbti]["img"]);
          $("#goodRelImg").attr("src", result[mbti]["goodRelImg"]);
          $("#badRelImg").attr("src", result[mbti]["badRelImg"]);
          // $("#item").html(result[mbti]["item"]);
          $("#subTitle").html(result[mbti]["subTitle"]);
          $("#workexplain").html(result[mbti]["workexplain"]);
          $("#goodRel").html(result[mbti]["goodRel"]);
          $("#badRel").html(result[mbti]["badRel"]);

        } else {
          $(".progress-bar").attr(
            "style",
            "width: calc(100 / 13 * " + num + "%)"
          );
          $("#title").html(q[num]["title"]);
          $("#type").val(q[num]["type"]);
          $("#up").html(q[num]["up"]);
          $("#down").html(q[num]["down"]);
          num++;
        }
      }
    </script>

    <script>
      document.addEventListener('DOMContentLoaded', () => {
        const splashText = document.querySelector('.splash-text');

        setTimeout(() => {
          splashText.style.opacity = '1';
          splashText.style.transform = 'translateY(0)';

          createSmoke(splashText);
        }, 500);

        function createSmoke(container) {
          const smoke = document.createElement('div');
          smoke.classList.add('smoke');
          container.appendChild(smoke);

          const x = container.clientWidth / 2;
          const y = container.clientHeight / 2;

          smoke.style.left = `${x}px`;
          smoke.style.top = `${y}px`;

          setTimeout(() => {
            smoke.remove();
          }, 1000);
        }
      })
    </script>

    </div>

  </body>
</html>