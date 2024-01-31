<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">

<title>결제 페이지 | Mbting</title>

<!-- 폰트(notosans)-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<style>
    * {font-family: 'NanumSquare';}
    
    #bo_list{
        margin: auto;
        width: 1200px;
    }

    .pay_intro{
        width: 1200px;
        height: 300px;
        margin-bottom: 50px;
        display: flex;
    }

    /*결제상품*/
    .pay_info{
        width: 1200px;
        margin: auto;
        margin-bottom: 100px;
    }

    .pay_item_wrap{
        margin: auto;
        display: flex;
        flex-direction: row;
    }

    .pay_item{
        width: 590px;
        height: 300px;
        background-color:  skyblue;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .pay_item>div{
        width: 100%;
        height: 215px;
    }
    
    .item_title{
        margin: 20px;
        width: 550px;
        font-size: 30px;
        font-weight: bold;
        color: white;
    }

    .item_intro{
        margin-left: 20px;
        margin-right: 20px;
        width: 550px;
        font-weight: bold;
        color: white;
    }

    #pay2{
        margin-left: 20px;
    }

    .pay_item button{
        margin-top: 20px;
        width: 95%;
        height: 45px;
        border-radius: 20px;
        border: 0px;
        color: black;
        font-size: 20px;
        font-weight: bold;
    }   

    .pay_item button:hover{
        cursor: pointer;
        color: steelblue;
    }


    /*게시판*/
    .board_list {
        border-top: 2px solid #fd8f9f;
        border-bottom: 1px solid #cccccc;
        font-size: 16px;
        color: #555555;
    }

    .board_list table {
        table-layout: fixed;
        width: 100%;
    }

    .board_list table caption{
        padding: 0;
        font-size: 0;
        line-height: 0;
        overflow: hidden;
    }
    
    .board_list td,
    .board_list th {
        padding: 20px 3px;
        text-align: center;
    }

    .board_list td {
        border-top: 1px solid #dedede;
        padding: 20px 3px;
        color: #555;
        font-size: 15px;
    }

    .profile-menu-title{
        margin: auto;
        margin-top: 50px;
        margin-bottom: 50px;
        height: 100px;
        width: 1200px;
        border-radius: 10px;
        background-image:url(https://dudeplace.co/wp-content/uploads/2021/04/1.%E0%B8%8B%E0%B8%B5%E0%B8%A3%E0%B8%B5%E0%B8%AA%E0%B9%8C%E0%B9%80%E0%B8%81%E0%B8%B2%E0%B8%AB%E0%B8%A5%E0%B8%B5-Please-Dont-Meet-the-Man-%E0%B8%9B%E0%B9%88%E0%B8%A7%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%83%E0%B8%88-%E0%B9%80%E0%B8%AD%E0%B9%84%E0%B8%AD%E0%B8%A7%E0%B8%B8%E0%B9%88%E0%B8%99%E0%B8%A3%E0%B8%B1%E0%B8%81.jpg);
        background-size: cover;
        background-position:10% 50%;
        
        font-size: 26px;
        font-weight: bold;
        color: white;
        text-align: center;
        line-height: 100px;
    }
    
    #myOrderList .rbuttoned{
    	border-radius: 10px;
    	width:80px;
    	height:50px;
    	font-size: 15px;
        font-weight: bold;
    }
    
    #myOrderList .rbutton:hover{
    	background-color: white;
    	color:black;
    }
    
    /*
    ///////////
    페이징바 스타일
    ///////////
    */
    .paging-area {
    width: 1200px;
    margin: auto;
    margin-bottom: 100px;
    text-align: center;
	}
	.paging-area button {
	    width: 1200px;
	    height: 50px;
	    border: none;
	    border-radius: 5px;
	    background-color: pink;
	}
	.paging-area button:hover {
	    border: 1px solid pink;
	    background-color: palevioletred;
	}
	.paging-area button[disabled]:hover {
	    border: none;
	    background-color: pink;
	
	}

</style>

</head>
<body>

<div>
    <jsp:include page="../common/header.jsp"/>
</div>
    

<div class="profile-menu-title">
    결제 상품
</div>




