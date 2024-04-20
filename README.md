<h1 align="center"> KH 정보 교육원 파이널 프로젝트</h1>

<h2> MBTI 기반 소개팅 사이트 </h2>

<p><img align="center" width="800" alt="image" src="https://github.com/praymyk/02_MBTing_Workspace/blob/main/MAIN.png" border-radius="20px"></p>
<h2>MBTIng는 MBTI 검사 기반으로 소개팅 매칭 사이트입니다. </h3> 
<pre>
사용자는 MBTI 테스트를 진행하고 그 결과와 맞는 궁합의 회원들을 추천하는 소개팅 사이트 입니다. <br> 
회원가입 후 홈페이지를 이용할수 있으며 MBTI 테스트 결과에 맞는 궁합 대상중 마음에 드는 상대에게 만남을 신청할 수 있습니다. <br> 
만남 신청시 소지한 매칭 코인이 소모되며 마이페이지 내 카카오페이를 통한 결제 기능으로 간편하게 매칭 코인을 충전할수 있고, <br> 
만남 결과를 후기게시판을 이용해서 게시글을 작성할 수있습니다. <br> 
마이페이지 내에서는 본인 프로필 변경, 결제, 매칭 신청자와 본인이 작성한 후기 게시글을 관리 할 수 있습니다.
</pre>
<br/>

<h2>개발 기간</h2>
2023.11 ~ 2023.12 (2개월)
<h2>플랫폼</h2>
Web
<h2>개발 인원</h2>
5명 (팀장)
<h2>담당 역할</h2>
<pre>
🟪 사용자 페이지 - 로그인 및 회원 관리 (기여도 90%), 프론트엔드 (기여도 100%) <br> 
🟪 결제 페이지 - 결제 기능 및 내용 조회 (기여도 100%), 프론트엔드 (기여도 100%) <br> 
🟪 스프링 레거시 프로젝트 셋팅 - 패키기 구조 작성 및 템플릿 작성 (기여도 80%) <br> 
🟪 프로젝트 DB 셋팅 - ERD 설계, 테이블 생성 (기여도 80%)
</pre>

<h2>개발 환경</h2>
<pre>
🟪 언어 - JAVA, JSP&Servlet, CSS3, JavaScript, AJAX, HTML5 <br> 
🟪 서버 - Apache Tomcat 9.0 <br> 
🟪 프렘워크 - Spring Legacy, Maven <br> 
🟪 DB - Oracle, SQL Developer <br> 
🟪 IDE - eclipse, VSCode <br> 
🟪 API, 라이브러리 - KAKAO Pay, JSTL, jQuery, Bootstrap4, Web Socket
</pre>


<br/>

<h2> 🟪 ERD 설계 </h2>
<h3>ERD 설계 Point</h3>
<pre>
1. 각 테이블의 관계를 Primarykey를 외래키로 지정해서 쉽게 관계를 확인할 수 있도록 구현 함. <br>
2. 테이블과 VO클래스의 필드값을 일치시켜 코딩시 클라이언트 요청값을 DB로 부터 받아오는 코드를 쉽게 작성할수 있도록했습니다.</pre>
<img src="https://github.com/praymyk/02_MBTing_Workspace/blob/main/MBTING ERD.png"> 
<p>ERDCLOUD: https://www.erdcloud.com/d/955EesMtzksbeHm5r</p>

<h2> 🟪 구현 화면/코드 : 회원가입 기능</h2>
<h3>회원가입 기능 Point</h3>
<pre>
1. 사용자 입력정보가 DB에 필요한 형식으로 제어되도록 JavaScript 내 정규식을 작성.<br>
2. 보안을 위해 사용자 암호는 회원가입시 bcryt인코더를 이용해 암호화되어 DB에 저장되도록 설계.<br>
3. 이메일 중복검사가 입력마다 진행되도록 keyup이벤트 내 AJAX를 작성했고 SELECT문을 이용해 중복 이메일 검사를 진행합니다.<br>
4. 각 입력값의 유효함 여부를 JavaScript배열 변수에 담고 유효성 검사가 진행될 때 마다 finalCheck() 함수를 통해 <br>
   모든 항목에 대한 입력 값이 유효하다면 submit 버튼을 클릭 가능하도록 제어했습니다.</pre>
