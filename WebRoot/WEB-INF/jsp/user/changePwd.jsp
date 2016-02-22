<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>悦库时光音频资源管理系统 | 修改密码</title>
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
    
    <link rel="stylesheet" href='<idp:url value="/css/skins/skin-emarm.css"/>'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>
        .error-tip {
            line-height: 34px;
            display: none;
        }
    </style>
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
          <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>修改密码</h1>
          <ol class="breadcrumb">
            <li><a href='<idp:url value="/home"/>'><i class="fa fa-dashboard"></i> 首页</a></li>
            <li class="active">修改密码</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
                <form class="form-horizontal">
                  <div class="box-body">
                    <div class="form-group">
                      <label for="inputOldPwd" class="col-sm-1 control-label">原密码</label>
                      <div class="col-sm-3">
                        <input type="password" class="form-control" id="inputOldPwd" placeholder="原密码">
                      </div>
                      <div id="oldPwdErrorTip" class="col-sm-3 error-tip">
                        <span class="text-red">原密码错误，请重新输入</span>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputNewPwd" class="col-sm-1 control-label">新密码</label>
                      <div class="col-sm-3">
                        <input type="password" class="form-control" id="inputNewPwd" placeholder="新密码">
                      </div>
                      <div id="newPwdErrorTip" class="col-sm-3 error-tip">
                        <span class="text-red">密码格式不正确，请重新输入</span>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputConfirmPwd" class="col-sm-1 control-label">确认密码</label>
                      <div class="col-sm-3">
                        <input type="password" class="form-control" id="inputConfirmPwd" placeholder="重复输入新密码">
                      </div>
                      <div id="confirmPwdErrorTip" class="col-sm-3 error-tip">
                        <span class="text-red">确认密码与新密码不一致</span>
                      </div>
                    </div>
                  </div><!-- /.box-body -->
                  <div class="col-sm-4" style="text-align: center;">
                    <button type="button" class="btn btn-emarm pull-center" onclick="changePwd();"><i class="fa fa-ok"></i>&nbsp;保存</button>
                  </div>
                </form>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
      <%@ include file="../footer.jsp"%> 
      
    </div><!-- ./wrapper -->

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
      $(function () {
        
      });
      
      $(document).ready(function(){
          
      });
      
      function changePwd() {
          var r = validateOldPwd();
          if(!r) {
              return;
          }
          r = validateNewPwd();
          if(!r) {
              return;
          }
          
          r = validateConfirmPwd();
          if(!r) {
              return;
          }
      
          $.post(
              '<idp:url value="/user/changePwd"/>',
              {
                  oldPwd: $('#inputOldPwd').val(),
                  newPwd: $('#inputNewPwd').val()
              },
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var d = result.data;
                      if(d == 'wrong_oldpwd') {
                          $('#oldPwdErrorTip span').text('原密码错误，请重新输入');
                          $('#oldPwdErrorTip').show();
                      }else{
                          alert('密码修改成功');
                          clearForm();
                      }
                  }
              }
          );
      }
      
      function clearForm() {
          $('#inputOldPwd').val('');
          $('#oldPwdErrorTip').hide();
          $('#inputNewPwd').val('');
          $('#newPwdErrorTip').hide();
          $('#inputConfirmPwd').val('');
          $('#confirmPwdErrorTip').hide();
      }
      
      //------------------- validation ----------------
      function validateOldPwd() {
          var oldPwd = $('#inputOldPwd').val();
          if(!oldPwd || $.trim(oldPwd).length == 0) {
              $('#oldPwdErrorTip span').text('原密码不能为空');
              $('#oldPwdErrorTip').show();
              return false;
          }
          return true;
      }
      
      function validateNewPwd() {
          var newPwd = $('#inputNewPwd').val();
          if(!newPwd || $.trim(newPwd).length == 0) {
              $('#newPwdErrorTip span').text('新密码不能为空');
              $('#newPwdErrorTip').show();
              return false;
          }else if($.trim(newPwd).length < 6) {
              $('#newPwdErrorTip span').text('新密码不能少于6位');
              $('#newPwdErrorTip').show();
              return false;
          }
          return true;
      }
      
      function validateConfirmPwd() {
          var newPwd = $('#inputNewPwd').val();
          var confirmPwd = $('#inputConfirmPwd').val();
          if(!newPwd || !confirmPwd || newPwd != confirmPwd) {
              $('#confirmPwdErrorTip').show();
              return false;
          }
          return true;
      }
      
    </script>
  </body>
</html>