<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#payList {
	text-align:center; 
	font-size: 13px; 
	width: 850px;
	margin-top: 50px;
	}
#payList>tbody>tr:hover {cursor:pointer;}

#pagingArea {width:fit-content; margin:auto; margin-top : 50px;}

#searchForm {
    width:500px;
    margin:auto;
}


#searchForm>* {
    margin:5px;
}
.select {width:20%;}
.text {width:53%;}
.searchBtn {width:20%;}

.content {
    margin-left: 250px;
    margin-top: 100px;
}
.btn-primary, .btn-danger {
    width: 50px;
    height : 25px;
    margin: auto;
    font-size: 13px !important;
    line-height:13px !important;
}


</style>
</head>
<body>

	<jsp:include page="../common/adminMenubar.jsp" />

 <div class="wrap">
 	
        <div class="search">

            <form id="searchForm" action="search.adpa" method="get">
                <div style="display: flex; align-items: center; margin-top: 60px">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search" id="searchbar" name="keyword">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </div>
            </form>
        </div>
        
        <table id="payList" class="table table-hover" align="center">
            <thead>
            	<tr>
	                <th id="checkSize"><input type="checkbox" class="checkbox" name="selectedCheckbox"></th>
	                <th id="size1">순번</th>
	                <th id="size2">구매자</th>
	                <th id="size3">상품명</th>
	                <th id="size4">상품수량</th>
	                <th id="size5">상품총액</th>
	                <th id="size6">구매일시</th>
	                <th id="size7">환불요청</th>
	          	</tr>
            </thead>
            <tbody id="searchResultBody">
            	<c:forEach var="p" items="${ requestScope.list }">
		            <tr>
		                <th><input type="checkbox" class="checkbox"></th>
		                <th class="apno">${ p.partnerOrderId }</th>
		                <th>${p.partnerUserId}</th>
		                <th>${p.itemName} </th>
		                <th>${ p.quantity}</th>
		                <th>
						    <fmt:formatNumber value="${p.totalAmount}" pattern="#,###"/>
						</th>
		                <th>${ p.orderDate}</th>
		                <th class="refundStatus" style="height:10px;">
                    <c:choose>
                        <c:when test="${p.refundRequest eq 2}">
                            <form>
                                <div class="yesOrNo">
                                	<button type="button" class="btn btn-primary refundBtn" onclick="refundSuccess(${p.partnerOrderId});" >승인</button>
                                	<button type="button" class="btn btn-danger refundBtn" onclick="refundRefusal(${p.partnerOrderId});">거절</button>
                                </div>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <!-- 환불신청 안 한 고객들은 공란으로 둠 -->
                        </c:otherwise>
                    </c:choose>
                </th>
		            </tr>
            	</c:forEach>
            </tbody>
        </table>
        
        <script>
            		// 환불요청 중 승인 버튼 클릭 시
            		function refundSuccess(partnerOrderId) {
            			$.ajax({
            				url : "refundSuccess.adpa",
            				type : "get",
            				data : { partnerOrderId : partnerOrderId }, 
            				success : function(result) {
            					
            					console.log("성공 안되니?");
            					
            					$(".apno:contains("+partnerOrderId+")").parent().children().eq(7).html("");
            					
            				},
            				error : function() {
            					console.log("실패");
            				}
            			});
            		}
					
            		// 환불요청 중 거절 버튼 클릭 시
            		function refundRefusal(partnerOrderId) {
            			$.ajax({
            				url : "refundRefusal.adpa",
            				type : "get",
            				data : { partnerOrderId : partnerOrderId },
            				success : function() {
            					console.log("성공");
            					$(".apno:contains("+partnerOrderId+")").parent().children().eq(7).html("");
            				},
            				error : function() {
            					console.log("실패");
            				}
            			});
            		}
            	</script>
        
        <div id="pagingArea">
    <ul class="pagination">
        <c:choose>
            <c:when test="${requestScope.pi.currentPage eq 1}">
                <li class="page-item disabled">
                    <a class="page-link" href="#">Previous</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="list.adpa?cpage=${requestScope.pi.currentPage - 1}">Previous</a>
                </li>
            </c:otherwise>
        </c:choose>
        
        <c:forEach var="p" begin="${requestScope.pi.startPage}" end="${requestScope.pi.endPage}" step="1">
            <li class="page-item">
                <a class="page-link" href="list.adpa?cpage=${p}">${p}</a>
            </li>
        </c:forEach>
        
        <c:choose>
            <c:when test="${requestScope.pi.currentPage eq requestScope.pi.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link" href="#">Next</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="list.adpa?cpage=${requestScope.pi.currentPage + 1}">Next</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>

        
     </div>
  
</body>
</html>