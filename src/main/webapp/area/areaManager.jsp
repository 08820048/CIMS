<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%pageContext.setAttribute("App_Path", request.getContextPath());%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>CIMS-院校管理</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${App_Path}/commons/bootstrap-3.3.7/dist/css/bootstrap.css">
    <link rel="stylesheet" href="${App_Path}/commons/bootstrap-treeview-1.2.0-dist/dist/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="${App_Path}/commons/bootstrap-select-1.13.9/dist/css/bootstrap-select.css">
    <link href="${App_Path}/commons/css/sticky-footer-navbar.css" rel="stylesheet">
    <!-- 自定义全局样式 -->


    <style>
        .jumbotron {
            margin-top: 100px;
        }

        .operation {
            height: 40px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">CIMS-校园即时通系统</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="areaIndex">首页</a></li>
                <li class="active"><a href="areaManager">院校管理</a></li>
                <li><a href="areaAdminManager">院校管理员管理</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span>平台管理员：<span id="loginUser_nav"></span></a>
                </li>
                <li id="logout_nav"><a href="#"><span class="glyphicon glyphicon-log-out"></span>注销</a></li>
            </ul>
        </div>
    </div>
</nav>


<!-- /container -->
<div class="container">
    <h3>院校管理</h3>
    <hr>
    <div class="row">
        <div class="col-lg-4">
            <div class="operation text-center">
                <button type="button" class="btn btn-primary" id="add_area_btn"><span class="glyphicon glyphicon-plus"
                                                                                      aria-hidden="true"></span>添加
                </button>
                <button type="button" class="btn btn-danger" id="delete_area_btn"><span
                        class="glyphicon glyphicon-remove"
                        aria-hidden="true"></span>删除
                </button>
            </div>
            <div class="sidebar">
                <div id="area_tree"></div>
            </div>
        </div>
        <div class="col-lg-8">
            <div id="add_area_div">
                <h4>添加院校</h4>
                <hr>
                <div class="row">
                    <form class="form-horizontal" action="" method="get" id="add_area_frm">
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaParentName_add_input">父节点</label>
                            <div class="col-lg-10">
                                <input type="hidden" name="areaParentId" id="areaParentId_add_input">
                                <input class="form-control" type="text" id="areaParentName_add_input" value=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaName_add_input">名称</label>
                            <div class="col-lg-10">
                                <input class="form-control" type="text" name="areaName" id="areaName_add_input"
                                       value=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaType_add_select">类型</label>
                            <div class="col-lg-10">
                                <input type="hidden" name="areaType" id="areaType_add_input">
                                <select class="selectpicker" id="areaType_add_select" title="请选择类型" data-width="100%">
                                    <option>省</option>
                                    <option>市</option>
                                    <option>院校</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaSortNumber_add_input">排序号</label>
                            <div class="col-lg-10 areaSortNum_input">
                                <input class="form-control" type="text" name="areaSortNum" id="areaSortNumber_add_input"
                                       value=""/>
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <button type="button" class="btn btn-primary" id="submit_add_btn"><span
                                    class="glyphicon glyphicon-download-alt"
                                    aria-hidden="true"></span>保存
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <div id="modify_area_div">
                <h4>修改</h4>
                <hr>
                <div class="row">
                    <form class="form-horizontal" action="" method="get" id="modify_area_frm">

                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaParentName_modify_input">父节点</label>
                            <div class="col-lg-10">
                                <%--父节点id--%>
                                <input type="hidden" name="areaParentId" id="areaParentId_modify_input">
                                <input class="form-control" type="text" name="" id="areaParentName_modify_input"
                                       value=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaName_modify_input">名称</label>
                            <div class="col-lg-10">
                                <input class="form-control" type="text" name="areaName" id="areaName_modify_input"
                                       value=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaType_modify_select">类型</label>
                            <div class="col-lg-10">
                                <input type="hidden" name="areaType" id="areaType_modify_input">
                                <select class="selectpicker" id="areaType_modify_select" title="请选择类型"
                                        data-width="100%">
                                    <option>省</option>
                                    <option>市</option>
                                    <option>院校</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaSortNumber_modify_input">排序号</label>
                            <div class="col-lg-10 areaSortNum_input">
                                <input class="form-control" type="text" name="areaSortNum"
                                       id="areaSortNumber_modify_input"
                                       value=""/>
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <button type="button" class="btn btn-primary" id="submit_modify_btn">
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>修改
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="footer">
    <p class="text-center">@2020 杭州职业技术学院 软件技术专业</p>
</footer>


<!-- js导入 -->

<script src="${App_Path}/commons/js/jquery.min.js"></script>
<script src="${App_Path}/commons/Chart.js-2.9.3/dist/Chart.bundle.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${App_Path}/commons/js/bootstrap.min.js"></script>
<script src="${App_Path}/commons/bootstrap-select-1.13.9/dist/js/bootstrap-select.min.js"></script>
<script src="${App_Path}/commons/bootstrap-treeview-1.2.0-dist/dist/bootstrap-treeview.min.js"></script>
<script src="../commons/js/comInfo.js"></script>
<script type="text/javascript">
    $(function () {
        loadAreaTree();
        $("#add_area_div").hide();//添加的div
        $("#modify_area_div").hide();//修改的div
    });

    /*添加操作*/
    $("#add_area_btn").click(function () {
        /*获取被选中的节点*/
        let nodesSelected = $("#area_tree").treeview("getSelected");
        let count = Object.keys(nodesSelected).length;
        if (count > 0) {
            $("#add_area_frm")[0].reset();
            $("#add_area_div").hide();
            $("#modify_area_frm")[0].reset();
            $("#modify_area_div").hide();
            $("#add_area_div").show();
            $("#areaParentName_add_input").val(nodesSelected[0].text);
            $("#areaParentId_add_input").val(nodesSelected[0].id);
            $("#areaType_add_select").selectpicker('val', [nodesSelected[0].areaType + 1]);
        } else {
            alert("请选择需要添加的节点！");
        }
    });

    /*添加验证*/
    function validateAdd() {
        let flag = true;
        let reg = /^(\d+)$/;
        let areaParentName = $("#areaParentName_add_input").val();
        let areaName = $("#areaName_add_input").val();
        let areaType = $("#areaType_add_select").selectpicker('val');
        let areaSortNumber = $("#areaSortNumber_add_input").val();
        if (areaParentName === "院校配置") {
            $("#areaParentId_add_input").val(null)
        }
        if (areaParentName == null || areaName == null || !reg.test(areaSortNumber) || areaType == null) {
            show_validation_msg(".areaSortNum_input","error","请输入排序号");
            flag = false;
        }
        /*将select选中的id绑定到隐藏域*/
        let areaTypeId;
        if (areaType === "省")
            areaTypeId = 1;
        if (areaType === "市")
            areaTypeId = 2;
        if (areaType === "院校")
            areaTypeId = 3;

        $("#areaType_add_input").val(areaTypeId);
        return flag;
    }

    /*修改验证*/
    function validateUpdate() {
        let flag = true;
        let reg = /^(\d+)$/;
        let areaParentName = $("#areaParentName_modify_input").val();
        let areaName = $("#areaName_modify_input").val();
        let areaType = $("#areaType_modify_select").selectpicker('val');
        let areaSortNumber = $("#areaSortNumber_modify_input").val();
        if (areaParentName == null || areaName == null || !reg.test(areaSortNumber) || areaType == null) {
            flag = false;
        }
        /*将select选中的id绑定到隐藏域*/
        let areaTypeId;
        if (areaType === "省")
            areaTypeId = 1;
        if (areaType === "市")
            areaTypeId = 2;
        if (areaType === "院校")
            areaTypeId = 3;

        $("#areaType_modify_input").val(areaTypeId);
        return flag;
    }

    /*修改操作*/
    $("#submit_modify_btn").click(function () {
        /*打印修改校验信息*/
        console.log("修改校验信息:",validateUpdate());
        // var parentId = $("#areaParentId_modify_input")
        if (validateUpdate()) {
            //请求修改
            $.ajax({
                url: "school/" + $(this).attr("edit-id"),
                data: $("#modify_area_frm").serialize(),
                type: "put",
                dataType: "json",
                success: function (result) {
                    if (result.code === 100) {
                        //修改成功，刷新所有地域信息并打印日志
                        console.log();
                        loadAreaTree();
                        alert("信息已成功修改并刷新了页面!")
                    }
                }
            });
        } else {
            alert("修改失败！");
        }

    });

    /*删除操作*/
    $("#delete_area_btn").click(function (message) {
        /*判断是否有地域选中*/
        let nodesSelected = $("#area_tree").treeview("getSelected");
        alert("你选中了", nodesSelected);
        /*没有选择，无需删除*/
        if (nodesSelected.length === 0) {
            alert("请选择需要删除的院校！");
            return;
        }
        /*获取删除的目标id*/
        let delete_id = nodesSelected[0].id;
        console.log("删除id:",delete_id);
        alert("待删除的目标id:"+delete_id);
        /*请求删除*/
        $.ajax({
            url: "school/" + delete_id,
            type: "delete",
            data: $("#modify_area_frm").serialize(),
            dataType: "json",
            success: function (result) {
                if (result.code === 100) {
                    //删除成功，刷新所有地域信息
                    alert("删除成功院校！");
                    loadAreaTree();
                } else {
                    alert("删除失败！");
                }
            }
        });
    });

    /*加载树结构*/
    function loadAreaTree(message) {
        let treeData = [{
            text: "院校配置",
            id: 0,
            areaType: 0,
            nodes: []
        }];
        $.ajax({
            url: "tree",
            dataType: "json",
            type: "GET",
            success: function (result) {
                treeData[0].nodes = result.extend.areas;
                console.log("tree请求结果:"+result);
                $('#area_tree').treeview({
                    data: treeData,
                    levels: 2,
                    /*被选中之后的回调函数*/
                    onNodeSelected:function (event, node) {
                        $("#add_area_frm")[0].reset();//添加的form重置
                        $("#add_area_div").hide();//添加的div隐藏
                        $("#modify_area_frm")[0].reset();//修改的form重置
                        $("#modify_area_div").hide();//修改的div隐藏
                        $("#add_area_btn").attr("disabled", "disabled");//添加按钮禁用
                        $("#delete_area_btn").attr("disabled", "disabled");//删除按钮禁用
                        if (node.areaType < 3) {
                            $("#add_area_btn").removeAttr("disabled");//
                        }
                        if (node.areaType > 0) {
                            $("#delete_area_btn").removeAttr("disabled");
                            $("#modify_area_div").show();
                            let parentNode = $("#area_tree").treeview("getParent", node);
                            $("#areaParentName_modify_input").val(parentNode.text);
                            /*省份的节点parentId为null*/
                            if (parentNode.id === 0) {
                                $("#areaParentId_modify_input").val(null);
                            } else {
                                $("#areaParentId_modify_input").val(parentNode.id);
                            }
                            $("#areaName_modify_input").val(node.text);
                            let areaOptions = ['省', '市', '院校'];
                            $("#areaType_modify_select").attr("disabled", "disabled");
                            $("#areaType_modify_select").selectpicker('val', areaOptions[node.areaType - 1]);
                            $("#areaType_modify_input").val(node.areaType);
                            /*打印日志信息*/
                            console.log(node.areaType);
                            $("#areaSortNumber_modify_input").val(node.areaSortNum);
                            $("#submit_modify_btn").attr("edit-id", node.id);
                        }
                    },
                    /*未选择状态*/
                    onNodeUnselected: function (event, node) {
                        $("#add_area_frm")[0].reset();
                        $("#add_area_div").hide();
                        $("#modify_area_frm")[0].reset();
                        $("#modify_area_div").hide();
                        $("#add_area_btn").attr("disabled", "disabled");
                        $("#delete_area_btn").attr("disabled", "disabled");
                    }
                });
            }
        });

        /*添加请求*/
        $("#submit_add_btn").click(function () {
            /*添加前的校验*/
            if (validateAdd()) {
                //请求添加
                $.ajax({
                    url: "school",
                    data: $("#add_area_frm").serialize(),
                    type: "post",
                    dataType: "json",
                    success: function (result) {
                        console.log(result);
                        if (result.code === 100) {
                            //添加成功，刷新所有地域信息
                            alert("添加成功！");
                            /*重新加载地域信息(刷新)*/
                            loadAreaTree();
                        } else {
                            alert("请选择需要添加的节点！");
                        }
                    }
                });
            } else {
                alert("不能为空或字符类型不匹配。添加失败！");
            }
        });
    }

</script>
</body>
</html>
