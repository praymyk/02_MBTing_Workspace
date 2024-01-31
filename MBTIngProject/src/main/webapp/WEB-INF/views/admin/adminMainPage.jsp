<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
    <!-- Chart.js CDN 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Font Awesome CDN 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">

<style>
    
    #content-center {
        width: 100%;
		margin-left: 230px;
    }
    #content-center1 {
        width: 100%;
        height: 300px;
        margin: auto;
        display: flex;
        align-items: center;
        align-content: row;

    }
    #content-center2 {
        width: 100%;
        height: 500px;
        margin-top: 30px;
    }
    #content-center3 {
        width: 100%;
        height: 500px;

    }
    #content-center4 {
        width: 100%;
        height: 500px;
        margin: auto;
        margin-top: 100px;
        margin-left: 30px;
    }
    #genderRate, #matchingRate, #freeUserRate {
        width: 400px;
        height: 500px;
        margin: auto;
        display: inline-block;
    }
    #monthGraph, #yearGraph, #registerGraph, #matchingGraph {
        width: 500px;
        height: 500px;
        margin: auto;
        display: inline-block;

    }
    .chart-container {
        width: 600px;
        height: 400px;
        padding: 20px;
        margin-bottom: 50px;
        margin-left: 30px;
    }
    #monthGraph {
        margin-right: 100px;
    }
    .chart-container-One {
        width: 300px;
        height: 300px;
        margin-bottom: 20px;
        display:inline-block;
        margin-right: 100px;
    }
    #genderRate, #matchingRate{
        margin-right: 50px;
    }
    #mbtiDistributionChart {
        width: 1200px;
        height: 500px;
        margin-left: 30px;

    }
    #signupChart {
        width: 600px;
        height: 400px;
        padding: 20px;
    }
    #matchingChart {
        width: 600px;
        height: 400px;
        margin: auto;
        padding: 20px;
        margin-left: 150px;
    }
    .stat-card {
        width: 240px;
        margin: 20px;
        padding: 20px;
        text-align: center;
        display: inline-block;
        background-color: rgb(252, 248, 202); /* background-color: rgb(202, 252, 208); */
    }
    
    .users-icon {
        color: #3498db; 
    }

    .matching-icon {
        color: #e74c3c;
    }

    .payment-icon {
        color: #2ecc71;
    } 

    .comments-icon {
        color: #f39c12;
    }
</style>
</head>
<body>

	<jsp:include page="../common/adminMenubar.jsp" />     

    <form id="adminMain.ad" action="" method="get">
      
    <div id="wrap">
    
    <div id="content-center">
        
        <div id="content-center1">
            <div id="count">
                <div class="stat-card">
                    <i class="fas fa-users fa-3x users-icon"></i>
                    <h2>전체 회원수</h2>
                    <p id="totalMembers">${totalMemberCount}</p>
                </div>
                

                <div class="stat-card">
                    <i class="fas fa-heart fa-3x matching-icon"></i>
                    <h2>전체 커플 매칭수</h2>
                    <p id="totalCouples">${totalCoupleCount}</p>
                </div>
            
                <div class="stat-card">
                    <i class="fas fa-credit-card fa-3x payment-icon"></i>
                    <h2>전체 결제 금액</h2>
                    <p id="totalPays">${totalPayCount }</p>
                </div>
            
                <div class="stat-card">
                    <i class="fas fa-comments fa-3x comments-icon"></i>
                    <h2>전체 후기 게시글수</h2>
                    <p id="totalBoards">${totalBoardCount }</p>
                </div>
            </div>
        </div>

        <div id="content-center2">
            <div id="registerGraph">
                <div id="signupChart">
                    <h3 align="center" >월별 회원가입 수</h3>
                    <canvas id="monthlySignupChart"></canvas>
                </div>
            </div>
            <div id="matchingGraph">
                <div id="matchingChart">
                    <h3 align="center" >매칭 상태</h3>
                    <canvas id="monthlyMatchingChart"></canvas>
                </div>
                
            </div>
        </div>
        
        <div id="content-center3">
            <div id="mbtiGraph">
                <div id="mbtiDistributionChart">
                    <h3 align="center" style="width: 1000px;">MBTI 성향 분포도</h3>
                    <canvas id="mbtiHistogramChart"></canvas>
                </div>
            </div>
        </div>

        <div id="content-center4">
            <div id="genderRate">
                <div class="chart-container-One">
                    <h3 align="center">남녀성비</h3>
                    <canvas id="genderRatioChart"></canvas>
                </div>
            </div>
            <div id="matchingRate">
                <div class="chart-container-One">
                    <h3 align="center">매칭 성공률</h3>
                    <canvas id="matchingSuccessChart"></canvas>
                </div>
            </div>
            <div id="freeUserRate">
                <div class="chart-container-One">
                    <h3 align="center">유료 계정 비율</h3>
                    <canvas id="premiumAccountChart"></canvas>
                </div>
            </div>
        </div>

        <div id="content-center5">
            <div id="monthGraph">
                <div class="chart-container">
                    <h3 align="center">월별 매출</h3>
                    <canvas id="monthlySalesChart"></canvas>
                </div>
            </div>
            <div id="yearGraph">
                <div class="chart-container" style="padding-left: 80px;">
                    <h3 align="center">년별 매출</h3>
                    <canvas id="yearlySalesChart"></canvas>
                </div>
            </div>
        </div>

    </div>
