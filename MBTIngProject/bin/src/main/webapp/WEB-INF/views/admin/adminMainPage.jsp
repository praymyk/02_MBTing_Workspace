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
        width: 1320px;
		margin-left: 230px;
    }
    #content-center1 {
        width: 1320px;
        height: 300px;
        margin: auto;
        display: flex;
        align-items: center;
        align-content: row;

    }
    #content-center2 {
        width: 1320px;
        height: 500px;
        margin-top: 30px;
    }
    #content-center3 {
        width: 1320px;
        height: 500px;

    }
    #content-center4 {
        width: 1320px;
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
                    <p>1,000,000명</p>
                </div>
                <div class="stat-card">
                    <i class="fas fa-heart fa-3x matching-icon"></i>
                    <h2>전체 커플 매칭수</h2>
                    <p>500,000커플</p>
                </div>
            
                <div class="stat-card">
                    <i class="fas fa-credit-card fa-3x payment-icon"></i>
                    <h2>유료 결제수</h2>
                    <p>50,000건</p>
                </div>
            
                <div class="stat-card">
                    <i class="fas fa-comments fa-3x comments-icon"></i>
                    <h2>전체 후기 게시글수</h2>
                    <p>10,000건</p>
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
            data: [5000, 6000, 5500, 7000, 8000, 9500, 9000, 8500, 7500, 8200, 9500, 11000],
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    };

    const yearlySalesData = {
        labels: ['2019', '2020', '2021', '2022', '2023'], // 년도에 맞게 수정
        datasets: [{
            label: '년별 매출',
            data: [60000, 75000, 90000, 110000, 130000], // 실제 데이터로 교체
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
</script>


<!-- 남녀성비 / 매칭성공률 / 유료 계정 비율 원그래프 -->
<script>
    // 가상의 데이터 예시 (실제 데이터로 교체 필요)
    const genderRatioData = {
        labels: ['남성', '여성'],
        datasets: [{
            data: [60, 40], // 실제 데이터로 교체 (예: 60% 남성, 40% 여성)
            backgroundColor: ['rgba(54, 162, 235, 0.7)', 'rgba(255, 99, 132, 0.7)'],
        }]
    };

    const matchingSuccessData = {
        labels: ['수락', '거절', '보류'],
        datasets: [{
            data: [70, 20, 10], // 실제 데이터로 교체
            backgroundColor: ['rgba(75, 192, 192, 0.7)', 'rgba(255, 99, 132, 0.7)', 'rgba(255, 205, 86, 0.7)'],
        }]
    };

    const premiumAccountData = {
        labels: ['유료계정', '무료계정'],
        datasets: [{
            data: [30, 70], // 실제 데이터로 교체 (예: 30% 유료계정, 70% 무료계정)
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
</script>

<!-- MBTI 성향 분포도 -->
<script>
    // 가상의 데이터 예시 (실제 데이터로 교체 필요)
    const mbtiDistributionData = {
        labels: ['ISTJ', 'ISFJ', 'INFJ', 'INTJ', 'ISTP', 'ISFP', 'INFP', 'INTP', 'ESTP', 'ESFP', 'ENFP', 'ENTP', 'ESTJ', 'ESFJ', 'ENFJ', 'ENTJ'],
        datasets: [{
            label: 'MBTI 성향 분포',
            data: [10, 8, 15, 12, 5, 7, 20, 18, 6, 4, 22, 16, 9, 7, 14, 11],
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
</script>


<!-- 월별 회원가입 수 -->
<script>
    // 가상의 데이터 예시 (실제 데이터로 교체 필요)
    const monthlySignupData = {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        datasets: [{
            label: '월별 회원가입 수',
            data: [100, 120, 150, 80, 200, 180, 250, 220, 190, 210, 300, 280],
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
            data: [50, 60, 70, 80, 90, 100, 120, 110, 95, 85, 75, 60],
            backgroundColor: 'rgba(75, 192, 192, 0.7)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1,
            fill: false,
        }, {
            label: '거절',
            data: [10, 15, 20, 25, 30, 35, 40, 35, 30, 25, 20, 15],
            backgroundColor: 'rgba(255, 99, 132, 0.7)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 1,
            fill: false,
        }, {
            label: '보류',
            data: [5, 8, 10, 15, 18, 20, 25, 22, 18, 15, 10, 8],
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



</body>
</html>