<div class="pay_info">

    <div class="pay_intro"> 
        <div class="pay_intro_content" style="width:500px;">
            <div style="font-size: 50px; font-weight: bolder;">MBTING과 함께 더 좋은</div>
            <div style="font-size: 50px; font-weight: bolder; line-height: 25px;">상대를 찾아보세요.</div>
            <div style="margin-top: 30px; font-size: 20px;">
                MBTIng 코인을 구매하고 내 성향과 맞는 <br>
                매칭 대상을 찾아보세요.
            </div>
        </div>
        <div style="height: 100%; margin-left: 400px;"><img style="width: 100%;
            height: 100%;" src="https://blog.kakaocdn.net/dn/ceL2nr/btrUum9KhuJ/URqGrY525qkSfRfGkM5L7k/img.gif" alt="">
        </div>

    </div>
    <div class="pay_item_wrap">

        <div class="pay_item" id="pay1">
            <div>
                <div class="item_title">MBTICoin x5</div>
                <div class="item_intro">
                    횟수 제한 없는 매칭 신청 <br>
                    대화 기회 5회! <br>
                    부담 있는 가격 <br>
                    무제한 MBTI 테스트 가능
                </div>
            </div>  
          
            <button type="button">5만원 결제하기</button>
        </div>
    
        <div class="pay_item" id="pay2">
            <div>
                <div class="item_title">MBTICoin x10</div>
                <div class="item_intro">
                    횟수 제한 없는 매칭 신청 <br>
                    대화 기회 10회! <br>
                    부담 있는 가격 <br>
                    무제한 MBTI 테스트 가능
                </div>
            </div>

			    <button id="mbtiCoin10" type="button">9만원 결제하기</button>
        </div>

    </div>

</div>


