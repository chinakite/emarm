<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数字音频版权云平台 | 首页</title>
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
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href='<idp:url value="/css/skins/_all-skins.min.css"/>'>

    <link rel="stylesheet" href='<idp:url value="/css/emarm.css"/>'>
    <link rel="stylesheet" href='<idp:url value="/css/skins/skin-emarm.css"/>'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="hold-transition skin-emarm sidebar-mini">
    <div class="wrapper">

      <%@ include file="header.jsp"%> 
      
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
          <!-- sidebar: style can be found in sidebar.less -->
          <section class="sidebar">
              <%@ include file="userpanel.jsp"%> 
              
              <%@ include file="quicksearch.jsp"%> 
              
              <%@ include file="sidebar.jsp"%> 
          </section>    
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>首页
            <small>Version 1.0</small>
          </h1>
          <ol class="breadcrumb">
            <li><i class="fa fa-home"></i> Home</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <!-- Info boxes -->
          <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="ion ion-ios-paper-outline"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">本月新增作品</span>
                  <span class="info-box-number">90</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-book"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">本月新签版权</span>
                  <span class="info-box-number">41</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->

            <!-- fix for small devices only -->
            <div class="clearfix visible-sm-block"></div>

            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-green"><i class="ion ion-ios-color-wand"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">本月制作完成</span>
                  <span class="info-box-number">760</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="ion ion-ios-cart-outline"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">本月销售合同</span>
                  <span class="info-box-number">2,000</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
          </div><!-- /.row -->

          <div class="row">
            <div class="col-md-6">
                <div class="box box-emarm">
                    <div class="box-header with-border">
                        <h4 class="box-title"><span>最新作品</span></h4>
                        <a class="pull-right">更多&gt;&gt;</a>
                    </div>
                    <div class="box-body">
                        <ul id="lastProductList" class="list-group list-group-unbordered">
                            
                        </ul>
                    </div>  
                </div><!-- /.box -->
            </div><!-- /.col -->
            <div class="col-md-6">
                <div class="box box-emarm">
                    <div class="box-header with-border">
                      <h4 class="box-title"><span>我的待办</span></h4>
                      <a class="pull-right">更多&gt;&gt;</a>
                    </div>
                    <div class="box-body">
                        <ul id="taskList" class="list-group list-group-unbordered">
                            
                        </ul>
                    </div>  
                </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <%@ include file="footer.jsp"%> 
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.4 -->
    <script src='<idp:url value="/plugins/jQuery/jQuery-2.1.4.min.js"/>'></script>
    <!-- Bootstrap 3.3.5 -->
    <script src='<idp:url value="/js/bootstrap.min.js"/>'></script>
    <!-- FastClick -->
    <script src='<idp:url value="/plugins/fastclick/fastclick.min.js"/>'></script>
    <!-- AdminLTE App -->
    <script src='<idp:url value="/js/app.min.js"/>'></script>
    <!-- Sparkline -->
    <script src='<idp:url value="/plugins/sparkline/jquery.sparkline.min.js"/>'></script>
    <!-- jvectormap -->
    <script src='<idp:url value="/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"/>'></script>
    <script src='<idp:url value="/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"/>'></script>
    <!-- SlimScroll 1.3.0 -->
    <script src='<idp:url value="/plugins/slimScroll/jquery.slimscroll.min.js"/>'></script>
    <!-- ChartJS 1.0.1 -->
    <script src='<idp:url value="/plugins/chartjs/Chart.min.js"/>'></script>
    
    <script src='<idp:url value="/js/ideajs.js"/>'></script>
    <script src='<idp:url value="/js/template.js"/>'></script>
    
    <script id="lastProductTmpl" type="text/html">
        {{each prodlist as prod index}}
            <li class="list-group-item">
                <a>{{prod.name}}</a>
            </li>
        {{/each}}
    </script>
    
    <script id="taskTmpl" type="text/html">
        {{each tasklist as task index}}
            <li class="list-group-item">
                {{if task.targetType == '0'}}
                <a href="<idp:ctx/>/evaluation/productDetail?id={{task.targetid}}" target="_blank">{{task.title}}</a>
                {{/if}}
                {{if task.targetType == '1'}}
                <a href="<idp:ctx/>/copyright/contractDetail?id={{task.targetid}}" target="_blank">{{task.title}}</a>
                {{/if}}
            </li>
        {{/each}}
    </script>
    
    <script type="text/javascript">
        $(document).ready(function(){
            $('#menu_home').addClass('active');
            
            loadLastProducts();
            loadMyTasks();
        });
        
        function loadLastProducts() {
            $.get(
                '<idp:url value="/product/lastProducts"/>',
                {},
                function(json) {
                    var result = IDEA.parseJSON(json);
                    if(result.type == 'success') {
                        var prodlist = result.data;
                        
                        if(prodlist.length > 0) { 
                            var prodTblHtml = template('lastProductTmpl', {'prodlist': prodlist});
                            $('#lastProductList').html(prodTblHtml); 
                        }else{
                            $('#lastProductList').html('<li style="list-style:none; height:206px; text-align: center;">目前没有作品。</li>');
                        }
                    }
                }
            );
        }
        
        function loadMyTasks() {
            $.get(
                '<idp:url value="/task/myTasksDashboard"/>',
                {},
                function(json) {
                    var result = IDEA.parseJSON(json);
                    if(result.type == 'success') {
                        var tasklist = result.data;
                        
                        if(tasklist.length > 0) { 
                            var taskListHtml = template('taskTmpl', {'tasklist': tasklist});
                            $('#taskList').html(taskListHtml); 
                        }else{
                            $('#taskList').html('<li style="list-style:none; height:206px; text-align: center;">目前没有待办事项。</li>');
                        }
                    }
                }
            );
        }
    </script>
  </body>
</html>