<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数字音频版权云平台 | 我的作品</title>
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
    
    <!-- Select2 -->
    <link rel="stylesheet" href='<idp:url value="/plugins/select2/select2.min.css"/>'>
    
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
    
    <!-- jQuery 2.1.4 -->
    <script src='<idp:url value="/plugins/jQuery/jQuery-2.1.4.min.js"/>'></script>
  
  </head>
  <body class="hold-transition skin-emarm sidebar-mini">
    <div class="wrapper">

      <%@ include file="../header.jsp"%>
      
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
          <!-- sidebar: style can be found in sidebar.less -->
          <section class="sidebar">
              <%@ include file="../userpanel.jsp"%> 
              
              <%@ include file="../quicksearch.jsp"%> 
              
              <%@ include file="../sidebar.jsp"%> 
          </section>    
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>我的待办
            <small>我的所有待办任务。</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href='<idp:url value="/home"/>'><i class="fa fa-home"></i> 首页</a></li>
            <li class="active">我的待办</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">任务列表</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <form class="form-horizontal">
                    <div class="col-sm-12">
                      <div class="col-sm-4">
                        <div class="form-group">
                          <label for="inputSearchTaskName" class="col-xs-3 control-label">任务名称</label>
                          <div class="col-xs-9">
                            <input type="text" class="form-control" id="inputSearchTaskName" placeholder="作品名称关键字">
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4">   
                        <div class="form-group">
                          <label for="inputSearchTargetType" class="col-xs-3 control-label">任务类别</label>
                          <div class="col-xs-9">
                            <select id="inputSearchTargetType" class="form-control">
                                <option value="-1">全部</option>
                                <option value="0">评价</option>
                                <option value="1">版权合同</option>
                                <option value="2">制作任务</option>
                                <option value="3">制作合同</option>
                                <option value="4">运营合同</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4">   
                        <button type="button" class="btn btn-emarm pull-center" onclick="searchMyProducts();"><i class="fa fa-search"></i>&nbsp;查询</button>
                        <button type="button" class="btn btn-default pull-center" style="margin-left: 20px;" onclick="resetSearch();"><i class="fa fa-rotate-left"></i>&nbsp;重置</button>
                      </div>
                    </div>  
                  </form>
                </div>    
                <div class="box-body">
                  <table id="taskTbl" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th></th>
                        <th>任务名称</th>
                        <th>任务类别</th>
                        <th>创建时间</th>
                        <th>操作</th>
                      </tr>
                    </thead>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
      <%@ include file="../footer.jsp"%>
    </div><!-- ./wrapper -->

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
    
    <!-- Select2 -->
    <script src='<idp:url value="/plugins/select2/select2.full.min.js"/>'></script>
    
    <script src='<idp:url value="/js/ideajs.js"/>'></script>
    <script src='<idp:url value="/js/template.js"/>'></script>
    
    <script src='<idp:url value="/plugins/fileupload/jquery.ui.widget.js"/>'></script>
    <script src='<idp:url value="/plugins/fileupload/jquery.fileupload.js"/>'></script>
    <script src='<idp:url value="/plugins/fileupload/jquery.iframe-transport.js"/>'></script>
    
    <!-- page script -->
    <script>
      var table;
    
      $(document).ready(function(){
          $('#menu_mytask').addClass('active');
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
              "ajax": {url: '<idp:url value="/task/dtMyTasks"/>',
                  "data": function(d) {
                      var taskName = $('#inputSearchTaskName').val();
                      if(taskName && $.trim(taskName).length > 0) {
                          d.taskName = taskName;
                      }
                      var targetType = $('#inputSearchTargetType').val();
                      if(targetType && $.trim(targetType).length > 0) {
                          d.targetType = targetType;
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
                "info": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "emptyTable": "没有符合条件的数据",
                "infoEmpty": ""  
              },
              "columns": [
                {width:'1px'},
                {},
                {},
                {},
                {}
              ],
              "columnDefs": [
                  {
                      "targets": [0],
                      "render": function(data, type, full) {
                          var state = full.state;
                          if(state == '0') {
                              return '<i class="fa fa-envelope text-orange"></i>';
                          }else if(state == '1' || state == '9') {
                              return '<i class="fa fa-envelope-o text-gray"></i>';
                          }
                          return '';
                      }
                  },
                  {
                      "targets": [1],
                      "render": function(data, type, full) {
                          return full.title;
                      }
                  },
                  {
                      "targets": [2],
                      "render": function(data, type, full) {
                          return full.targetTypeText;
                      }
                  },
                  {
                      "targets": [3],
                      "render": function(data, type, full) {
                          return full.createTime;
                      }
                  },
                  {
                      "targets": [4],
                      "render": function(data, type, full) {
                          var html = '<a href=\'<idp:url value="/task/toTarget"/>?id=' + full.id + '\' target="_blank">办理</a> ';
                          return html;
                      }
                  }
              ]
          });
      }
      
      function searchMyProducts() {
          table.ajax.reload();
      }
      
      function resetSearch() {
          $('#inputSearchTaskName').val('');
          $('#inputSearchTargetType')[0].selectedIndex = 0;
      }
    </script>
  </body>
</html>