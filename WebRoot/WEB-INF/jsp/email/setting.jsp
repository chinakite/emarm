<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数字音频版权云平台 | 修改密码</title>
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
          <h1>邮件服务器设置</h1>
          <ol class="breadcrumb">
            <li><a href='<idp:url value="/home"/>'><i class="fa fa-dashboard"></i> 首页</a></li>
            <li class="active">邮件服务器设置</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
                <form class="form-horizontal">
                  <div class="box-body">
                    <div class="form-group required">
                      <label for="inputHostName" class="col-sm-2 control-label">服务器地址</label>
                      <div class="col-sm-3">
                        <input type="text" class="form-control" id="inputHostName" placeholder="SMTP服务器地址" value="${email.hostName}">
                      </div>
                      <div id="hostNameErrorTip" class="col-sm-3 error-tip">
                        <span class="text-red">地址错误，请重新输入</span>
                      </div>
                    </div>
                    <div class="form-group required">
                      <label for="inputPort" class="col-sm-2 control-label">服务器端口</label>
                      <div class="col-sm-3">
                        <input type="text" class="form-control" id="inputPort" placeholder="SMTP服务器端口" value="${email.port}">
                      </div>
                      <div id="portErrorTip" class="col-sm-3 error-tip">
                        <span class="text-red">端口不正确，请重新输入</span>
                      </div>
                    </div>
                    <div class="form-group required">
                      <label for="inputFromEmail" class="col-sm-2 control-label">发件人邮箱</label>
                      <div class="col-sm-3">
                        <input type="text" class="form-control" id="inputFromEmail" placeholder="发件人邮箱" value="${email.fromEmail}">
                      </div>
                      <div id="fromEmailErrorTip" class="col-sm-3 error-tip">
                        <span class="text-red">邮箱不正确，请重新输入</span>
                      </div>
                    </div>
                    <div class="form-group required">
                      <label for="inputFromName" class="col-sm-2 control-label">发件人名称</label>
                      <div class="col-sm-3">
                        <input type="text" class="form-control" id="inputFromName" placeholder="显示用的发件人名称" value="${email.fromName}">
                      </div>
                      <div id="fromNameErrorTip" class="col-sm-3 error-tip">
                        <span class="text-red">邮箱不正确，请重新输入</span>
                      </div>
                    </div>
                    <div class="form-group required">
                      <label for="inputUserName" class="col-sm-2 control-label">用户名</label>
                      <div class="col-sm-3">
                        <input type="text" class="form-control" id="inputUserName" placeholder="登录邮件服务器的用户名" value="${email.userName}">
                      </div>
                      <div id="userNameErrorTip" class="col-sm-3 error-tip">
                        <span class="text-red">用户名不正确，请重新输入</span>
                      </div>
                    </div>
                    <div class="form-group required">
                      <label for="inputPassword" class="col-sm-2 control-label">密码</label>
                      <div class="col-sm-3">
                        <input type="password" class="form-control" id="inputPassword" placeholder="登录邮件服务器的密码" value="${email.password}">
                      </div>
                      <div id="passwordErrorTip" class="col-sm-3 error-tip">
                        <span class="text-red">用户名不正确，请重新输入</span>
                      </div>
                    </div>
                    <div class="form-group required">
                      <label for="inputSsl" class="col-sm-2 control-label">是否使用SSL</label>
                      <div class="col-sm-4">
                          <div class="col-sm-2 radio">
                              <label for="useSsl"><input id="useSsl" name="inputSsl" type="radio" value="1" <c:if test="${email.ssl == '1'}">checked</c:if>/>是</label>
                          </div>
                          <div class="col-sm-2 radio">
                              <label for="noSsl"><input id="noSsl" name="inputSsl" type="radio" value="0" <c:if test="${email.ssl == '0'}">checked</c:if>/>否</label>
                          </div>
                      </div>
                    </div>
                  </div><!-- /.box-body -->
                  <div class="col-sm-4" style="text-align: center;">
                    <button type="button" class="btn btn-default pull-center mr30" onclick="popTestModal();"><i class="fa fa-ok"></i>&nbsp;测试</button>
                    <button type="button" class="btn btn-emarm pull-center" onclick="saveSetting();"><i class="fa fa-ok"></i>&nbsp;保存</button>
                  </div>
                </form>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
      <%@ include file="../footer.jsp"%> 
      
    </div><!-- ./wrapper -->

    <div id="testModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">邮件服务器设置测试</h4>
          </div>
          <div class="modal-body">
              <form class="form-horizontal">
                  <div class="col-md-12">
                  <div class="form-group">
                    <label>收件人</label>
                    <input id="testEmail" class="form-control" type="text"/>
                  </div><!-- /.form-group -->
                  </div>
              </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeTestModal();">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="testSetting();">发送</button>
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
      $(function () {
        
      });
      
      $(document).ready(function(){
          $('#menu_system').addClass('active');
          $('#menu_email').addClass('active');
      });
      
      function popTestModal() {
          clearTestModal();
          $('#testModal').modal('show');
      }
      
      function closeTestModal() {
          clearTestModal();
          $('#testModal').modal('hide');
      }
      
      function clearTestModal() {
          $('#testEmail').val('');
      }
      
      function testSetting() {
          var hostName = $('#inputHostName').val();
          var port = $('#inputPort').val();
          var fromEmail = $('#inputFromEmail').val();
          var fromName = $('#inputFromName').val();
          var userName = $('#inputUserName').val();
          var password = $('#inputPassword').val();
          var ssl = $('input[name=inputSsl]:checked').val();
          var testEmail = $('#testEmail').val();
          $.post(
              '<idp:url value="/system/testSetting"/>',
              {
                  "hostName": hostName,
                  "port": port,
                  "fromEmail": fromEmail,
                  "fromName": fromName,
                  "userName": userName,
                  "password": password,
                  "ssl": ssl,
                  "testEmail": testEmail
              },
              function(json) {
                  var r = IDEA.parseJSON(json);
                  if(r.type == 'success') {
                      alert('发送成功，请查看邮件以确认.');
                  }else{
                      alert('发送失败，' + r.msg);
                  }
              }
          );
      }
      
      function saveSetting() {
          var hostName = $('#inputHostName').val();
          var port = $('#inputPort').val();
          var fromEmail = $('#inputFromEmail').val();
          var fromName = $('#inputFromName').val();
          var userName = $('#inputUserName').val();
          var password = $('#inputPassword').val();
          var ssl = $('input[name=inputSsl]:checked').val();
          $.post(
              '<idp:url value="/system/emailSetting"/>',
              {
                  "hostName": hostName,
                  "port": port,
                  "fromEmail": fromEmail,
                  "fromName": fromName,
                  "userName": userName,
                  "password": password,
                  "ssl": ssl
              },
              function(json) {
                  var r = IDEA.parseJSON(json);
                  if(r.type == 'success') {
                      alert('保存成功.');
                  }
              }
          );
      }
      
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