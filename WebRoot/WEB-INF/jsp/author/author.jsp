<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数字音频版权云平台 | 作者管理</title>
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
          <h1>作者管理
            <small>所有作者信息在此管理，可以设置某作者为知名作者。</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href='<idp:url value="/home"/>'><i class="fa fa-dashboard"></i> 首页</a></li>
            <li class="active">作者管理</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">作者列表</h3>
                </div><!-- /.box-header -->
                <div>
                    <form class="form-horizontal">
                      <div class="box-body">
                        <div class="form-group">
                          <label for="inputSearchName" class="col-sm-1 control-label">姓名</label>
                          <div class="col-sm-3">
                            <input type="text" class="form-control" id="inputSearchName" placeholder="作者姓名">
                          </div>
                          <button type="button" class="btn btn-emarm pull-center" onclick="searchAuthor();"><i class="fa fa-search"></i>&nbsp;查询</button>
                        </div>
                      </div><!-- /.box-body -->
                    </form>
                </div>
                <div class="tblToolbar">
                    <button class="btn btn-default" data-toggle="modal" data-target="#authorModal"><i class="fa fa-plus"></i>&nbsp;新建</button>
                    <button class="btn btn-default ml10" onclick="batchDeleteAuthors();"><i class="fa fa-remove"></i>&nbsp;删除</button>
                </div>
                <div class="box-body">
                  <table id="authorTbl" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th width="1" style="padding-right:8px;"><input type="checkbox" onclick="checkAll(this);"/></th>
                        <th width="1" style="padding-right:8px;"></th>
                        <th>姓名</th>
                        <th>笔名</th>
                        <th>描述</th>
                        <th>操作</th>
                      </tr>
                    </thead>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
      <%@ include file="../footer.jsp"%> 
      
    </div><!-- ./wrapper -->

    <div id="authorModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">新建作者信息</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal">
                <input id="inputId" type="hidden"/>
                <div class="form-group">
                  <label for="inputName" class="col-sm-2 control-label"><span class="text-danger">* </span>姓名</label>
                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder="姓名" onblur="validateName();">
                      <div class="feedback-tip">
                        <label class="control-label" for="inputName"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                      </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputPseudonym" class="col-sm-2 control-label"><span class="text-danger">* </span>笔名</label>
                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputPseudonym" placeholder="笔名">
                      <div class="feedback-tip">
                        <label class="control-label" for="inputPseudonym"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
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
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearAuthorModal();">关闭</button>
            <button type="button" class="btn btn-primary" onclick="submitAuthor();">保存</button>
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
          $('#menu_system').addClass('active');
          $('#menu_author').addClass('active');
          initAuthorTbl();
      });
      
      function initAuthorTbl() {
          table = $('#authorTbl').DataTable({
              "processing": true,
              "paging": true,
              "lengthChange": false,
              "searching": false,
              "ordering": false,
              "info": true,
              "autoWidth": false,
              "serverSide": true,
              "ajax": {url: '<idp:url value="/system/dtAuthors"/>',
                  "data": function(d) {
                      var searchKey = $('#inputSearchName').val();
                      if(searchKey && $.trim(searchKey).length > 0) {
                          d.key = searchKey;
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
                {width:'1px'},
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
                        return '<input type="checkbox" value="' + full.id + '" class="tblRowCheckbox"/>';
                      }
                  },
                  {
                      "targets": [1],
                      "render": function(data, type, full) {
                          if(full.famous == '1'){
                              return '<small class="label bg-red">知名</small>';
                          }else{
                              return '';
                          }
                      }
                  },
                  {
                      "targets": [2],
                      "render": function(data, type, full) {
                          return full.name;
                      }
                  },
                  {
                      "targets": [3],
                      "render": function(data, type, full) {
                          return full.pseudonym == null ? '' : full.pseudonym;
                      }
                  },
                  {
                      "targets": [4],
                      "render": function(data, type, full) {
                          return full.desc;
                      }
                  },
                  {
                      "targets": [5],
                      "render": function(data, type, full) {
                          var html = '<a onclick="popEditAuthor(\''+full.id + '\');">编辑</a> ';
                              html += '<span class="small">|</span> ';
                          if(full.famous == '1') {
                              html += '<a onclick="unfamousAuthor(\'' + full.id + '\');">取消知名</a>';
                          }else{
                              html += '<a onclick="famousAuthor(\'' + full.id + '\');">设为知名</a>';
                          }
                              html += ' <span class="small">|</span> <a onclick="deleteAuthor(\'' + full.id + '\', \'' + full.name + '\');">删除</a>';
                      
                          return html;
                      }
                  }
              ]
          });
      }
      
      function loadAuthors() {
          $.get(
              '<idp:url value="/system/authors?curPage=1&pageSize=10"/>',
              {},
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var authors = result.data.data;
                      var html = template('authorTmpl', {"authorlist" : authors});
                      $('#authorTbl tbody').empty().append(html);
                      initAuthorTbl();
                  }
              }
          );
      }
      
      function submitAuthor() {
          if(!validateName()) {
              return ;
          }else{
              var authorName = $('#inputName').val();
              var authorDesc = $('#inputDesc').val();
              var authorPseudonym = $('#inputPseudonym').val();
              
              var authorId = $('#inputId').val();
              
              if(authorId && $.trim(authorId).length > 0) {     //编辑
                  $.post(
                      '<idp:url value="/system/author/"/>'+authorId,
                      {
                          'name': authorName,
                          'desc': authorDesc,
                          'pseudonym': authorPseudonym
                      },
                      function(json) {
                          var result = IDEA.parseJSON(json);
                          if(result.type == 'success') {
                              alert('更新成功');
                              clearAuthorModal();
                              $('#authorModal').modal('hide');
                              table.ajax.reload();
                          }
                      }
                  );       
              }else{                //新增
                  $.post(
                      '<idp:url value="/system/author"/>',
                      {
                          'name': authorName,
                          'desc': authorDesc,
                          'pseudonym': authorPseudonym
                      },
                      function(json) {
                          var result = IDEA.parseJSON(json);
                          if(result.type == 'success') {
                              alert('保存成功');
                              clearAuthorModal();
                              $('#authorModal').modal('hide');
                              table.ajax().reload();
                          }
                      }
                  );       
              }
          }
      }
      
      function validateName() {
          var inputNameEle = $('#inputName');
          var authorName = inputNameEle.val();
          if(!authorName || $.trim(authorName).length == 0) {
              var formGroup = inputNameEle.parents('.form-group');
              if(!formGroup.hasClass('has-error')) {
                  inputNameEle.parents('.form-group').addClass('has-error');
                  inputNameEle.next('.feedback-tip').find('span').text('作者姓名不能为空');
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
      
      function clearAuthorModal() {
          $('#inputId').val('');
          $('#inputName').val('');
          $('#inputDesc').val('');
      }
      
      function popEditAuthor(id) {
          $.get(
              '<idp:url value="/system/author/"/>' + id,
              {},
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var author = result.data;
                      $('#inputId').val(id);
                      $('#inputName').val(author.name);
                      $('#inputDesc').val(author.desc);
                      $('#inputPseudonym').val(author.pseudonym);
                      $('#authorModal').modal('show');
                  }
              }
          );
      }
      
      function deleteAuthor(id, name) {
          var r = confirm("您真的要删除作者[" + name + "]吗？");
          if(r) {
              $.post(
                  '<idp:url value="/system/author/"/>' + id,
                  {'_method': "delete"},
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('删除成功');
                          table.ajax.reload();
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
      
      function batchDeleteAuthors() {
          var ids = [];
          $('.tblRowCheckbox:checked').each(function(){
              ids.push($(this).val());
          });
          
          if(ids.length == 0) {
              alert('您没有选择任何记录。');
              return ;
          }
      
          var r = confirm("您真的要删除这些作者吗？");
          if(r) {
              $.post(
                  '<idp:url value="/system/batchDeleteAuthor"/>',
                  {
                      '_method': "delete",
                      'ids': ids.join(',')
                  },
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('删除成功');
                          table.ajax.reload();
                      }
                  }
              );
          }
      }
      
      function famousAuthor(id) {
          $.post(
              '<idp:url value="/system/famousAuthor"/>',
              {"id": id},
              function(json) {
                  var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('设置成功');
                          table.ajax.reload();
                      }
              }
          );
      }
      
      function unfamousAuthor(id) {
          $.post(
              '<idp:url value="/system/unfamousAuthor"/>',
              {"id": id},
              function(json) {
                  var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('设置成功');
                          table.ajax.reload();
                      }
              }
          );
      }
      
      function searchAuthor() {
          table.ajax.reload();
      }
    </script>
  </body>
</html>