<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>校园即时通讯系统</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${App_Path}/commons/bootstrap-3.3.7/dist/css/bootstrap.css">
    <link rel="stylesheet" href="${App_Path}/commons/bootstrap-treeview-1.2.0-dist/dist/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="${App_Path}/commons/bootstrap-select-1.13.9/dist/css/bootstrap-select.css">
    <link href="${App_Path}/commons/css/sticky-footer-navbar.css" rel="stylesheet">
    <![endif]-->
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">CIMS - 校园即时通讯系统</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">首页</a>

                <li ><a href="">发信息</a>
                <li ><a href="">收消息</a>
                <li class="dropdown">
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="">
                    <span class="glyphicon glyphicon-user" aria-hidden="true" id="loginUser_nav"></span>
                </a>

                <li><a href="">
                    <span class="glyphicon glyphicon-log-out" aria-hidden="true" id="logout_nav">注销</span>
                </a>

            </ul>
        </div><!--/.nav-collapse -->
    </div>

</nav>
<div class="container">
<div class="page-header">
    <h3>个人信息</h3>
</div>
<div  class="col-md-10" style="margin-top: 0px;margin-left: 100px" >
    <figure class="highlight">
        <pre>
            <div><div class="col-md-5" style="background-color: white;margin: 20px"><canvas id="pie-graph"></canvas></div>
                <div class="col-md-5"  style="background-color: white;margin: -15px 0px 0px 30px"><canvas id="lines-graph"></canvas></div></div>
            </pre>
    </figure>
</div>
</div>


<footer class="footer navbar-fixed-bottom">
    <div class="container" style="text-align: center">
        <p class="text-muted">Campus Instant Messaging system  &copy;2021 杭州职业技术学院 软件技术专业</p>
    </div>
</footer>

<script src="${App_Path}/commons/Chart.js-2.9.3/dist/Chart.bundle.js"></script>
<script src="${App_Path}/commons/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${App_Path}/commons/js/bootstrap.min.js"></script>
<script src="${App_Path}/commons/bootstrap-select-1.13.9/dist/js/bootstrap-select.min.js"></script>
<script src="${App_Path}/commons/bootstrap-treeview-1.2.0-dist/dist/bootstrap-treeview.min.js"></script>
<script src="../commons/js/comInfo.js"></script>
<script type="text/javascript">
    // 设置参数
    // Data for line charts
    var lineChartData = {
        labels: ["已读", "未读", "已回复"],

        datasets: [
            {
                label: "Dataset1",
                lineTension: 0.1,
                backgroundColor:"rgb(255, 99, 132,0.9)",
                fill:true,
                borderColor: "rgb(255, 99, 132,0.9)",
                borderCapStyle: 'butt',
                borderDash: [],
                borderDashOffset: 0.0,
                borderJoinStyle: 'miter',
                pointBorderColor: "rgb(192,61,81)",
                pointBackgroundColor: "#fff",
                pointBorderWidth: 1,
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgb(192,61,81)",
                pointHoverBorderColor: "rgba(220,220,220,1)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius: 10,
                data: [10,30,20],
                spanGaps: false,
            },  {
                label: "Dataset2",
                lineTension: 0.1,
                fill:true,
                backgroundColor: "rgba(75,192,192,0.4)",
                fillColor:"rgb(75,145,192,0.4)",
                borderColor: "rgb(75,145,192,0.4)",
                borderCapStyle: 'butt',
                borderDash: [],
                borderDashOffset: 0.0,
                borderJoinStyle: 'miter',
                pointBorderColor: "rgb(75,145,192)",
                pointBackgroundColor: "#fff",
                pointBorderWidth: 1,
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgb(75,145,192)",
                pointHoverBorderColor: "rgba(220,220,220,1)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius: 10,
                data: [50,20,40],
                spanGaps: false,
            },
        ]
    };

    var ctx = document.getElementById("lines-graph").getContext("2d");
    var LineChart = new Chart(ctx, {
        type: 'line',
        data: lineChartData,
        responsive: true,
        bezierCurve : false,
        options: {
            legend: {
                position: 'right'
            },
        },
    });

    // Data for pie chart
    var pieData = {
        labels: [
            "已读",
            "未读",
            "已回复"
        ],
        datasets: [
            {
                label:"发送消息",
                data: [15, 35, 50],
                backgroundColor: [
                    "#FF6384",
                    "#FFCE56",
                    "#36A2EB"
                ],
                hoverBackgroundColor: [
                    "#FF6384",
                    "#FFCE56",
                    "#36A2EB"
                ]
            }]
    };

    var ctx = document.getElementById("pie-graph").getContext("2d");
    var PieChart = new Chart(ctx,{
        type: 'pie',
        data: pieData,
        options: {
            legend: {
                position: 'right'
            },
        },
    });
</script>

<script>

</script>
</body>
</html>