<script>

	sessionStorage.setItem("cpage",1);
	let cpage = sessionStorage.getItem("cpage");

    // 환불 요청 용 스크립트 처리
    function refundRequest(e){
        console.log("잘클릭 됨?")
        // 1. 환불 요청할 상품 번호 변수 생성
     
        let orderId = $("#myOrderList").children().children().html()

        $.ajax({
            url:'refundRequest.me',
            type:'post',
            data:{
                "partnerOrderId" : orderId
            },
            success:function(result){
                alert(result);
                orderList();
            },
            error:function(request,status,error){
                console.log("환불신청용 ajax 통신 실패")
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        })// ajax 끝
        
        
    }

	$(function(){
		// 환불요청 상태에 따른 환불 버튼 처리
		
		// 결제 리스트 조회용 함수 호출
		sessionStorage.setItem("morePage",8);
		orderList();
		
		// 카카오페이 결제용 스크립트 
		// 상품1 정보 선택 시
		$("#pay1").click(function(){
			$.ajax({
				url:'pay.me',
				dataType:'json',
				data:{
					'partnerUserId': '${sessionScope.loginMember.email}',
					'itemName': 'MBTIngCoinx5',
					'quantity': 1,
					'totalAmount' : 50000,
					'taxFreeAmount' : 0
				
				},
				success:function(result){
					var tid = result.tid;
					var box = result.next_redirect_pc_url;
					window.open(box);
					
					$.ajax({
						url:'payTry.me',
						data:{'tid' : tid,
							  'partnerUserId': '${sessionScope.loginMember.email}'
							  },
						success:function(result2){
							console.log("tid 받기 성공")
						},
						error: function(result2){
							console.log("tid 받기 실패")
							
						}
					})
						
				},
				error:function(result){
					alert("카카오페이 결제용 ajax 통신 오류")
				}
				
				
			});	//ajax 끝
			
		});// 버튼 클릭 이벤트	
		
		// 상품2 정보 선택 시
		$("#pay2").click(function(){
			$.ajax({
				url:'pay.me',
				dataType:'json',
				data:{
					'partnerUserId': '${sessionScope.loginMember.email}',
					'itemName': 'MBTIngCoinx10',
					'quantity': 1,
					'totalAmount' : 90000,
					'taxFreeAmount' : 0
				
				},
				success:function(result){
					var tid = result.tid;
					var box = result.next_redirect_pc_url;
					window.open(box);
					
					$.ajax({
						url:'payTry.me',
						data:{'tid' : tid,
							  'partnerUserId': '${sessionScope.loginMember.email}'
							  },
						success:function(result2){
							console.log("tid 받기 성공")
						},
						error: function(result2){
							console.log("tid 받기 실패")
							
						}
					})
						
				},
				error:function(result){
					alert("카카오페이 결제용 ajax 통신 오류")
				}
				
				
			});	//ajax 끝
			
		});// 버튼 클릭 이벤트	
		
	
	});	// 펑션 끝
	
    // 결제 리스트 출력용 펑션
	function orderList(){
		$.ajax({
			url:'orderList.me',
			type:'GET',
            data : {
            	"email": "${sessionScope.loginMember.email}",
            	"cpage" : cpage,
            	"morePage": sessionStorage.getItem("morePage")
            },
            success : function(result){
            	
            	// jsonObject로 리절트한 내용은 문자열이므로 jsp에서도 사용가능하도록 가공해야함
            	// json 형태로 파싱(키=밸류 값)
            	const jsonDataPi = result.pi
            	const jsonObjectPi = JSON.parse(jsonDataPi);
            	
                //console.log(sessionStorage.getItem("morePage"));
            	
            	const jsonData = result.list;
				const jsonObject = JSON.parse(jsonData);
				const jsonArray = Object.values(jsonObject);
				
            	let resultStr = "";
            	let pagingStr = "";
            	
            	if(result.length !=0 ){
            		
                	for(let i=0; i<jsonArray.length; i++){
                		// 환불 날짜가 없을 경우 환불하지 않은 상태로 출력
                		let refund = "";
                		let refundButton = "";
                		
                    	if(jsonArray[i].refundDate != ""){
                    		refund = "결제상태"
                    	} else {
                    		refund = "환불상태"
                    	}
                    	
                    	switch(jsonArray[i].refundRequest){
                    	case 1 : refundButton = "<td><button class='rbutton rbuttoned' onclick='refundRequest(this)'>환불 요청</button></td>";
                    	break;
                    	case 2 : refundButton = "<td><button class='rbuttoned' onclick='refundRequest(this)' disabled>검토중</button></td>"
                    	break;
                    	case 3 : refundButton = "<td><button class='rbuttoned' onclick='refundRequest(this)' disabled>환불됨</button></td>"
                    	break;
                    	case 4 : refundButton = "<td><button class='rbuttoned' onclick='refundRequest(this)' disabled>거절됨</button></td>"
                    	break;
                    	}
                		
                		resultStr += "<tr>"
                					+	"<td id='orderId'>"+ jsonArray[i].partnerOrderId + "</td>"
                					+ 	"<td>"+ refund + "</td>"
                					+	"<td>"+ jsonArray[i].itemName + "</td>"
                					+   "<td>"+ jsonArray[i].partnerUserId + "</td>"
                					+	"<td>"+ jsonArray[i].orderDate.substr(0,19) + "</td>"
                					+	refundButton
                				+	"</tr>";
                	}
                	
            	} else {
            		
            		resultStr += "<tr>"
    					+	"<td></td>"
    					+ 	"<td></td>"
    					+	"<td>결제 내역이 존재하지 않습니다</td>"
    					+   "<td></td>"
    					+	"<td></td>"
    					+	"<td></td>"
    				+	"</tr>";
            	}
            	
            	$("#myOrderList").html(resultStr);
            },
            error : function(){
                console.log("내 대화 상대 표시용 ajax 통신 실패")
            }
            
        }); // ajax 끝
              
	}
	
	// 페이징 처리
	let i = 8;
	
	function moreList(){
		i += 8;
		sessionStorage.setItem("morePage", i);
		
		console.log(i);
		orderList();	
	}
	
</script>



<div class="profile-menu-title">
    결제 내역
</div>


<div id="bo_list">

    <div class="board_list">
        
        <table>
            <colgroup>
                <col width="100">
                <col width="100">
                <col>
                <col width="200">
                <col width="100">
                <col width="100">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">주문번호</th>
                    <th scope="col">환불여부</th>
                    <th scope="col">상품명</th>
                    <th scope="col">구매자</th>
                    <th scope="col">날짜</th>
                    <th scope="col">문의</th>
                </tr>
            </thead>
            <tbody id="myOrderList">
                <tr class=" ">
                    <td> 결제 내역이 존재하지 않습니다. </td>
               	</tr>
            </tbody>
        </table>

    </div>

</div>

		<!-- 페이징 바 -->
    <div class="paging-area">
	 	<button type="button" onclick="moreList()"><div style="border: 1px solid white"></div></button>
	</div>
	
    <div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>

</body>
</html>
