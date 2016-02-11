<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>悦库时光音频资源管理系统 | 用户管理</title>
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
          <h1>
            用户管理
            <small>全部用户，包括内部用户、外部用户</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href='<idp:url value="/home"/>'><i class="fa fa-dashboard"></i> 首页</a></li>
            <li class="active">用户管理</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">用户列表</h3>
                </div><!-- /.box-header -->
                <div>
                    <form class="form-horizontal">
                      <div class="box-body">
                        <div class="form-group">
                          <label for="inputSearchKey" class="col-sm-1 control-label">关键字</label>
                          <div class="col-sm-3">
                            <input type="text" class="form-control" id="inputSearchKey" placeholder="用户名/姓名/邮箱/手机">
                          </div>
                          <label for="inputSearchRole" class="col-sm-1 control-label">角色</label>
                          <div class="col-sm-3">
                            <select class="form-control" id="inputSearchRole">
                              <option value="-1">全部</option>
                              <option value="03">评价管理员</option>
                              <option value="51">外部评价人</option>
                              <option value="99">超级管理员</option>
                            </select>
                          </div>
                          <label for="inputSearchState" class="col-sm-1 control-label">状态</label>
                          <div class="col-sm-3">
                            <select class="form-control" id="inputSearchState">
                              <option value="-1">全部</option>
                              <option value="1">已启用</option>
                              <option value="0">已禁用</option>
                            </select>
                          </div>
                        </div>
                      </div><!-- /.box-body -->
                      <div style="text-align: center;">
                        <button type="button" class="btn btn-emarm pull-center" onclick="searchUser();"><i class="fa fa-search"></i>&nbsp;查询</button>
                        <button type="button" class="btn btn-default pull-center" style="margin-left: 20px;" onclick="resetSearch();"><i class="fa fa-rotate-left"></i>&nbsp;重置</button>
                      </div>
                    </form>
                </div>
                <div class="tblToolbar">
                    <button class="btn btn-default" data-toggle="modal" data-target="#userModal"><i class="fa fa-plus"></i>&nbsp;新建</button>
                    <button class="btn btn-default ml10" onclick="batchDeleteUsers();"><i class="fa fa-remove"></i>&nbsp;删除</button>
                </div>
                <div class="box-body">
                  <table id="userTbl" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th width="1" style="padding-right:8px;">&nbsp;</th>
                        <th width="1" style="padding-right:8px;"><input type="checkbox" onclick="checkAll(this);"/></th>
                        <th width="1" style="padding-right:8px;">&nbsp;</th>
                        <th>用户名</th>
                        <th>姓名</th>
                        <th>邮箱</th>
                        <th>电话</th>
                        <th>敬称</th>
                        <th>角色</th>
                        <th>操作</th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
      <%@ include file="../footer.jsp"%> 
      
    </div><!-- ./wrapper -->

    <div id="userModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">新建用户</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal">
                <input id="inputId" type="hidden"/>
                <div class="form-group">
                  <label for="inputAccount" class="col-sm-2 control-label"><span class="text-danger">* </span>账号</label>
                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputAccount" placeholder="账号" onblur="validateAccount();">
                      <div class="feedback-tip">
                        <label class="control-label" for="inputAccount"><i class="fa fa-times-circle-o"></i> <span>输入错误</span></label>
                      </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputName" class="col-sm-2 control-label"><span class="text-danger">* </span>姓名</label>
                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder="姓名" onblur="validateName();">
                      <div class="feedback-tip">
                        <label class="control-label" for="inputName"><i class="fa fa-times-circle-o"></i> <span>输入错误</span></label>
                      </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail" class="col-sm-2 control-label"><span class="text-danger">* </span>邮箱</label>
                  <div class="col-sm-10">
                      <input type="email" class="form-control" id="inputEmail" placeholder="邮箱" onblur="validateEmail();">
                      <div class="feedback-tip">
                        <label class="control-label" for="inputEmail"><i class="fa fa-times-circle-o"></i> <span>输入错误</span></label>
                      </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputMobile" class="col-sm-2 control-label">手机</label>
                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputMobile" placeholder="手机" onblur="validateMobile();">
                      <div class="feedback-tip">
                        <label class="control-label" for="inputMobile"><i class="fa fa-times-circle-o"></i> <span>输入错误</span></label>
                      </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputHonorific" class="col-sm-2 control-label">敬称</label>
                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputHonorific" placeholder="敬称">
                      <div class="feedback-tip">
                        <label class="control-label" for="inputHonorific"><i class="fa fa-times-circle-o"></i> <span>输入错误</span></label>
                      </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label">角色</label>
                  <div class="col-sm-10">
                      <div class="col-sm-4 checkbox">
                          <label for="normalRole"><input id="normalRole" name="role" type="checkbox" value="01" disabled checked/>普通用户</label>
                      </div>
                      <div class="col-sm-4 checkbox">
                          <label for="superRole"><input id="superRole" name="role" type="checkbox" value="99"/>超级管理员</label>
                      </div>
                      <div class="col-sm-4 checkbox">
                          <label for="evaluateRole"><input id="evaluateRole" name="role" type="checkbox" value="03"/>评价管理员</label>
                      </div>
                      <div class="col-sm-4 checkbox">
                          <label for="outEvaRole"><input id="outEvaRole" name="role" type="checkbox" value="51"/>外部评价人员</label>
                      </div>
                      <div class="col-sm-4 checkbox">
                          <label for="copyrightOprRole"><input id="copyrightOprRole" name="role" type="checkbox" value="11"/>版权专员</label>
                      </div>
                      <div class="col-sm-4 checkbox">
                          <label for="copyrightDirectorRole"><input id="copyrightDirectorRole" name="role" type="checkbox" value="12"/>版权主管</label>
                      </div>
                      <div class="col-sm-4 checkbox">
                          <label for="copyrightManagerRole"><input id="copyrightManagerRole" name="role" type="checkbox" value="13"/>版权经理</label>
                      </div>
                      <div class="col-sm-4 checkbox">
                          <label for="ceoRole"><input id="ceoRole" name="role" type="checkbox" value="90"/>总经理</label>
                      </div>
                      <div class="col-sm-4 checkbox">
                          <label for="lawyerRole"><input id="lawyerRole" name="role" type="checkbox" value="80"/>法务人员</label>
                      </div>
                  </div>
                </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearUserModal();">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="submitUser();">保存</button>
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
    
    <!-- template -->
    <script id="userTmpl" type="text/html">
        {{each userlist as user idx}}
          <tr>
            <td><i class="fa {{if user.status == 1}}fa-circle text-green{{else}}fa-circle text-red{{/if}}"></i></td>
            <td><input class="tblRowCheckbox" value="{{user.id}}" type="checkbox"/></td>
            <td><img src='<idp:ctx/>{{user.logoUrl}}' width="20"/></td>
            <td>{{user.account}}</td>
            <td>{{user.name}}</td>
            <td>{{user.email}}</td>
            <td>{{user.mobile}}</td>
            <td>{{user.honorific}}</td>
            <td>{{user.roleText}}</td>
            <td><a onclick="popEditUser('{{user.id}}');">编辑</a> <span class="small">|</span> {{if user.status == 1}}<a onclick="disableUser('{{user.id}}');">禁用</a>{{else}}<a onclick="enableUser('{{user.id}}');">启用</a>{{/if}} <span class="small">|</span> <a onclick="deleteUser('{{user.id}}', '{{user.name}}')">删除</a></td>
          </tr>
        {{/each}}
    </script>
    
    <!-- page script -->
    <script>
      $(function () {
        $('#subjectTbl').DataTable({
          "paging": false,
          "lengthChange": false,
          "searching": false,
          "ordering": false,
          "info": false,
          "autoWidth": false
        });
      });
      
      $(document).ready(function(){
          $('#menu_system').addClass('active');
          $('#menu_user').addClass('active');
          loadUsers();
      });
      
      function loadUsers() {
          $.get(
              '<idp:url value="/system/users"/>',
              {},
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var users = result.data;
                      var html = template('userTmpl', {"userlist" : users});
                      $('#userTbl tbody').empty().append(html);
                  }
              }
          );
      }
      
      function submitUser() {
          if(!validateName() 
                  || !validateAccount()
                  || !validateEmail()) {
              return ;
          }else{
              var userAccount = $('#inputAccount').val();
              var userName = $('#inputName').val();
              var userEmail = $('#inputEmail').val();
              
              var userId = $('#inputId').val();
              
              var rolesChecked = $('input[name=role]:checked');
              var roles = '';
              for(var i=0; i<rolesChecked.length; i++) {
                  if(i > 0) {
                      roles += ',';
                  }
                  roles += $(rolesChecked[i]).val();
              }
              
              if(userId && $.trim(userId).length > 0) {     //编辑
                  $.post(
                      '<idp:url value="/system/user/"/>'+userId,
                      {
                          'account': userAccount,
                          'name': userName,
                          'email': userEmail,
                          'mobile': $('#inputMobile').val(),
                          'honorific': $('#inputHonorific').val(),
                          'role': roles
                      },
                      function(json) {
                          var result = IDEA.parseJSON(json);
                          if(result.type == 'success') {
                              alert('更新成功');
                              clearUserModal();
                              $('#userModal').modal('hide');
                              loadUsers();
                          }
                      }
                  );       
              }else{                //新增
                  $.post(
                      '<idp:url value="/system/user"/>',
                      {
                          'account': userAccount,
                          'name': userName,
                          'email': userEmail,
                          'mobile': $('#inputMobile').val(),
                          'honorific': $('#inputHonorific').val(),
                          'role': roles
                      },
                      function(json) {
                          var result = IDEA.parseJSON(json);
                          if(result.type == 'success') {
                              alert('保存成功');
                              clearUserModal();
                              $('#userModal').modal('hide');
                              loadUsers();
                          }
                      }
                  );       
              }
          }
      }
      
      function clearUserModal() {
          $('#inputId').val('');
          $('#inputAccount').val('');
          $('#inputName').val('');
          $('#inputEmail').val('');
          $('#inputMobile').val('');
          $('#inputHonorific').val('');
          $('input[name=role]').each(function(){
              var o = $(this);
              if(o.val() != '01') {
                  o.prop('checked', false);
              }
          });
      }
      
      function popEditUser(id) {
          $.get(
              '<idp:url value="/system/user/"/>' + id,
              {},
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var user = result.data;
                      $('#inputId').val(id);
                      $('#inputAccount').val(user.account);
                      $('#inputName').val(user.name);
                      $('#inputEmail').val(user.email);
                      $('#inputMobile').val(user.mobile);
                      $('#inputHonorific').val(user.honorific);
                      
                      $('input[name=role]').each(function(){
                          var o = $(this);
                          var rolestr = user.role;
                          if(rolestr.indexOf(o.val()) >= 0) {
                              o.prop('checked', true);
                          }
                      });
                      
                      $('#userModal').modal('show');
                  }
              }
          );
      }
      
      function deleteUser(id, name) {
          var r = confirm("您真的要删除用户[" + name + "]吗？");
          if(r) {
              $.post(
                  '<idp:url value="/system/user/"/>' + id,
                  {'_method': "delete"},
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('删除成功');
                          loadUsers();
                      }
                  }
              );
          }
      }
      
      function checkAll(obj) {
          var ele = $(obj);
          $('.tblRowCheckbox').each(function(){
              $(this).prop('checked', obj.checked);
          });
      }
      
      function batchDeleteUsers() {
          var ids = [];
          $('.tblRowCheckbox:checked').each(function(){
              ids.push($(this).val());
          });
          
          if(ids.length == 0) {
              alert('您没有选择任何记录。');
              return ;
          }
      
          var r = confirm("您真的要删除这些用户吗？");
          if(r) {
              $.post(
                  '<idp:url value="/system/batchDeleteUser"/>',
                  {
                      '_method': "delete",
                      'ids': ids.join(',')
                  },
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('删除成功');
                          loadUsers();
                      }
                  }
              );
          }
      }
      
      function disableUser(id) {
          $.post(
              '<idp:url value="/system/disableUser"/>',
              {
                  'id': id
              },
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      alert('禁用成功');
                      loadUsers();
                  }
              }
          );
      }
      
      function enableUser(id) {
          $.post(
              '<idp:url value="/system/enableUser"/>',
              {
                  'id': id
              },
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      alert('启用成功');
                      loadUsers();
                  }
              }
          );
      }
      
      
      //------------------- validation ----------------
      function validateName() {
          var inputNameEle = $('#inputName');
          var sbjName = inputNameEle.val();
          if(!sbjName || $.trim(sbjName).length == 0) {
              var formGroup = inputNameEle.parents('.form-group');
              if(!formGroup.hasClass('has-error')) {
                  inputNameEle.parents('.form-group').addClass('has-error');
                  inputNameEle.next('.feedback-tip').find('span').text('作品题材名称不能为空');
                  inputNameEle.next('.feedback-tip').show();
              }
              return false;
          }else{
              inputNameEle.parents('.form-group').removeClass('has-error');
              inputNameEle.next('.feedback-tip').find('span').text('');
              inputNameEle.next('.feedback-tip').hide();
              return true;
          }
      }
      
      function validateAccount() {
          var inputAccountEle = $('#inputAccount');
          var userAccount = inputAccountEle.val();
          if(!userAccount || $.trim(userAccount).length == 0) {
              var formGroup = inputAccountEle.parents('.form-group');
              if(!formGroup.hasClass('has-error')) {
                  inputAccountEle.parents('.form-group').addClass('has-error');
                  inputAccountEle.next('.feedback-tip').find('span').text('用户账号不能为空');
                  inputAccountEle.next('.feedback-tip').show();
              }
              return false;
          }else{
              inputAccountEle.parents('.form-group').removeClass('has-error');
              inputAccountEle.next('.feedback-tip').find('span').text('');
              inputAccountEle.next('.feedback-tip').hide();
              return true;
          }
      }
      
      function validateEmail() {
          var inputEmailEle = $('#inputEmail');
          var userEmail = inputEmailEle.val();
          if(!userEmail || $.trim(userEmail).length == 0) {
              var formGroup = inputEmailEle.parents('.form-group');
              if(!formGroup.hasClass('has-error')) {
                  inputEmailEle.parents('.form-group').addClass('has-error');
                  inputEmailEle.next('.feedback-tip').find('span').text('用户邮箱不能为空');
                  inputEmailEle.next('.feedback-tip').show();
              }
              return false;
          }else{
              inputEmailEle.parents('.form-group').removeClass('has-error');
              inputEmailEle.next('.feedback-tip').find('span').text('');
              inputEmailEle.next('.feedback-tip').hide();
              return true;
          }
      }
      
      function validateMobile() {
          var inputMobileEle = $('#inputMobile');
          var userMobile = inputMobileEle.val();
          if(userMobile) {
              var mobileReg = /^(((13|15|17|18)[0-9]{1})+\d{8})$/;
              if(!mobileReg.test(userMobile)){
                  var formGroup = inputMobileEle.parents('.form-group');
                  if(!formGroup.hasClass('has-error')) {
                      inputMobileEle.parents('.form-group').addClass('has-error');
                      inputMobileEle.next('.feedback-tip').find('span').text('手机号格式不正确');
                      inputMobileEle.next('.feedback-tip').show();
                  }
                  return false;
              }
          }
          inputMobileEle.parents('.form-group').removeClass('has-error');
          inputMobileEle.next('.feedback-tip').find('span').text('');
          inputMobileEle.next('.feedback-tip').hide();
          return true;
      }
      
      function searchUser() {
          var searchKey = $('#inputSearchKey').val();
          var searchRole = $('#inputSearchRole').val();
          var searchState = $('#inputSearchState').val();
          
          var param = {};
          if(searchKey && $.trim(searchKey).length > 0) {
              param.key = searchKey;
          }
          if(searchRole != '-1') {
              param.role = searchRole;
          }
          if(searchState != '-1') {
              param.status = searchState;
          }
          
          $.get(
              '<idp:url value="/system/users"/>',
              param,
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var users = result.data;
                      var html = template('userTmpl', {"userlist" : users});
                      $('#userTbl tbody').empty().append(html);
                  }
              }
         );
      }
      
      function resetSearch() {
          $('#inputSearchKey').val('');
          $('#inputSearchRole')[0].selectedIndex = 0;
          $('#inputSearchState')[0].selectedIndex = 0;
      }
    </script>
  </body>
</html>