<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数字音频版权云平台 | 个人中心</title>
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
            <div class="navbar-header" style="width:900px;">
              <span class="emarm_title_text">数字音频版权云平台</span>
              <!--
              <img style="margin-top: 4px;" src='<idp:url value="/img/logo.png"/>' height="40"/>
              -->
              <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                  <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <img src="/emarm/img/user2-160x160.jpg" class="user-image" alt="User Image">
                      <span class="hidden-xs">外部专家</span>
                    </a>
                  </li>
                  <!-- Control Sidebar Toggle Button -->
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-gears"></i></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href='<idp:url value="/ext/evaluation/productPage"/>'><i class="fa fa-user"></i>个人中心</a>
                        </li>
                        <li>
                            <a href='<idp:url value="/user/toChangePwd"/>'><i class="fa fa-cog"></i>修改密码</a>
                        </li>
                        <li>
                            <a href='<idp:url value="/evalogout"/>'><i class="fa fa-power-off"></i>退出</a>
                        </li>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
          </div><!-- /.container-fluid -->
        </nav>
    </header>
    <div class="wrapper detailBody">
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper detailContent">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1 class="detailTitle">个人中心</h1>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="box box-widget">
              <div class="box-body">
                <form class="form-horizontal">
                    <div class="col-sm-12">
                      <div class="col-sm-4">
                        <div class="form-group">
                          <label for="inputSearchProductName" class="col-xs-4 control-label">作品名称</label>
                          <div class="col-xs-8">
                            <input type="text" class="form-control" id="inputSearchProductName" placeholder="作品名称关键字">
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4">
                        <div class="form-group">
                          <label for="inputSearchAuthorName" class="col-xs-4 control-label">作者姓名</label>
                          <div class="col-xs-8">
                            <input type="text" class="form-control" id="inputSearchAuthorName" placeholder="作者姓名">
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4">  
                        <div class="form-group">
                          <label for="inputSearchEvaluationState" class="col-xs-4 control-label">评价状态</label>
                          <div class="col-xs-8">
                            <select id="inputSearchEvaluationState" class="form-control">
                                <option value="-1">全部</option>
                                <option value="0">已评价</option>
                                <option value="1">未评价</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>  
                    <div style="text-align: center;">
                          <button type="button" class="btn btn-emarm pull-center" onclick="searchProducts();"><i class="fa fa-search"></i>&nbsp;查询</button>
                          <button type="button" class="btn btn-default pull-center" style="margin-left: 20px;" onclick="resetSearch();"><i class="fa fa-rotate-left"></i>&nbsp;重置</button>
                    </div>
                </form>
                
                <table id="productTbl" class="table table-bordered table-hover mt30">
                    <thead>
                      <tr>
                        <th>名称</th>
                        <th>作者</th>
                        <th>题材</th>
                        <th>状态</th>
                        <th>操作</th>
                      </tr>
                    </thead>
                </table>          
              </div>
            </div><!-- /.box -->
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
        <strong style="margin-left: 230px;">Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">北京广播公司</a>.</strong> All rights reserved.
    </footer>
    
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
      var table;
    
      $(document).ready(function(){
          initProductTbl();
      });
      
      function initProductTbl() {
          table = $('#productTbl').DataTable({
              "processing": true,
              "paging": true,
              "lengthChange": false,
              "searching": false,
              "ordering": false,
              "info": true,
              "autoWidth": false,
              "serverSide": true,
              "ajax": {url: '<idp:url value="/ext/evaluation/dtProducts"/>',
                  "data": function(d) {
                      var productName = $('#inputSearchProductName').val();
                      if(productName && $.trim(productName).length > 0) {
                          d.productName = productName;
                      }
                      var authorName = $('#inputSearchAuthorName').val();
                      if(authorName && $.trim(authorName).length > 0) {
                          d.authorName = authorName;
                      }
                      var evaluationState = $('#inputSearchEvaluationState').val();
                      if(evaluationState && $.trim(evaluationState).length > 0) {
                          d.evaluationState = evaluationState;
                      }
                  }
              },
              language: {
                "paginate": {
                  "first":      "首页",
                  "previous":   "上一页",
                  "next":       "下一页",
                  "last":       "尾页"
                },
                "info": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项"
              },
              "columns": [
                {},
                {},
                {},
                {},
                {}
              ],
              "columnDefs": [
                  {
                      "targets": [0],
                      "render": function(data, type, full) {
                          return full.name;
                      }
                  },
                  {
                      "targets": [1],
                      "render": function(data, type, full) {
                          if(full.author) {
                              return full.author.name;
                          }else{
                              return '';
                          }
                      }
                  },
                  {
                      "targets": [2],
                      "render": function(data, type, full) {
                          if(full.subject)
                              return full.subject.name;
                          else
                              return '';
                      }
                  },
                  {
                      "targets": [3],
                      "render": function(data, type, full) {
                          if(full.evaInvitation) {
                              return full.evaInvitation.evaluationStateText;
                          }else{
                              return '';
                          }
                      }
                  },
                  {
                      "targets": [4],
                      "render": function(data, type, full) {
                          if(full.evaInvitation) {
                              if(full.evaInvitation.evaluationState == '1') {
                                  return '<a href="<idp:ctx/>/ext/evaluation/evaluationDetail?id=' + full.id + '" target="_blank">查看</a>';
                              }else{
                                  return '<a href="<idp:ctx/>/ext/evaluation/toDoEvaluation?productId=' + full.id + '" target="_blank">评价</a>';
                              }
                          }else{
                              return '';
                          }
                      }
                  }
              ]
          });
      }
      
      function searchProducts() {
          table.ajax.reload();
      }
      
      function resetSearch() {
          $('#inputSearchProductName').val('');
          $('#inputSearchAuthorName').val('');
          $('#inputSearchIsbn').val('');
          $('#inputSearchSubject')[0].selectedIndex = 0;
          $('#inputSearchPublishState')[0].selectedIndex = 0;
          $('#inputSearchState')[0].selectedIndex = 0;
      }
    </script>
  </body>
</html>