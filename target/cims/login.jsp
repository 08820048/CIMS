<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>校园即时通讯系统</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="./commons/bootstrap-3.3.7/dist/css/bootstrap.css">
    <link rel="stylesheet" href="./commons/bootstrap-treeview-1.2.0-dist/dist/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="./commons/bootstrap-select-1.13.9/dist/css/bootstrap-select.css">
    <link href="./commons/css/sticky-footer-navbar.css" rel="stylesheet">
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
            <a class="navbar-brand" href="">CIMS - 校园即时通系统</a>
        </div>
    </div>
</nav>
<!-- Begin page content -->
<div class="row">
    <div class="col-md-4">.col-md-4</div>
    <div class="col-md-4">.col-md-4</div>
    <div class="col-md-4">.col-md-4</div>
</div>
<div class="container" style="margin-top: 50px">
    <h3 style="text-align: center">CIMS - 校园即时通系统</h3>
    <form class="form-horizontal" action="login" method="post" style="text-align: center">
        <div class="form-group" >
            <label for="userName_login_input" class="col-sm-4 control-label"></label>
            <div class="input-group col-sm-4">
                <div class="input-group-addon">用户名</div>
                <input type="text" class="form-control" id="userName_login_input" name="userName" placeholder="请输入用户名">
                <span class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="userPassword_login_input" class="col-sm-4 control-label"></label>
            <div class="input-group col-sm-4">
                <div class="input-group-addon">&nbsp;&nbsp;密码&nbsp;&nbsp;</div>
                <input type="password" class="form-control" id="userPassword_login_input" name="userPassword"
                       placeholder="请输入密码">
                <div class="input-group-addon" id="passwordVisible_login_span"><span class="glyphicon glyphicon-eye-close"></span></div>
            </div>
        </div></form>
</div>
        <div class="col-sm-4"></div>
        <button class="btn btn-primary col-sm-4" id="submit_login_btn" type="submit" >登录</button>
    </form>
</div>

<footer class="footer navbar-fixed-bottom">
    <div class="container" style="text-align: center">
        <p class="text-muted">Campus Instant Messaging system  &copy;2021 杭州职业技术学院 软件技术专业</p>
    </div>
</footer>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="./commons/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="./commons/js/bootstrap.min.js"></script>
<script src="./commons/bootstrap-select-1.13.9/dist/js/bootstrap-select.min.js"></script>
<script src="./commons/bootstrap-treeview-1.2.0-dist/dist/bootstrap-treeview.min.js"></script></body>
<script>

    /*隐藏/显示密码*/
    $("#passwordVisible_login_span").click(function () {
        let flg=$(this).attr("visible") === 0;
        let i=$("<i></i>");
        $(this).empty();
        if (flg) {
            $("#userPassword_login_input").attr("type", "text");
            i.addClass("glyphicon glyphicon-eye-open");
            $(this).append(i);
            $(this).attr("visible", 1);
        }else{
            $("#userPassword_login_input").attr("type","password");
            i.addClass("glyphicon glyphicon-eye-close");
            $(this).append(i);
            $(this).attr("visible",0);
        }
    });

    /*登录请求*/
    $("#submit_login_btn").click(function () {
        $.ajax({
            url:"user/login",
            data:$("form").serialize(),
            type:"POST",
            dataType:"json",
            success:function (result) {
                if (result.code === 100){
                        window.location.href=result.target;
                }else {
                    if (result.extend.fieldErrors==="密码错误"){
                        alert("密码错误");
                    }else{
                        alert("用户不存在");
                    }
                }
            }
        })
    })


</script>
</html>
