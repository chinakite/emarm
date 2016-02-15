<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>悦库时光音频资源管理系统 | 制作任务详情</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href='<idp:url value="/css/bootstrap.min.css"/>'>
    <!-- Font Awesome -->
    <link rel="stylesheet" href='<idp:url value="/css/font-awesome.min.css"/>'>
    <!-- Ionicons -->
    <link rel="stylesheet" href='<idp:url value="/css/ionicons.min.css"/>'>
    <!-- jvectormap -->
    <link rel="stylesheet" href='<idp:url value="/plugins/jvectormap/jquery-jvectormap-1.2.2.css"/>'>
    <!-- Theme style -->
    <link rel="stylesheet" href='<idp:url value="/css/AdminLTE.min.css"/>'>
    
    <link rel="stylesheet" href='<idp:url value="/css/emarm.css"/>'>
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href='<idp:url value="/css/skins/_all-skins.min.css"/>'>

    <!-- DataTables -->
    <link rel="stylesheet" href='<idp:url value="/plugins/datatables/dataTables.bootstrap.css"/>'>

    <link rel="stylesheet" href='<idp:url value="/css/skins/skin-emarm.css"/>'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="hold-transition skin-emarm">
    <header class="main-header flat-header">
        <nav class="navbar navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <img style="margin-top: 4px;" src='<idp:url value="/img/logo.png"/>' height="40"/>
            </div>
          </div><!-- /.container-fluid -->
        </nav>
    </header>
    <div class="wrapper detailBody">
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper detailContent">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1 class="detailTitle col-xs-6">${task.product.name}</h1>
            <span class="label bg-green pull-right">${task.stateText}</span>
            <!--
            <c:if test="${product.state == '0' || fn:indexOf(sessionScope.__SESSION__USER__.role, '99') != '-1' || fn:indexOf(sessionScope.__SESSION__USER__.role, '02') != '-1' || fn:indexOf(sessionScope.__SESSION__USER__.role, '03') != '-1'}">
                <button class="btn btn-default pull-right ml10" onclick="deleteProduct('${product.name}');"><i class="fa fa-remove"></i> 删除</button>
                <button class="btn btn-default pull-right ml10" onclick="popAuditProduct('${product.id}', '${product.name}');"><i class="fa fa-edit"></i> 编辑</button>
            </c:if>
            <c:if test="${product.state == '2' || product.state == '3'}">
                <button class="btn btn-default pull-right ml10" onclick="popAuditProduct('${product.id}', '${product.name}');"><i class="fa fa-tag"></i> 邀请评价</button>
            </c:if>
            <c:if test="${product.state == '1'}">
                <button class="btn btn-default pull-right ml10" onclick="popAuditProduct('${product.name}');"><i class="fa fa-star-half-empty"></i> 审核</button>
            </c:if>
            -->
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box box-widget">
                  <div class="box-body">
                      <div class="row">
                          <div class="col-xs-2">
                              <img width="136" src='<idp:url value="/img/default_product_logo.jpg"/>'/>
                          </div>
                          <div class="col-xs-10">
                              <p class="col-xs-12">作品：<a>${task.product.name}</a></p>
                              <p class="col-xs-5 detailInfo-light">制作团队：${task.maker.name}</p>
                              <p class="col-xs-7 detailInfo-light">制作合同：<a href=''>aaa</a></p>
                              <p class="col-xs-5 detailInfo-light">单集时长：${task.timePerSection} 分钟</p>
                              <p class="col-xs-7 detailInfo-light">制作周期：${task.makeTime}&nbsp;天</p>
                              <p class="col-xs-12 detailInfo-light">演员要求：</p>
                              <p class="col-xs-12 detailInfo-light productSummary">${task.showExpection}</p>
                              <p class="col-xs-12 detailInfo-light">备注：</p>
                              <p class="col-xs-12 detailInfo-light productSummary">${task.desc}</p>
                          </div>
                      </div>
                      <div class="row mt30">
                          <div class="col-md-12">
                              <div class="box box-emarm">
                                  <div class="box-header with-border">
                                      <h3 class="box-title"><span>音频列表</span></h3>
                                      <span class="pull-right">共 ${task.totalSection} 集</span>
                                  </div>
                                  <div class="box-body">
                                      <ul id="audioTbl" class="list-group">
                                          
                                      </ul>
                                  </div> 
                              </div><!-- /.box -->
                          </div>
                      </div>
                  </div> 
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
    </div><!-- ./wrapper -->

    <footer class="main-footer detail-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 1.0.0
        </div>
        <strong style="margin-left: 230px;">Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">北京悦库时光文化传媒有限公司</a>.</strong> All rights reserved.
    </footer>

    <div id="auditModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">作品审核</h4>
          </div>
          <div class="modal-body">
              <p>待审核作品：<span id="auditProductName"></span></p>
              <form class="form-horizontal">
                  <div class="col-md-12">
                  <div class="form-group">
                    <label>审核意见</label>
                    <textarea id="auditText" class="form-control" multiple="multiple" data-placeholder="审核意见" style="width: 100%;"></textarea>
                  </div><!-- /.form-group -->
                  </div>
              </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeAuditModal();">关闭</button>
            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="rejectProduct('${product.id}');">不通过</button>
            <button type="button" class="btn btn-emarm" onclick="passProduct('${product.id}');">通过</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <!-- jQuery 2.1.4 -->
    <script src='<idp:url value="/plugins/jQuery/jQuery-2.1.4.min.js"/>'></script>
    <!-- Bootstrap 3.3.5 -->
    <script src='<idp:url value="/js/bootstrap.min.js"/>'></script>
    <!-- DataTables -->
    <script src='<idp:url value="/plugins/datatables/jquery.dataTables.min.js"/>'></script>
    <script src='<idp:url value="/plugins/datatables/dataTables.bootstrap.min.js"/>'></script>
    <!-- SlimScroll -->
    <script src='<idp:url value="/plugins/slimScroll/jquery.slimscroll.min.js"/>'></script>
    <!-- FastClick -->
    <script src='<idp:url value="/plugins/fastclick/fastclick.min.js"/>'></script>
    <!-- AdminLTE App -->
    <script src='<idp:url value="/js/app.min.js"/>'></script>
    <!-- AdminLTE for demo purposes -->
    <script src='<idp:url value="/js/demo.js"/>'></script>
    
    <script src='<idp:url value="/js/ideajs.js"/>'></script>
    <script src='<idp:url value="/js/template.js"/>'></script>
    
    <!-- page script -->
    <script>
      $(document).ready(function(){
          
      });
    </script>
  </body>
</html>