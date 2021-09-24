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

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">单位管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="unitType.jsp">单位类型</a></li>
                        <li><a href="unitManager.jsp">单位管理</a></li>

                    </ul>
                </li>
                <li ><a href="">用户管理</a>
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

<div  class="col-md-10" style="margin-top: 80px;margin-left: 100px" >
    <figure class="highlight" >
        <pre>
            <div><div class="col-md-4"><h1 style="margin-bottom: 100px"> <small>杭州职业技术学院</small> 即时通系统管理平台</h1><h4>
               <p>接入单位:</p><small>10个</small></h4>
            <h4>接入用户：</h4><small>10000名</small></div>
                <div class="col-md-8" >
                <canvas id="bars-graph" style="height: 20%;width: 50%;margin-top: 100px"></canvas></div></div>

<table>
    <tr> <td class="col-md-6"></td></tr>

    </table>
            </pre>
    </figure>
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
    // Bar Charts
    var barChartData = {
        labels: ["2020-05", "2020-06", "2020-07", "2020-08", "2020-09"],
        datasets: [
            {
                label: "Dataset1",
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1,
                data: [10, -30, 20, -50, 40],
            }
        ],
        options:{
            plugins:{
                title:{
                    display: true,
                    text: '月发送消息统计图'
                },
                responsive:true,
                legend:{
                    position:'right',
                },
            },

        }
    };

    var ctx = document.getElementById("bars-graph").getContext("2d");
    var BarChart = new Chart(ctx, {
        type: 'bar',
        data: barChartData,
        responsive : true
    });
</script>
<script>
    $.fn.loadLoginUser=function() {
        $.ajax({
            url:"../loginUser",
            type:"get",
            dataType:"json",
            success:function (result) {
                if (result.code ===100){
                    $("#loginUser_nav").append(result.extend.loginUser.userName);
                    if (result.extend.loginUser.userType>1){
                        let area="["+result.extend.loginUser.area.parentArea.parentArea.areaName+" "
                            +result.extend.loginUser.area.parentArea.parentArea.areaName+" "
                            +result.extend.loginUser.area.areaName+"]";
                        $("#loginUser_nav").append($("<small></small>").append(area));
                    }
                }
            }
        })
    };

    $.fn.logout=function () {
        $.ajax({
            url:"../logout",
            type:"get",
            dataType: "json",
            success:function (result) {
                if (result.code===100){
                    window.location.href=result.target;
                }
            }
        })
    };

    $(function () {
        $.fn.loadLoginUser();
    });

    $("#logout_nav").click(function () {
        $.fn.logout();
    });
</script>
</body>
</html>
