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
                <li class="active" ><a href="#">发消息<span class="sr-only">(current)</span></a></li>
                <li ><a href="#">收消息 <span class="sr-only">(current)</span></a></li>
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

<!--发送消息start-->
<div class="container">
    <h3  class="page-header">发送消息</h3>
    <!--    表格-->
    <table class="table table-bordered table-striped table-hover">
        <tr class="active">
            <th style="text-align: center;">标题</th>
            <th style="text-align: center;">时间</th>
            <th style="text-align: center;">类型</th>
            <th style="text-align: center;">操作</th>
        </tr>
        <tr >
            <td align="left" valign="middle">信息工程学院</td>
            <td style="text-align: center;">2021-9-10 18:53:26</td>
            <td style="text-align: center;">2</td>
            <td style="text-align: center;">
               <span class="input-group-btn">
              <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#myModal_1" >
                  <span class="glyphicon glyphicon-eye-open"
                      aria-hidden="true"></span>查看
              </button>
                <button type="button" class="btn btn-danger">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
                </span>
            </td>
        </tr>
        <tr>
            <td align="left" valign="middle">1号楼</td>
            <td style="text-align: center;">2021-9-10 18:53:26</td>
            <td style="text-align: center;">1</td>
            <td style="text-align: center;">
               <span class="input-group-btn">
              <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#myModal" >
                  <span
                          class="glyphicon glyphicon-eye-open"
                          aria-hidden="true"></span>查看
              </button>
                <button type="button" class="btn btn-danger">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
      </span>
            </td>
        </tr>
        <tr>
            <td align="left" valign="middle">2号楼</td>
            <td style="text-align: center;">2021-9-10 18:53:26</td>
            <td style="text-align: center;">2</td>
            <td style="text-align: center;">
               <span class="input-group-btn">
              <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#myModal" >
                  <span
                          class="glyphicon glyphicon-eye-open"
                          aria-hidden="true"></span>查看
              </button>
                <button type="button" class="btn btn-danger">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
      </span>
            </td>
        </tr>
        <tr>
            <td align="left" valign="middle">达利女装学院</td>
            <td style="text-align: center;">2021-9-10 18:53:26</td>
            <td style="text-align: center;">3</td>
            <td style="text-align: center;">
               <span class="input-group-btn">
              <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#myModal" >
                  <span
                          class="glyphicon glyphicon-eye-open"
                          aria-hidden="true"></span>查看
              </button>
                <button type="button" class="btn btn-danger">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
      </span>
            </td>
        </tr>
        <tr>
            <td align="left" valign="middle">吉利汽车学院</td>
            <td style="text-align: center;">2021-9-10 18:53:26</td>
            <td style="text-align: center;">3</td>
            <td style="text-align: center;">
               <span class="input-group-btn">
              <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#myModal" >
                  <span
                          class="glyphicon glyphicon-eye-open"
                          aria-hidden="true"></span>查看
              </button>
                <button type="button" class="btn btn-danger">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
      </span>
            </td>
        </tr>
        <!--表格尾部--存放分页等信息-->
        <tfoot>
        <tr>
            <div class="row">

                <td  rowspan="1" colspan="7">
                    <div class="col-md-4" style="margin-top:20px">
                 <span class="input-group-btn" >
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal_1">
                  <span class="glyphicon glyphicon-plus" ria-hidden="true"></span>新增
                </button>
                <button type="button" class="btn btn-danger">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
                </span>
                    </div>
                    <!--分页导航-->
                    <div class="col-md-4">
                        <div aria-label="Page navigation" >
                            <ul class="pagination">
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">首页</span>
                                    </a>
                                </li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">末页</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4" style="margin-top: 20px">
                        <h5>当前第一页,总100页,总1000条记录</h5>
                    </div>
                </td>
            </div>
        </tr>

        </tfoot>
    </table>
</div>

<!--发送消息end-->

<!--通知的模态框start-->
<div class="modal fade" id="myModal_1" tabindex="-1" role="dialog" aria-labelledby="look">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="edit">这是一个通知</h4>
                <small>通知 2020-9-21 10:12:21</small>
            </div>
            <div class="modal-body">
                的话就开始时间空间的考虑和雕刻技法开始交付时间空间的上课会尽快恢复精神的就会附件是东方时空就放松的方式
                方式覅实际发生发世界的分厘卡设计开发就是会计分录大家附近上空拦截的卡拉时间来得及啊是降低哦
                发射的火箭粉丝节粉丝金粉世家饭店健身房长时间嗲的急啊看你发哈是快捷方式卡
                <table class="table table-bordered  table-hover">
                    <tr >
                        <th style="text-align: center;">接收人</th>
                        <th style="text-align: center;">状态</th>
                        <th style="text-align: center;">回复时间</th>
                        <th style="text-align: center;">回复内容</th>
                    </tr>
                    <tr  class="danger">
                        <td align="left" valign="middle">张三</td>
                        <td style="text-align: center;">未处理</td>
                        <td style="text-align: center;">2021年9月9日16点24分</td>
                        <td style="text-align: center;">加拿大空军手机导航键</td>
                    </tr>
                    <tr  class="success" >
                        <td align="left" valign="middle">张三</td>
                        <td style="text-align: center;">未处理</td>
                        <td style="text-align: center;">2021年9月9日16点24分</td>
                        <td style="text-align: center;">加拿大空军手机导航键</td>
                    </tr>
                    <tr  class="danger" >
                        <td align="left" valign="middle">张三</td>
                        <td style="text-align: center;">未处理</td>
                        <td style="text-align: center;">2021年9月9日16点24分</td>
                        <td style="text-align: center;">加拿大空军手机导航键</td>
                    </tr>
                    <tr  class="danger" >
                        <td align="left" valign="middle">张三</td>
                        <td style="text-align: center;">未处理</td>
                        <td style="text-align: center;">2021年9月9日16点24分</td>
                        <td style="text-align: center;">加拿大空军手机导航键</td>
                    </tr>
                </table>
                <!--图标区域start-->

                    <canvas id="notice" width="400" height="200"
                            style="margin:-90px 40px -90px 40px;"></canvas>

                <!--图表区域end-->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!--通知的模态框end-->

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
<script src="../commons/js/chart.js"></script>

<script type="text/javascript">
    /*甜甜圈图表*/
    var ctx = $('#notice');
    var myChart_1 = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: [ '已读','未读','已回复',],
            datasets: [{

                /*图数据*/
                data: [400,300,200],
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(255, 205, 86)',
                    'rgb(54, 162, 235)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                /*饼图半径*/
                radius:'80%',
                cutout:'50%',
                /*鼠标经过效果*/
                hoverOffset:10,
                /*弧偏移*/
                offset:4,
                /*边框背景色*/
                // borderColor: [
                //     'rgba(255, 99, 132, 1)',
                //     'rgba(54, 162, 235, 1)',
                //     'rgba(255, 206, 86, 1)',
                //     'rgba(75, 192, 192, 1)',
                //     'rgba(153, 102, 255, 1)',
                //     'rgba(255, 159, 64, 1)'
                // ],
                /*边框宽度*/
                borderWidth: 1
            }]
        },
        /*全局参数配置*/
        options: {
            layout: {


            },
            plugins:{
                labels:{

                },
                tooltip:{
                    textDirection:'rtl',
                },
                legend:{
                    display:true,
                    position:'right',
                },
                title:{
                    display: false,
                    text:'接收消息',
                    position:'top',

                },
            },
        }
    });
</script>
</body>
</html>
