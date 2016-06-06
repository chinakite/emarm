<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数字音频版权云平台 | 作品题材管理</title>
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
          <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            作品题材管理
            <small>作品题材主要指“玄幻”、“都市言情”等</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href='<idp:url value="/home"/>'><i class="fa fa-dashboard"></i> 首页</a></li>
            <li class="active">作品题材管理</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">作品题材列表</h3>
                </div><!-- /.box-header -->
                <div>
                    <form class="form-horizontal">
                      <div class="box-body">
                        <div class="form-group">
                          <label for="inputSearchName" class="col-sm-1 control-label">题材名称</label>
                          <div class="col-sm-3">
                            <input type="text" class="form-control" id="inputSearchName" placeholder="题材名称">
                          </div>
                          <button type="button" class="btn btn-emarm pull-center" onclick="searchSubject();"><i class="fa fa-search"></i>&nbsp;查询</button>
                        </div>
                      </div><!-- /.box-body -->
                    </form>
                </div>
                <div class="tblToolbar">
                    <button class="btn btn-default" data-toggle="modal" data-target="#subjectModal"><i class="fa fa-plus"></i>&nbsp;新建</button>
                    <button class="btn btn-default ml10" onclick="batchDeleteSubjects();"><i class="fa fa-remove"></i>&nbsp;删除</button>
                </div>
                <div class="box-body">
                  <table id="subjectTbl" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th width="1" style="padding-right:8px;">&nbsp;</th>
                        <th width="1" style="padding-right:8px;"><input type="checkbox" onclick="checkAll(this);"/></th>
                        <th>名称</th>
                        <th>描述</th>
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

    <div id="subjectModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">新建作品题材</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal">
                <input id="inputId" type="hidden"/>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label"><span class="text-danger">* </span>名称</label>
                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder="名称" onblur="validateName();">
                      <div class="feedback-tip">
                        <label class="control-label" for="inputEmail3"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                      </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputDesc" class="col-sm-2 control-label">描述</label>
                  <div class="col-sm-10">
                    <textarea id="inputDesc" class="form-control" rows="3" placeholder="描述 ..."></textarea>
                  </div>
                </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearSubjectModal();">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="submitSubject();">保存</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

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
    <script id="subjectTmpl" type="text/html">
        {{each sbjlist as sbj idx}}
            <tr>
                <td><i class="fa fa-circle text-green"></i></td>
                <td><input type="checkbox" value="{{sbj.id}}" class="tblRowCheckbox"/></td>
                <td>{{sbj.name}}</td>
                <td>{{sbj.desc}}</td>
                <td><a onclick="popEditSubject('{{sbj.id}}');">编辑</a> {{if idx != 0}}<span class="small">|</span> <a onclick="upSubject('{{sbj.id}}');">上移</a>{{/if}} {{if idx != sbjlist.length - 1}}<span class="small">|</span> <a onclick="downSubject('{{sbj.id}}');">下移</a>{{/if}} <span class="small">|</span> <a onclick="deleteSubject('{{sbj.id}}', '{{sbj.name}}');">删除</a></td>
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
          $('#menu_subject').addClass('active');
      
          loadSubjects();
      });
      
      function loadSubjects() {
          $.get(
              '<idp:url value="/system/textSubjects"/>',
              {},
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var sbjs = result.data;
                      var html = template('subjectTmpl', {"sbjlist" : sbjs});
                      $('#subjectTbl tbody').empty().append(html);
                  }
              }
          );
      }
      
      function submitSubject() {
          if(!validateName()) {
              return ;
          }else{
              var sbjName = $('#inputName').val();
              var sbjDesc = $('#inputDesc').val();
              
              var sbjId = $('#inputId').val();
              
              if(sbjId && $.trim(sbjId).length > 0) {     //编辑
                  $.post(
                      '<idp:url value="/system/subject/"/>'+sbjId,
                      {
                          'name': sbjName,
                          'desc': sbjDesc
                      },
                      function(json) {
                          var result = IDEA.parseJSON(json);
                          if(result.type == 'success') {
                              alert('更新成功');
                              clearSubjectModal();
                              $('#subjectModal').modal('hide');
                              loadSubjects();
                          }
                      }
                  );       
              }else{                //新增
                  $.post(
                      '<idp:url value="/system/textSubject"/>',
                      {
                          'name': sbjName,
                          'desc': sbjDesc
                      },
                      function(json) {
                          var result = IDEA.parseJSON(json);
                          if(result.type == 'success') {
                              alert('保存成功');
                              clearSubjectModal();
                              $('#subjectModal').modal('hide');
                              loadSubjects();
                          }
                      }
                  );       
              }
          }
      }
      
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
      
      function clearSubjectModal() {
          $('#inputId').val('');
          $('#inputName').val('');
          $('#inputDesc').val('');
      }
      
      function popEditSubject(id) {
          $.get(
              '<idp:url value="/system/subject/"/>' + id,
              {},
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var sbj = result.data;
                      $('#inputId').val(id);
                      $('#inputName').val(sbj.name);
                      $('#inputDesc').val(sbj.desc);
                      $('#subjectModal').modal('show');
                  }
              }
          );
      }
      
      function deleteSubject(id, name) {
          var r = confirm("您真的要删除作品题材[" + name + "]吗？");
          if(r) {
              $.post(
                  '<idp:url value="/system/subject/"/>' + id,
                  {'_method': "delete"},
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('删除成功');
                          loadSubjects();
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
      
      function batchDeleteSubjects() {
          var ids = [];
          $('.tblRowCheckbox:checked').each(function(){
              ids.push($(this).val());
          });
          
          if(ids.length == 0) {
              alert('您没有选择任何记录。');
              return ;
          }
      
          var r = confirm("您真的要删除这些作品题材吗？");
          if(r) {
              $.post(
                  '<idp:url value="/system/batchDeleteSubject"/>',
                  {
                      '_method': "delete",
                      'ids': ids.join(',')
                  },
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('删除成功');
                          loadSubjects();
                      }
                  }
              );
          }
      }
      
      function upSubject(id) {
          $.post(
              '<idp:url value="/system/upSubject"/>',
              {"id": id},
              function(json) {
                  var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('移动成功');
                          loadSubjects();
                      }
              }
          );
      }
      
      function downSubject(id) {
          $.post(
              '<idp:url value="/system/downSubject"/>',
              {"id": id},
              function(json) {
                  var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('移动成功');
                          loadSubjects();
                      }
              }
          );
      }
      
      function searchSubject() {
          var searchKey = $('#inputSearchName').val();
          
          var param = {};
          if(searchKey && $.trim(searchKey).length > 0) {
              param.key = searchKey;
          }
          
          $.get(
              '<idp:url value="/system/textSubjects"/>',
              param,
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var sbjs = result.data;
                      var html = template('subjectTmpl', {"sbjlist" : sbjs});
                      $('#subjectTbl tbody').empty().append(html);
                  }
              }
         );
      }
    </script>
  </body>
</html>