</div>
</form>

<!-- 월/년별 매출 그래프 -->
<script>

	
    // 가상의 데이터 예시 (실제 데이터로 교체 필요)
    const monthlySalesData = {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        datasets: [{
            label: '월별 매출',
            data: [],
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    };

    const yearlySalesData = {
        labels: ['2019', '2020', '2021', '2022', '2023'], // 년도에 맞게 수정
        datasets: [{
            label: '년별 매출',
            data: [],
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 1
        }]
    };

    // 차트 설정
    const chartOptions = {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    };

    // 월별 매출 라인 차트 생성
    const monthlySalesCtx = document.getElementById('monthlySalesChart').getContext('2d');
    const monthlySalesChart = new Chart(monthlySalesCtx, {
        type: 'line',
        data: monthlySalesData,
        options: chartOptions
    });

    // 년별 매출 라인 차트 생성
    const yearlySalesCtx = document.getElementById('yearlySalesChart').getContext('2d');
    const yearlySalesChart = new Chart(yearlySalesCtx, {
        type: 'line',
        data: yearlySalesData,
        options: chartOptions
    });



	<!-- 남녀성비 / 매칭성공률 / 유료 계정 비율 원그래프 -->

    // 가상의 데이터 예시 (실제 데이터로 교체 필요)
    const genderRatioData = {
        labels: ['남성', '여성'],
        datasets: [{
            data: [], // 실제 데이터로 교체 (예: 60% 남성, 40% 여성)
            backgroundColor: ['rgba(54, 162, 235, 0.7)', 'rgba(255, 99, 132, 0.7)'],
        }]
    };

    const matchingSuccessData = {
        labels: ['거절', '보류', '수락'],
        datasets: [{
            data: [], // 실제 데이터로 교체
            backgroundColor: ['rgba(255, 99, 132, 0.7)', 'rgba(255, 205, 86, 0.7)', 'rgba(75, 192, 192, 0.7)'],
        }]
    };

    const premiumAccountData = {
        labels: ['유료계정', '무료계정'],
        datasets: [{
            data: [], 
            backgroundColor: ['rgba(255, 99, 132, 0.7)', 'rgba(54, 162, 235, 0.7)'],
        }]
    };

    // 원형 차트 설정
    const chartOptions2 = {
        responsive: true,
        maintainAspectRatio: false,
    };

    // 각 원형 차트 생성
    const genderRatioCtx = document.getElementById('genderRatioChart').getContext('2d');
    const genderRatioChart = new Chart(genderRatioCtx, {
        type: 'doughnut',
        data: genderRatioData,
        options: chartOptions2
    });

    const matchingSuccessCtx = document.getElementById('matchingSuccessChart').getContext('2d');
    const matchingSuccessChart = new Chart(matchingSuccessCtx, {
        type: 'doughnut',
        data: matchingSuccessData,
        options: chartOptions2
    });

    const premiumAccountCtx = document.getElementById('premiumAccountChart').getContext('2d');
    const premiumAccountChart = new Chart(premiumAccountCtx, {
        type: 'doughnut',
        data: premiumAccountData,
        options: chartOptions2
    });


	<!-- MBTI 성향 분포도 -->
    // 가상의 데이터 예시 (실제 데이터로 교체 필요)
    const mbtiDistributionData = {
        labels: ['ENFJ', 'ENFP', 'ENTJ', 'ENTP', 'ESFJ', 'ESFP', 'ESTJ', 'ESTP', 'INFJ', 'INFP', 'INTJ', 'INTP', 'ISFJ', 'ISFP', 'ISTJ', 'ISTP'],
        datasets: [{
            label: 'MBTI 성향 분포',
            data: [],
            backgroundColor: 'rgba(75, 192, 192, 0.7)',
            borderWidth: 1,
            borderColor: 'rgba(75, 192, 192, 1)',
        }]
    };

    // 차트 설정
    const chartOptions3 = {
        scales: {
            x: {
                beginAtZero: true,
            },
            y: {
                beginAtZero: true,
            },
        },
    };

    // 히스토그램 생성
    const mbtiHistogramCtx = document.getElementById('mbtiHistogramChart').getContext('2d');
    const mbtiHistogramChart = new Chart(mbtiHistogramCtx, {
        type: 'bar',
        data: mbtiDistributionData,
        options: chartOptions3,
    });



	<!-- 월별 회원가입 수 -->
    // 가상의 데이터 예시 (실제 데이터로 교체 필요)
    const monthlySignupData = {
	    labels: ['01월', '02월', '03월', '04월', '05월', '06월', '07월', '08월', '09월', '10월', '11월', '12월'],
	    datasets: [{
	        label: '월별 회원가입 수',
	        data: [],  // 초기에는 빈 배열로 설정
	        backgroundColor: 'rgba(75, 192, 192, 0.7)',
	        borderColor: 'rgba(75, 192, 192, 1)',
	        borderWidth: 1,
	        fill: false,
	    }]
	};
    
    // 차트 설정
    const chartOptions4 = {
        scales: {
            x: {
                beginAtZero: true,
            },
            y: {
                beginAtZero: true,
            },
        },
    };

    // 라인 차트 생성
    const monthlySignupCtx = document.getElementById('monthlySignupChart').getContext('2d');
    const monthlySignupChart = new Chart(monthlySignupCtx, {
        type: 'line',
        data: monthlySignupData,
        options: chartOptions4,
    });
</script>


	<!-- 매칭 수락/거절/보류 -->
	<script>
    // 가상의 데이터 예시 (실제 데이터로 교체 필요)
    const monthlyMatchingData = {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        datasets: [{
            label: '수락',
            data: [],
            backgroundColor: 'rgba(75, 192, 192, 0.7)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1,
            fill: false,
        },{
            label: '거절',
            data: [],
            backgroundColor: 'rgba(255, 99, 132, 0.7)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 1,
            fill: false,
        }, 
        {
            label: '보류',
            data: [],
            backgroundColor: 'rgba(255, 205, 86, 0.7)',
            borderColor: 'rgba(255, 205, 86, 1)',
            borderWidth: 1,
            fill: false,
        }]
    };

    // 차트 설정
    const chartOptions5 = {
        scales: {
            x: {
                beginAtZero: true,
            },
            y: {
                beginAtZero: true,
            },
        },
    };

    // 라인 차트 생성
    const monthlyMatchingCtx = document.getElementById('monthlyMatchingChart').getContext('2d');
    const monthlyMatchingChart = new Chart(monthlyMatchingCtx, {
        type: 'line',
        data: monthlyMatchingData,
        options: chartOptions5,
    });
</script>

<!-- 실시간 정보불러오기 위한 ajax -->
<script>

  $(function() {
	   totalMemberCount();
	   totalCoupleCount();
	   totalPayCount();
	   totalBoardCount();
	   totalMonthlyCount();
	   totalMatchingSuccessCount();
	   totalMatchingRefusalCount();
	   totalMatchingPendingCount();
	   totalMbtiCount();
	   totalGenderRate();
	   totalMatchingRate();
	   totalPremiumCount();
	   totalFreeCount();
	   totalMonthlySalesCount();
	   totalyearlySalesCount();
  });
  
  function totalMemberCount() {
	  
	  $.ajax({
		  
		 url : "selectTotalMembers.ad",
		 type : "get",
		 success : function(result) {
			 $("#totalMembers").text(result + "명");
		 },
		 error : function() {
			 console.log("실퍀");
		 }
	  
	  });
  }
  
  function totalCoupleCount() {
	  
	  $.ajax({
		  
		  url : "selectTotalCouple.ad",
		  type : "get",
		  success : function(result) {
			  $("#totalCouples").text(result + "건");
		  },
		  error : function() {
			  console.log("ajax 통신 실패!");
		  }
	  });
  }
  
  function totalPayCount() {
	  
	  $.ajax({
		  
		  url : "selectTotalPay.ad",
		  type : "get",
		  success : function(result) {
			  const formattedResult = Number(result).toLocaleString();
			  $("#totalPays").text(formattedResult + "원");
		  },
		  error : function() {
			  console.log("ajax 통신 실패!");
		  }
	  });
  }
  
  function totalBoardCount() {
	  
	  $.ajax({
		  url : "selectTotalBoard.ad",
		  type : "get",
		  success : function(result) {
			  $("#totalBoards").text(result + "건");
		  },
		  error : function() {
			  console.log("ajax 통신 실패요~");
		  }
	  });
  }
  
  function totalMonthlyCount() {
	   
	  $.ajax({
	        url: "selectTotalMonthly.ad",
	        type: "get",
	        success: function (result) {
	            // console.log(result);

	         	// enrollCount 값만 추출하여 배열에 저장
	            const enrollCounts = result.map(item => item.enrollCount);
	            
	            // monthlySignupData 객체의 data 배열에 enrollCounts 배열을 할당
	            monthlySignupData.datasets[0].data = enrollCounts;

	            // 변경된 데이터 출력
	            // console.log(monthlySignupData);

	            // monthlySignupChart 차트 업데이트
	            monthlySignupChart.update();
	            
	        },
	        error: function () {
	            console.log("실패함ㅋ");
	        }
	    });
	}
	// 위 함수 호출
	totalMonthlyCount();

	// 커플 매칭 상태 수락 그래프
	function totalMatchingSuccessCount() {
		
		$.ajax({
			url : "selectTotalMatchingSuccess.ad",
			type : "get",
			success : function(result) {
				// console.log(result);
				
				const matchingSuccessCounts = result.map(item => item.matchStat);
				
				monthlyMatchingData.datasets[0].data = matchingSuccessCounts;
				
				monthlyMatchingChart.update();
				
			},
			error : function() {
				console.log("ajax 통신 실패!!");
			}
		});
	}
	totalMatchingSuccessCount();
	
	// 커플 매칭 상태 거절 그래프
	function totalMatchingRefusalCount() {
		
		$.ajax({
			url : "selectTotalMatchingRefusal.ad",
			type : "get",
			success : function(result) {
				// console.log(result);
				
				const matchingRefusalCounts = result.map(item => item.matchStat);
				
				monthlyMatchingData.datasets[1].data = matchingRefusalCounts;
				
				monthlyMatchingChart.update();
				
			},
			error : function() {
				console.log("ajax 통신 실패!!");
			}
		});
	}
	totalMatchingRefusalCount();

	
	// 커플 매칭 상태 보류 그래프
	function totalMatchingPendingCount() {
		
		$.ajax({
			url : "selectTotalMatchingPending.ad",
			type : "get",
			success : function(result) {
				// console.log(result);
				
				const matchingPendingCounts = result.map(item => item.matchStat);
				
				monthlyMatchingData.datasets[2].data = matchingPendingCounts;
				
				monthlyMatchingChart.update();
				
			},
			error : function() {
				console.log("ajax 통신 실패!!");
			}
		});
	}
	
	totalMatchingPendingCount();

	
	// MBTI 성향 분포도
	function totalMbtiCount() {
		
		$.ajax({
			url : "totalMbtiCount.ad",
			type : "get",
			success : function(result) {

				const mbtiCounts = result;
				
				mbtiDistributionData.datasets[0].data = mbtiCounts;
				
				mbtiHistogramChart.update();

			},
			error : function() {
				console.log("ajax 통신 실패!");
			}
		});
	}
	
	totalMbtiCount();
	
	// 남녀 성비 원그래프
	function totalGenderRate() {
		
		$.ajax({
			url : "totalGenderRate.ad",
			type : "get",
			success : function(result) {

				const genderRates = result;
				
				genderRatioData.datasets[0].data = genderRates;
				
				genderRatioChart.update();
				
			},
			error : function() {
				console.log("ajax 통신 실패!!!");
			}
		});
	}
	totalGenderRate();
	
	// 매칭 성공률 원그래프
	function totalMatchingRate() {
		
		$.ajax({
			url : "totalMatchingRate.ad",
			type : "get",
			success : function(result) {

				const matchingRates = result;
					
				matchingSuccessData.datasets[0].data = matchingRates;
				
				matchingSuccessChart.update();

			},
			error : function() {
				console.log("ajax 통신 실패!");
			}
		});
	}
	totalMatchingRate();
	
	/* 유,무료 계정비율은 1개의 data값에 2개의 ajax 값이 들어가야하는데
	   위의 ajax로 실행 시 순서를 알 수 없어, 유료, 무료 계정의 값이
	   서로 변경되어 나타날 때가 있어 아래의 코드로 작성해야 순차적으로 값이 들어감 */
	
	// 유료계정비율 원그래프
	function totalPremiumCount() {
	    return $.ajax({
	        url: "totalPremiumCount.ad",
	        type: "get"
	    });
	}

	// 무료계정비율 원그래프
	function totalFreeCount() {
	    return $.ajax({
	        url: "totalFreeCount.ad",
	        type: "get"
	    });
	}

	
	// 차트 업데이트 함수
	function updateChart() {
	    premiumAccountChart.update();
	}

	// 두 개의 Ajax 호출을 동시에 진행하고 모두 완료된 후에 차트 업데이트
	$.when(totalPremiumCount(), totalFreeCount()).then(function (resultPremium, resultFree) {
	    const premiumCounts = resultPremium[0];
	    const freeCounts = resultFree[0];
	    
	    premiumAccountData.datasets[0].data.push(premiumCounts);
	    premiumAccountData.datasets[0].data.push(freeCounts);
	    
	    updateChart();
	    
	    console.log(resultFree[0])
	});

	
	// 월별 매출 그래프
	function totalMonthlySalesCount() {
		   
		  $.ajax({
		        url: "totalMonthlySalesCount.ad",
		        type: "get",
		        success: function (result) {

		            const monthlySalesCounts = result;

		            // monthlySalesData 객체의 data 배열에 monthlySalesCounts 배열을 할당
		            monthlySalesData.datasets[0].data = monthlySalesCounts;

		            // monthlySignupChart 차트 업데이트
		            monthlySalesChart.update();
		            
		        },
		        error: function () {
		            console.log("실패함ㅋ");
		        }
		    });
		}
		// 위 함수 호출
		totalMonthlySalesCount();
	
		// 년 별 매출 그래프
		function totalyearlySalesCount() {
			
			$.ajax({
				url: "totalyearlySalesCount.ad",
				type : "get",
				success : function(result) {
	
					const yearlySalesCounts = result;
					
					yearlySalesData.datasets[0].data = yearlySalesCounts;
					
					yearlySalesChart.update();
				},
				error : function() {
					console.log("ajax 통신 실패!");
				}
			});
		}
		totalyearlySalesCount();
	
	

</script>

</body>
</html>