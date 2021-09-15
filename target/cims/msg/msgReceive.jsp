<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>CMS-校园即时通系统</title>

    <!-- Bootstrap -->
    <link  href ="../commons/bootstrap-3.3.7/dist/css/bootstrap.css " rel ="stylesheet" >
    <link rel="stylesheet" href="../commons/bootstrap-3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="../commons/bootstrap-select-1.13.9/dist/css/bootstrap-select.css">
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="#" style="font-size: 20px;margin-left: 140px">CIMS-校园即时通系统</a></li>
                <li ><a href="#">首页 <span class="sr-only">(current)</span></a></li>
                <li ><a href="#">发消息<span class="sr-only">(current)</span></a></li>
                <li class="active"><a href="#">收消息 <span class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>注销</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>平台管理员：sysadmin</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<!--接受消息-->
<div class="container">
    <h3  class="page-header">接受消息</h3>
    <!--    表格-->
    <div class="panel panel-success">
    <!-- Default panel contents -->
     <div class="panel-heading ">这是一个通知 <span style="float:right"><p>FROM zhangsan [通知] 2021年9月11日 15点18分</p></span></div>
     <div class="panel-body">
          <p>
            这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知
            这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知
            这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知
           </p>
            <button type="button" class="btn btn-default" style="float: right">
                已完成
            </button>
    </div>
    </div>
    <div class="panel panel-danger">
        <!-- Default panel contents -->
        <div class="panel-heading ">这是一个通知 <span style="float:right"><p>FROM zhangsan [通知] 2021年9月11日 15点18分</p></span></div>
        <div class="panel-body">
            <p>
                这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知
                这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知
                这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知
            </p>
            <button type="button" class="btn btn-primary" style="float: right">
                <span class="glyphicon glyphicon-record" aria-hidden="true"></span>点击查收
            </button>
        </div>
    </div>
    <div class="panel panel-danger">
        <!-- Default panel contents -->
        <div class="panel-heading ">这是一个通知 <span style="float:right"><p>FROM zhangsan [通知] 2021年9月11日 15点18分</p></span></div>
        <div class="panel-body">
            <p>
                这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知
                这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知
                这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知
            </p>
            <div class="col-md-4" style="margin-left: 520px">
                <div class="input-group" >
                    <input type="text" class="form-control" placeholder="请输入内容" style="width: 500px; ">
                    <span class="input-group-btn">
                  <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-share-alt"
                                                                      aria-hidden="true"></span>回复</button>
                    </span>
                </div><!-- /input-group -->
            </div>
        </div>
    </div>
    <div class="panel panel-danger">
        <!-- Default panel contents -->
        <div class="panel-heading ">这是一个通知 <span style="float:right"><p>FROM zhangsan [通知] 2021年9月11日 15点18分</p></span></div>
        <div class="panel-body">
            <p>
                这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知
                这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知
                这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知
            </p>
            <button type="button" class="btn btn-primary" style="margin-left: 965px"><span class="glyphicon glyphicon-ok-sign"
                                                                aria-hidden="true"></span>赞成</button>
            <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove-sign"
                                                                aria-hidden="true"></span>反对</button>
        </div>
    </div>
    <div class="panel panel-success">
        <!-- Default panel contents -->
        <div class="panel-heading ">这是一个通知 <span style="float:right"><p>FROM zhangsan [通知] 2021年9月11日 15点18分</p></span></div>
        <div class="panel-body">
            <p>
                这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知
                这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知
                这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知
            </p>
            <button type="button" class="btn" style="float: right">
                已完成
            </button>
        </div>
    </div>
    <br><br><br><br>
</div>
<!--发送消息end-->

<!--footer-->
<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="container-fluid" style="text-align: center;padding-top: 20px">
        Campus Instant Message System@2021 杭州职业技术学校 软件技术专业
    </div>
</nav>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="../commons/bootstrap-3.3.7/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->

<script src="../commons/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<script src ="../commons/bootstrap-treeview-1.2.0/src/js/bootstrap-treeview.js"></script >
<script src="../commons/bootstrap-select-1.13.9/dist/js/bootstrap-select.js"></script>
<script src="../commons/js/chart.js"></script>
<script type="text/javascript">

</script>

</body>
</html>
