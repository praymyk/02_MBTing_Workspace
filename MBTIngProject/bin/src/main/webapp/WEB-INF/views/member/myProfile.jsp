<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  
<style>


	#profile-outer{
		margin: auto;
		margin-bottom: 50px;
		width: 600px;
	}

	.profile-img-box {
    background-color: white;
    width: 100%;
    height: 100px;

    /* 아이템을 수평, 수직 가운데 정렬하는 코드 */
    display: flex;
    flex-direction: column;
    /* 방향을 row로 바꾸면 한 줄로 나온다! */
    justify-content: center;
    align-items: center;
    box-sizing: border-box;
    }

    .profile-img {
        background-color: grey;
        width: 100px;
        height: 100px;
        border-radius: 50%;
    }
	input {
		height: 30px;
		width: 350px;
		box-sizing: border-box;
	}
	textarea {
		box-sizing: border-box;
		height: 80px;
		width: 350px;
		resize : vertical;
	}

	.profile-title{
		float: right;
		font-weight: bolder;
		height: 20px;
		line-height: 20px;
	}

	.profile-content{
		margin: auto;
		padding-left: 30px;
	}
	
	.profile-message{
		box-sizing: border-box;
		height: 30px;
		padding-bottom: 15px;
		padding-left: 30px;
	}
	
	#change-profile{
		font-weight: 600; 
		font-size: 16px;
		color: blue;
	}
	
	#change-profile:hover{
		cursor: pointer;
	}

</style>
</head>
<body>

	<div>

	</div>
	<script>
	    let i = document.getElementById("myProfile");

        // i.style.cssText = "border-top : 5px solid pink"
	    
    </script>

	<div id="profile-outer">

		<div class="profile-menu-title">
			<h2>프로필 편집</h2>
		</div>
	
		<form id="mypage-form" 
		  action="update.me"
		  method="post"
		 enctype="multipart/form-data">
		
			<!--
				마이페이지에서 보여져야 하는 것들
				아이디, 이름, 전화번호, 이메일, 주소, 취미
			-->
		
			<table border="0px" style="table-layout: fixed;">
				<tr>
					<td style="width: 130px; height: 180px;">
						<div class="profile-img-box" id="profile-img-box">
							<img id="preview" class="profile-img" src="${pageContext.request.contextPath}${sessionScope.loginMember.profileImg}" alt="" />
						</div> 
					</td>
					<!-- 회원 정보 변경 시 DB로 부터 수정할 회원을 지정하기 위해 로그인 유저의 EMAIL 정보 담아 둘 input -->
					<input type="hidden" name="email" value="${sessionScope.loginMember.email}" />
					<td class="profile-content" style="font-size: 18px">
						${sessionScope.loginMember.email}
						
						<br>
						<div id="change-profile">프로필 사진 바꾸기</div>
			    
			         	<input type="file" id="upfile" name="reupfile" style="display: none;">
			         	
 					</td>
				</tr>
				
				<!-- 프로필 이미지 등록 미리보기용 스크립트 -->
				<script>
					$("#change-profile").click(function(){
							
							$("#upfile").click();	
					});
				
					$("#upfile").on("change", function(event) {
	
					    var file = event.target.files[0];

					    var reader = new FileReader(); 
					    reader.onload = function(e) {
	
					        $("#preview").attr("src", e.target.result);
					    }
	
					    reader.readAsDataURL(file);
					});
				</script>
				
				<tr>
					<td class="profile-title">이름</td>
					<td class="profile-content">
						<input type="text" name="userName" required 
						value="${sessionScope.loginMember.userName}">
					</td>
					
				</tr>
				<tr>
					<td></td>
					<td class="profile-message">
						
					</td>
				</tr>
				
				
				<tr>
					<td class="profile-title">나이</td>
					<td class="profile-content">
						<input type="text" name="age" 
						value="${sessionScope.loginMember.age}">
					</td>
				</tr>
				<tr>
					<td></td>
					<td class="profile-message">
						
					</td>
				</tr>
				
				<tr>
					<td class="profile-title">성별</td>
					<td class="profile-content">
						<input type="text" name="gender" 
						value="${sessionScope.loginMember.gender}">
					</td>
				</tr>
				<tr>
					<td>
						
					</td>
					<td class="profile-message"></td>
				</tr>
				
				<tr>
					<td class="profile-title">소개</td>
					<td class="profile-content">
						<textarea placeholder="응애" name="introduce">
							${sessionScope.loginMember.introduce}
						</textarea>
					</td>
					
				</tr>
				
				<tr>
					<td class="profile-content">
						
					</td>
					<td class="profile-message" >
						0/150
					</td>
				</tr>
				
				<tr>
					<td class="profile-title">휴대폰</td>
					<td class="profile-content">
						<input type="text" name="phone" placeholder="- 포함해서 입력해주세요"
						value="${sessionScope.loginMember.phone}">
					</td>
				</tr>
				<tr>
					<td>
						
					</td>
					<td class="profile-message"></td>
				</tr>
				
				<tr>
					<td class="profile-title">MBTI</td>
					<td class="profile-content">
						INTP
					</td>
				</tr>
				
				<tr>
					<td></td>
					<td class="profile-message"></td>
				</tr>
				
				<tr>
					<td class="profile-title">MBTI 별명</td>
					<td class="profile-content">
						F가되고싶은T
					</td>
				</tr>
				
				<tr>
					<td></td>
					<td class="profile-message"></td>
				</tr>
				<tr>
					<td class="profile-title">가입일</td>
					<td class="profile-content">
						2023-11-26
					</td>
				</tr>

				<tr>
					<td></td>
					<td class="profile-message"></td>
				</tr>
				<tr>
					<td class="profile-title"></td>
					<td class="profile-content">
						<button type="submit">제출</button>
					</td>
				</tr>
			
			</table>
		</form>
	</div>
	
    
</body>
</html>