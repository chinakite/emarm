<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数字音频版权云平台 | 我的任务</title>
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
              <span class="emarm_title_text">数字音频版权云平台</span>
              <!--
              <img style="margin-top: 4px;" src='<idp:url value="/img/logo.png"/>' height="40"/>
              -->
            </div>
          </div><!-- /.container-fluid -->
        </nav>
    </header>
    <div class="wrapper detailBody">
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper detailContent">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h3>作品列表</h3>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <table id="taskTbl" class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <th>作品名称</th>
                    <th>合同编号</th>
                    <th>单集时长</th>
                    <th>演播形式</th>
                    <th>制作周期</th>
                    <th>状态</th>
                    <th>操作</th>
                  </tr>
                </thead>
              </table>
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
        <strong style="margin-left: 230px;">Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">北京广播公司</a>.</strong> All rights reserved.
    </footer>
    
    <div id="reservedModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">作品预定</h4>
          </div>
          <div class="modal-body">
              <p>待预定作品：<span id="productName"></span></p>
              <form class="form-horizontal">
                  <input type="hidden" id="productId"/>
                  <div class="col-md-12">
                  <div class="form-group">
                    <label>留言</label>
                    <textarea id="desc" class="form-control" multiple="multiple" style="width: 100%;"></textarea>
                  </div><!-- /.form-group -->
                  </div>
              </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeReservedModal();">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="reservedProduct();">提交</button>
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
      var table;
    
      $(document).ready(function(){
          initTaskTbl();
      });
      
      function initTaskTbl() {
          table = $('#taskTbl').DataTable({
              "processing": true,
              "paging": true,
              "lengthChange": false,
              "searching": false,
              "ordering": false,
              "info": true,
              "autoWidth": false,
              "serverSide": true,
              language: {
                "paginate": {
                  "first":      "首页",
                  "previous":   "上一页",
                  "next":       "下一页",
                  "last":       "尾页"
                },
                "info": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项"
              },
              "ajax": {url: '<idp:url value="/make/extMyMakeTasks"/>'},
              "columns": [
                {},
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
                          alert(full.name);
                          if(full.name) {
                              return full.name;
                          }else{
                              return '';    
                          }
                      }
                  },
                  {
                      "targets": [1],
                      "render": function(data, type, full) {
                          if(full.contract) {
                              return full.contract.code;
                          }else{
                              return '未签订';
                          }
                      }
                  },
                  {
                      "targets": [2],
                      "render": function(data, type, full) {
                          return full.timePerSection + " 分钟";
                      }
                  },
                  {
                      "targets": [3],
                      "render": function(data, type, full) {
                          return full.showTypeText;
                      }
                  },
                  {
                      "targets": [4],
                      "render": function(data, type, full) {
                          return full.makeTime + ' 天';
                      }
                  },
                  {
                      "targets": [5],
                      "render": function(data, type, full) {
                          if(full.stateText)
                            return full.stateText;
                          else
                            return '';
                      }
                  },
                  {
                      "targets": [6],
                      "render": function(data, type, full) {
                          var role = '${sessionScope.__SESSION__USER__.role}';
                      
                          var html = '<a href=\'<idp:url value="/make/extTaskDetail"/>?id=' + full.id + '\' target="_blank">查看</a> ';
                          return html;
                      }
                  }
              ]
          });
      }
      
    </script>
  </body>
</html>