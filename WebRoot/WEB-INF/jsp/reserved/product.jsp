<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>悦库时光音频资源管理系统 | 评价管理</title>
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
            <h3>作品列表</h3>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <ul id="prodList" class="list-group">
                  
              </ul><!-- /.box -->
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
    
    <script id="prodListTmpl" type="text/html">
        {{each prodlist as prod index}}
            <li class="list-group-item">
              <div class="col-xs-2">
                  <img width="136" src='<idp:ctx/>{{prod.logoUrl}}'/>
              </div>
              <div class="col-xs-10">
                  <p class="col-xs-12">{{prod.name}}</p>
                  <p class="col-xs-5 detailInfo-light">作者：{{prod.author.name}}</p>
                  <p class="col-xs-7 detailInfo-light">作者笔名：{{prod.author.pseudonym}}</p>
                  <p class="col-xs-5 detailInfo-light">题材：{{prod.subject.id}}</p>
                  <p class="col-xs-7 detailInfo-light">字数：{{prod.wordCount}}&nbsp;万字</p>
                  <p class="col-xs-5 detailInfo-light">出版状态：{{prod.publishStateText}}</p>
                  <p class="col-xs-7 detailInfo-light">出版年份：{{prod.publishYear}}</p>
                  <p class="col-xs-5 detailInfo-light">ISBN：{{prod.isbn}}</p>
                  {{if prod.samples}}
                  <div class="col-xs-12 detailInfo-light">
                      <span>样章：</span><a href='<idp:url value=""/>{{prod.samples[0].fileUrl}}' class="label bg-gray">下载</a>
                  </div>
                  {{/if}}
              </div>
              <button class="btn btn-emarm pull-right" onclick="popReservedProduct('{{prod.id}}', '{{prod.name}}')">预定</button>
              <div class="clearfix"></div>
            </li>
        {{/each}}
    </script>
    
    <!-- page script -->
    <script>
      var table;
    
      $(document).ready(function(){
          $.get(
              '<idp:url value="/reserved/products"/>',
              {},
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var data = result.data;
                      var html = template('prodListTmpl', {prodlist: data});
                      $('#prodList').html(html);
                  } 
              }
          );
      });
      
      function clearReservedModal() {
          $('#productId').val('');
          $('#productName').text('');
          $('#desc').val('');
      }
      
      function closeReservedModal() {
          clearReservedModal();
          $('#reservedModal').modal('hide');
      }
      
      function popReservedProduct(id, name) {
          clearReservedModal();
          
          $('#productId').val(id);
          $('#productName').text(name);
          
          $('#reservedModal').modal('show');
      }
      
      function reservedProduct() {
          var id = $('#productId').val();
          var desc = $('#desc').val();
          $.post(
              '<idp:url value="/reserved/reservedProduct"/>',
              {
                  'id': id,
                  'desc': desc
              },
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      alert('预定成功');
                      window.location.reload();
                  }
              }
          );       
      }
      
    </script>
  </body>
</html>