<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数字音频版权云平台 | 登录</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href='<idp:url value="/css/bootstrap.min.css"/>'>
    <!-- Font Awesome -->
    <link rel="stylesheet" href='<idp:url value="/css/font-awesome.min.css"/>'>
    <!-- Ionicons -->
    <link rel="stylesheet" href='<idp:url value="/css/ionicons.min.css"/>'>
    <!-- Theme style -->
    <link rel="stylesheet" href='<idp:url value="/css/AdminLTE.min.css"/>'>
    <!-- iCheck -->
    <link rel="stylesheet" href='<idp:url value="/plugins/iCheck/square/blue.css"/>'>
    
    <link rel="stylesheet" href='<idp:url value="/css/skins/skin-emarm.css"/>'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>
        .login-bg {
            background: url('img/login_bg1.jpg');
        }
        
        .login-box-msg {
            font-family: 'Microsoft YaHei';
            font-size: 22px;
        }
    </style>
  </head>
  <body class="hold-transition login-page login-bg">
    <div class="login-box">
      <!--<div class="login-logo">
        <a href="#"><img src="img/logo.png" height="60"/></a>
      </div> /.login-logo -->
      <div class="login-box-body">
        <p class="text-center"><img src="img/rbc_logo.png" height="60"/></p>
        <p class="login-box-msg">数字音频版权云平台</p>
        <form action='<idp:url value="/userlogin"/>' method="post" onsubmit="return false;">
          <div class="form-group has-feedback">
            <input type="text" name="userName" id="userName" class="form-control small" placeholder="用户名">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" name="password" id="password" class="form-control small" placeholder="密码">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
              <div class="checkbox icheck">
                <label class="small">
                  <input type="checkbox" name="rememberMe" id="rememberMe"> 记住我
                </label>
              </div>
            </div><!-- /.col -->
            <div class="col-xs-4">
              <button type="button" onclick="login();" class="btn btn-emarm btn-block btn-flat">登录</button>
            </div><!-- /.col -->
          </div>
        </form>
        <!--
        <a class="small" href="#">忘记密码？</a>-->

      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

    <!-- jQuery 2.1.4 -->
    <script src='<idp:url value="/plugins/jQuery/jQuery-2.1.4.min.js"/>'></script>
    <!-- Bootstrap 3.3.5 -->
    <script src='<idp:url value="/js/bootstrap.min.js"/>'></script>
    <!-- iCheck -->
    <script src='<idp:url value="/plugins/iCheck/icheck.min.js"/>'></script>
    
    <script src='<idp:url value="/js/ideajs.js"/>'></script>
    
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
      
      function login() {
          var userName = $('#userName').val();
          var password = $('#password').val();
          
          var rememberMe = $('#rememberMe').prop('checked');
          
          if(!userName || $.trim(userName).length == 0) {
              alert('用户名不能为空');
              return ;
          }
          
          if(!password || $.trim(password).length == 0) {
              alert('密码不能为空');
              return ;
          }
          
          $.post(
              '<idp:url value="/userlogin"/>',
              {
                  "userName": userName,
                  "password": password,
                  "rememberMe": rememberMe
              },
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      window.location.href = "<idp:url value="/home"/>";
                  }else if(result.type == 'exception') {
                      if(result.code == 'LOGIN-00001') {
                          alert("您使用的用户不存在");
                      }else if(result.code == 'LOGIN-00002') {
                          alert("您的密码错误");
                      }else if(result.code == 'LOGIN-00003') {
                          alert("您没有权限登录本系统");
                      }else{
                          alert("发生了未知异常!");
                      }
                  }
              }
          );
      }
    </script>
  </body>
</html>