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
    <link href ="../commons/bootstrap-3.3.7/dist/css/bootstrap.css " rel ="stylesheet" >
    <link rel="stylesheet" href="../commons/bootstrap-3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../commons/bootstrap-select-1.13.9/dist/css/bootstrap-select.css">
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <!--                <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>-->
                <li><a href="#" style="font-size: 20px;margin-left: 30px">CIMS-校园即时通系统</a></li>
                <li ><a href="#">首页 <span class="sr-only">(current)</span></a></li>
                <li class="active"><a href="#">院校管理 <span class="sr-only">(current)</span></a></li>
                <li ><a href="#">院校管理员管理 <span class="sr-only">(current)</span></a></li>
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
<!--院校管理body-->
<h3 style="margin-left: 5%;">院校管理</h3>
<hr>


<button type="button" style="margin-left: 8%;margin-bottom: 1%;" class="btn btn-primary"><span
        class="glyphicon glyphicon-plus"
                                                                           aria-hidden="true"></span>添加
</button>
<button type="button"  style="margin-bottom: 1%;" class="btn btn-danger"><span class="
glyphicon glyphicon-remove" aria-hidden="true"></span>删除</button>

<div class="row">
    <div class="col-md-4" style="width: 19%;margin-left: 5%;" id="tree" >
        sdvfsdf
    </div>
    <div id="right"  class="col-md-8" style="margin-top: -4%;">
        <h3>添加院校</h3>
        <hr>
        <form class="form-horizontal">
            <div class="form-group">
                <label for="parent1" class="col-sm-2 control-label">父节点</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="parent1" placeholder="">
                </div>
            </div>
            <div class="form-group">
                <label for="names1" class="col-sm-2 control-label">名称</label>
                <div class="col-sm-10">
            <input type="text" class="form-control" id="names1" placeholder="">
        </div>
    </div>
            <div class="form-group">

                <label for="types1" class="col-sm-2 control-label">类别</label>
                <div class="col-sm-10">
                    <select class="selectpicker" data-width="100%" id="types1"   name="department.deptId"
                            title="请选择类别">
                        <option value="dd"></option>
                    </select>
                    <span class="help-block">    </span>
                </div>
            </div>
            <div class="form-group">
                <label for="sortnum1" class="col-sm-2 control-label">排序号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="sortnum1" placeholder="">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-8" style="margin-left: 50%;">
                    <button type="submit" class="btn btn-primary">
                        <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>保存</button>
                </div>
            </div>
        </form>
        <h3>修改</h3>
        <hr>
        <form class="form-horizontal">
            <div class="form-group">
                <label for="parent" class="col-sm-2 control-label">父节点</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="parent" placeholder="">
                </div>
            </div>
            <div class="form-group">
                <label for="names" class="col-sm-2 control-label">名称</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="names" placeholder="">
                </div>
            </div>
            <div class="form-group">

                <label for="types" class="col-sm-2 control-label">类别</label>
                <div class="col-sm-10">
                    <select class="selectpicker" data-width="100%" id="types"   name="department.deptId"
                            title="请选择类别">
                        <option value="dd"></option>
                    </select>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="sortnum" class="col-sm-2 control-label">排序号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="sortnum" placeholder="">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-8" style="margin-left: 50%;">
                    <button type="submit" class="btn btn-primary">
                        <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>保存</button>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-8" style="margin-left: 50%;">
                    <button type="submit" class="btn btn-primary">
                        <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>保存</button>
                </div>
            </div>
        </form>

    </div>
</div>



<!--footer-->
<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="container-fluid" style="text-align: center;padding-top: 20px">
        Campus Instant Message System@2021 杭州职业技术学校 软件技术专业
    </div>
</nav>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="../commons/bootstrap-3.3.7/js/jquery.min.js/"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="../commons/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<script src ="../commons/bootstrap-treeview-1.2.0/src/js/bootstrap-treeview.js"></script >
<script src="../commons/bootstrap-select-1.13.9/dist/js/bootstrap-select.js"></script>
<script type="text/javascript">

    function getTree() {
        return [
            {
                text: "院校配置",
                nodes: [
                    {
                        text: "浙江省",
                        nodes: [
                            {
                                text: "杭州市"
                            },
                            {
                                text: "宁波市"
                            },
                            {
                                text:"温州市"
                            }
                        ]
                    },
                    {
                        text: "江苏省",
                        nodes: [
                            {
                                text: "南京市"
                            },
                            {
                                text: "苏州"
                            }
                        ]
                    },
                    {
                        text:"安徽省",
                        nodes: [

                        ]
                    }
                ],
            },
        ];
    }
    $('#tree').treeview({
        data:getTree(),
        levels:5,
        backColor:'white'
    });
</script>
</body>
</html>