<img src="https://github.com/praymyk/02_MBTing_Workspace/blob/main/enroll.gif"> 
<br/>
✔️ 정규식을 이용한 유효성 검사 스크립트 <br><br>
<img src="https://github.com/praymyk/02_MBTing_Workspace/blob/main/Enroll.png">
<br/>
✔️ 회원가입 요청 Controller단 처리 코드 <br><br>
<img src="https://github.com/praymyk/02_MBTing_Workspace/blob/main/Enroll2.png">
<br/>
<h2> 🟪 구현 화면/코드 : 마이페이지</h3>
<h3>마이페이지 기능 Point</h3>
<pre>
1. sessionScope에 저장된 사용자 계정정보를 재활용해 마이페이지에 필요한 정보를 출력합니다.<br>
2. 프로필 이미지는 MultipartFile를 통해 서버 내 resources 경로에 저장되도록 구현했고 DB에는 경로와 변환된 파일이름이 기록됩니다. <br>
&nbsp&nbsp&nbsp프로젝트 외부는 이미지 파일 접근이 제한되 프로젝트 내에 프로필 이미지를 업로드 했습니다. <br>
3. 나에게 매칭을 신청한 사용자 정보를 조회하기위해 MEMBER 테이블 WHERE절 USER_NO컬럼값을 서브쿼리를 이용해 제한했습니다.</pre>
<img src="https://github.com/praymyk/02_MBTing_Workspace/blob/main/mypage.gif">
<br/>
✔️ 마이페이지 정보 ajax 처리 코드 <br><br>
<img src="https://github.com/praymyk/02_MBTing_Workspace/blob/main/mypage.png">
<br/>
✔️ 마이페이지 정보 수정 Controller단 처리 코드 <br><br>
<img src="https://github.com/praymyk/02_MBTing_Workspace/blob/main/mypage3.png">
✔️ 매칭 신청자 수락용 Controller단 처리 코드 <br><br>
<img src="https://github.com/praymyk/02_MBTing_Workspace/blob/main/mypage2.png">
<br/>


<h2> 🟪 구현 화면/코드 : 결제 기능</h3>
<h3>결제 기능 Point</h3>
<pre>
1. 카카오페이가 제공하는 REST API 규칙에 따라 결제 시스템을 구현하는 것을 목표로했습니다.<br>
2. KakaoPayController 클래스에서 post 방식으로 Kakao측에 결제 상품에 대한 정보를 넘깁니다.<br>
&nbsp&nbsp&nbsp문자열을 바이트 스트림 변환하여 HTTP의 BODY 영역에 결제 정보가 전송됩니다. <br>
3. 결제 정보 전송이 성공하면 approval_url 주소에 pg_token 값이 반납된것을 확인할수 있습니다.<br>
&nbsp&nbsp&nbsp 결제성공 시 'kakaoPaySuccess/' 쿼리스트링으로 DB에 기록한 주문번호와 함께 token값을 받도록 설계했습니다.<br>
&nbsp&nbsp&nbsp 즉, approval_url이 리다이렉트되면 결제 성공 정보가 DB에 기록되고 결제 상품 지급이 완료됩니다.</pre>
<img src="https://github.com/praymyk/02_MBTing_Workspace/blob/main/pay.gif">
<br/>
✔️ 결제 요청에 대한 ajax 처리 코드 part1<br><br>
<img src="https://github.com/praymyk/02_MBTing_Workspace/blob/main/pay.png">
<img src="https://github.com/praymyk/02_MBTing_Workspace/blob/main/pay2.png">
<br/>
✔️ 결제 성공으로 KAKAOPAY 리다이렉트에 대한 처리 코드  <br><br>
<img src="https://github.com/praymyk/02_MBTing_Workspace/blob/main/pay3.png">
<br/>

