<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    <title>Document</title>

  
<style>
    *{font-family: 'NanumSquare';}

    .profile-menu-title{
        margin: auto;
        margin-top: 100px;
        margin-bottom: 50px;
        height: 100px;
        width: 1200px;
        border: 1px solid;
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
    
    .ptlist-wrap{
        margin: auto;
        width: 1200px;
        min-height: 500px;
    }

    /*
    ////////////////////
    내 후기 리스트 관련 스타일
    ////////////////////
    */

    ul,li {
        margin-left: 0px;
        -webkit-padding-start: 0px;
    }
    
    .ptlist {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    list-style-type: none;
    }

    .ptlist > li {
        width: 49%;
        background-color: #fff;
        margin-bottom: 20px;
    }

    .ptlist > li :hover {
        background-color: pink
    }

    .ptlist > li > div {
        display: flex;
        align-items: center;
        padding: 10px;
        padding-top: 25px;
        height: 100px;
        border-radius: 5px;
        background-color: #fff;
        box-shadow: 0 1px 4px 2px rgb(0 0 0 / 10%);
    }
    .ptlist > li > div > div {
        margin-left: 10px;
        flex-grow: 1;
    }

    .list_thumbimg {
    display: block;
    width: 72px;
    height: 72px;
    border-radius: 5px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -ms-border-radius: 5px;
    -o-border-radius: 5px;
	overflow: hidden;
    }

    .list_thumbimg img {
        width: 100%;
        height: 100%;
    }


    /*
    ///////////
    페이징바 스타일
    ///////////
    */
    .paging-area {
    width: 1000px;
    margin: auto;
    margin-bottom: 100px;
    text-align: center;

	}
	.paging-area button {
	    width: 35px;
	    height: 30px;
	    border: none;
	    border-radius: 5px;
	    background-color: pink;
	}
	.paging-area button:hover {
	    border: 1px solid pink;
	    background-color: white;
	}
	.paging-area button[disabled]:hover {
	    border: none;
	    background-color: pink;
	
	}


</style>
</head>
<body>

	<div>
		<jsp:include page="./myPage.jsp"></jsp:include>
	</div>

    <script>
	    let i = document.getElementById("myReview");

        i.style.cssText = "border-top : 5px solid pink"
	    
    </script>

    <div class="profile-menu-title">
        내 후기
    </div>

    <div class="ptlist-wrap">
        <ul class="ptlist">
        
        	<c:forEach var="b" items="${ requestScope.list }">
			    <li>                
                    <input class="bno" type="hidden" value=${b.boardNo}>
	                <div>
	                    <p class="list_thumbimg"><img src="${pageContext.request.contextPath}/${b.changeName}"></p>   
	                    <div>
	                        <p class="pt_title">${b.boardTitle}
	                        </p>
	                        <p class="pt_info">
	                            ${sessionScope.loginMember.userName}
	                        </p>                                                     
	                    </div>
	                    <p class="b_info"><span><b>${b.views}</b>명 읽음</span></p>
	                </div>                
	            </li>
           	</c:forEach>
           
        </ul>
    </div>

    <!-- 상세 보기 용 스크립트-->
    <script>
        $(".ptlist>li").click(function(){

            let bno = $(this).children(".bno").val();

            location.href = "detail.bo?bno=" + bno;
        })
    </script>


	<!-- 페이징 바 -->
    <div class="paging-area">
	    
	   	<c:choose>
			<c:when test="${ requestScope.pi.currentPage eq 1 }">
		    		<button type="button" style="display: none;" disabled>&lt;</button>	
		   	</c:when>
		   	
		   	<c:otherwise>    		
		    		<button type="button" onclick="location.href='myList.me?uno=${ sessionScope.loginMember.userNo }&cpage=${ requestScope.pi.currentPage - 1 }'">&lt;</button>
		   	</c:otherwise>
		</c:choose>
	        
		<c:forEach var="p" begin="${ requestScope.pi.startPage }" 
					  		 end="${ requestScope.pi.endPage }"
					 		step="1">

			<button type="button" onclick="location.href='myList.me?uno=${ sessionScope.loginMember.userNo }&cpage=${ p }'" id="pageB-${ p }">${ p }</button>
	     
		</c:forEach>
	        
	    <c:choose>
			<c:when test="${ requestScope.pi.currentPage ge requestScope.pi.maxPage }">
				<button type="button" style="display: none;" disabled>&gt;</button>
			</c:when>
			<c:otherwise>
				<button type="button" onclick="location.href='myList.me?uno=${ sessionScope.loginMember.userNo }&cpage=${ requestScope.pi.currentPage + 1 }'">&gt;</button>
			</c:otherwise>
	   	</c:choose>
	         
	</div>
	
	<!-- 페이징 처리 과련 스크립트 (현재 페이지 disabled 속성 주기용) -->
	<script>
	$(function(){
		$("#pageB-${ requestScope.pi.currentPage }").attr("disabled",true);

	})
	
	</script>

    <div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>

</body>


</html>