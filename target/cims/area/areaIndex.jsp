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
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <!--                <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a><>-->
                <li><a href="#" style="font-size: 20px;margin-left: 70px">CIMS-校园即时通系统</a>
                <li class="active"><a href="#">首页 <span class="sr-only">(current)</span></a>
                <li ><a href="areaManager.jsp">院校管理 <span class="sr-only">(current)</span></a>
                <li ><a href="areaAdminManager.jsp">院校管理员管理 <span class="sr-only">(current)</span></a>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="">
                    <span class="glyphicon glyphicon-user" aria-hidden="true" id="loginUser_nav"></span>
                </a>

                <li><a href="">
                    <span class="glyphicon glyphicon-log-out" aria-hidden="true" id="logout_nav">注销</span>
                </a>

            </ul>
        </div><!-- /.navbar-collapse -->

    </div><!-- /.container-fluid -->

</nav>

<div class="jumbotron" style="margin: auto;width: 95%;height:45%;margin-bottom: 220px;">
    <div class="page-header" style="margin-left: 5%;">
        <h1><small>校园即时通系统</small>云管理平台</h1>
        <h3>接入地区:</h3>
        <br>
        <p id="provinceCount" style="color: #00b3ee"></p>
        <h3>接入城市:</h3>
        <p id="cityCount" style="color: #00b3ee"></p>
        <h3>接入院校:</h3>
        <p id="schoolCount" style="color: #00b3ee"></p>
        <h3>使用用户:</h3>
        <br>
        <p id="userCount" style="color: #00b3ee"></p>
    </div>
</div>


<footer class="footer navbar-fixed-bottom">
    <div class="container" >
        <p class="text-muted" style="margin-left: 2000px;">Campus Instant Messaging system  &copy;2021 杭州职业技术学院 软件技术专业</p>
    </div>
</footer>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${App_Path}/commons/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${App_Path}/commons/js/bootstrap.min.js"></script>
<script src="${App_Path}/commons/bootstrap-select-1.13.9/dist/js/bootstrap-select.min.js"></script>
<script src="${App_Path}/commons/bootstrap-treeview-1.2.0-dist/dist/bootstrap-treeview.min.js"></script>
<script src="../commons/js/comInfo.js"></script>

<script type="text/javascript">
    /*请求首页数据*/
    $(function () {
        $.ajax({
            url:"count",
            type:"get",
            dataType:"json",
            success:function (result) {
                if (result.code === 100){
                    $("#provinceCount").html(result.extend.provinceCount+"个");
                    $("#cityCount").html(result.extend.cityCount+"个");
                    $("#schoolCount").html(result.extend.schoolCount+"个");
                    $("#userCount").html(result.extend.userCount+"名");
                }
            }
        })
    })
</script>
</body>

</html>
