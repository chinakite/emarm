<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数字音频版权云平台 | 制作任务</title>
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
          <h1>作品《${product.name}》的制作任务
            <small>作品《${product.name}》的所有制作任务。</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href='<idp:url value="/home"/>'><i class="fa fa-home"></i> 首页</a></li>
            <li><a href='<idp:url value="/make/productPage"/>'><i class="fa fa-doc"></i> 制作任务</a></li>
            <li class="active">任务列表</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">任务列表</h3>
                </div><!-- /.box-header -->
                <div class="tblToolbar">
                    <button class="btn btn-default" data-toggle="modal" onclick="popTaskModal();"><i class="fa fa-plus"></i>&nbsp;新建</button>
                </div>
                <div class="box-body">
                  <table id="taskTbl" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th>制作团队</th>
                        <th>合同编号</th>
                        <th>单集时长</th>
                        <th>演播形式</th>
                        <th>制作周期</th>
                        <th>状态</th>
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

    <div id="taskModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">新建制作任务</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal">
                <input id="inputProductId" type="hidden"/>
                <div class="form-group required">
                  <label for="inputMaker" class="col-sm-2 control-label">制作团队</label>
                  <div class="col-sm-10">
                      <select id="inputMaker" class="form-control">
                      </select>
                  </div>
                </div>
                <div class="form-group required">
                  <label for="inputContract" class="col-sm-2 control-label">制作合同</label>
                  <div class="col-sm-10">
                      <select id="inputContract" class="form-control">
                      </select>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputTimePerSection" class="col-sm-2 control-label"><span class="text-danger">* </span>单集时长</label>
                  <div class="col-sm-4">
                      <div class="input-group">
                          <input type="text" class="form-control" id="inputTimePerSection"/>
                          <span class="input-group-addon">分钟</span>
                      </div>
                      <div class="feedback-tip">
                        <label class="control-label" for="inputTimePerSection"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                      </div>
                  </div>
                </div>
                <div class="form-group required">
                  <label for="inputShowType" class="col-sm-2 control-label">演播形式</label>
                  <div class="col-sm-4">
                      <select id="inputShowType" class="form-control">
                          <option value="1">单播</option>
                          <option value="2">对播</option>
                          <option value="3">广播剧</option>
                          <option value="9">其他</option>
                      </select>
                  </div>
                </div>
                <div class="form-group required">
                  <label for="inputShowExpection" class="col-sm-2 control-label">演员要求</label>
                  <div class="col-sm-10">
                    <textarea id="inputShowExpection" class="form-control" rows="3" placeholder="描述演员要求..."></textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputMakeTime" class="col-sm-2 control-label"><span class="text-danger">* </span>制作周期</label>
                  <div class="col-sm-4">
                      <div class="input-group">
                          <input type="text" class="form-control" id="inputMakeTime"/>
                          <span class="input-group-addon">天</span>
                      </div>
                      <div class="feedback-tip">
                        <label class="control-label" for="inputMakeTime"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                      </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputDesc" class="col-sm-2 control-label">备注</label>
                  <div class="col-sm-10">
                    <textarea id="inputDesc" class="form-control" rows="3" placeholder="备注 ..."></textarea>
                  </div>
                </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearAuthorModal();">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="submitMakeTask();">保存</button>
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
    
    <!-- Select2 -->
    <script src='<idp:url value="/plugins/select2/select2.full.min.js"/>'></script>
    
    <script src='<idp:url value="/js/ideajs.js"/>'></script>
    <script src='<idp:url value="/js/template.js"/>'></script>
    
    <script src='<idp:url value="/plugins/fileupload/jquery.ui.widget.js"/>'></script>
    <script src='<idp:url value="/plugins/fileupload/jquery.fileupload.js"/>'></script>
    <script src='<idp:url value="/plugins/fileupload/jquery.iframe-transport.js"/>'></script>
    
    <!-- template -->
    <script id="userSelectorTmpl" type="text/html">
        {{each userlist as user idx}}
           <option value="{{user.id}}">{{user.name}}({{user.email}})</option>
        {{/each}}
    </script>
    
    <!-- template -->
    <script id="categoryTmpl" type="text/html">
        {{each cglist as cg idx}}
           <option value="{{cg.id}}">{{cg.name}}</option>
        {{/each}}
    </script>
    
    <!-- page script -->
    <script>
      var table;
    
      $(document).ready(function(){
          $('#menu_make').addClass('active');
          $('#menu_mk_task').addClass('active');
      
          initTaskTbl();
          loadExtMakers();
      });
      
      function loadExtMakers() {
          $.get(
              '<idp:url value="/system/extMakers"/>',
              {},
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var users = result.data;
                      var html = template('userSelectorTmpl', {"userlist" : users});
                      $('#inputMaker').empty().append(html);
                  }
              
                  $("#inputMaker").select2({ width: 'auto' });
              }
          )
      }
      
      function loadCategories() {
          $.get(
              '<idp:url value="/system/textSubjects"/>',
              {},
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var subjects = result.data;
                      var html = template('categoryTmpl', {"cglist" : subjects});
                      $('#inputSubject').empty().append(html);
                  }
                  //$("#inputSubject").select2();
              }
          )
      }
      
      function initTaskTbl() {
          table = $('#taskTbl').DataTable({
              "processing": true,
              "paging": false,
              "lengthChange": false,
              "searching": false,
              "ordering": false,
              "info": false,
              "autoWidth": false,
              "serverSide": true,
              "ajax": {url: '<idp:url value="/make/makeTasks"/>?productId=${product.id}'},
              "columns": [
                {},
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
                          return full.maker.name;
                      }
                  },
                  {
                      "targets": [1],
                      "render": function(data, type, full) {
                          if(full.contract) {
                              return full.contract.code;
                          }else{
                              return '';
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
                          return full.stateText;
                      }
                  },
                  {
                      "targets": [6],
                      "render": function(data, type, full) {
                          var role = '${sessionScope.__SESSION__USER__.role}';
                      
                          var html = '<a href=\'<idp:url value="/make/taskDetail"/>?id=' + full.id + '\' target="_blank">查看</a> ';
                              html += ' <span class="small">|</span> ';
                              html += '<a onclick="popTaskModal(\'' + full.id + '\');">删除</a>';
                          
                          if(full.state == '0') {
                              html += ' <span class="small">|</span> ';
                              html += '<a onclick="publishTask(\'' + full.id + '\');">发布</a>';
                          }
                          
                          return html;
                      }
                  }
              ]
          });
      }
      
      function publishTask(id) {
          var r = window.confirm('任务发布后将不能编辑，您确定要发布此任务吗？');
          if(r) {
              $.post(
                  '<idp:url value="/make/publishTask"/>',
                  {
                      "id": id
                  },
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('发布成功');
                          window.location.reload();
                      }
                  }
              );
          }else{
              return;
          }
      }
      
      function searchProducts() {
          table.ajax.reload();
      }
      
      function popTaskModal(productId) {
          $('#inputProductId').val(productId);
          $('#taskModal').modal('show');
      }
      
      function submitMakeTask() {
          var r = false;
          /*
          if(submit == '0') {
              r = validateName();
          }else{
              r = validateName()
                    && validateAuthorName()
                    && validateWordCount();
          }
          */
          r = true;
      
          if(!r) {
              return ;
          }else{
              var productId = $('#inputProductId').val();
              var makerId = $('#inputMaker').val();
              var contractId = $('#inputContract').val();
              var timePerSection = $('#inputTimePerSection').val();
              var showType = $('#inputShowType').val();
              var showExpection = $('#inputShowExpection').val();
              var makeTime = $('#inputMakeTime').val();
              var desc = $('#inputDesc').val();
              
              $.post(
                  '<idp:url value="/make/makeTask"/>',
                  {
                      'productId': productId,
                      'makerId': makerId,
                      'contractId': contractId,
                      'timePerSection': timePerSection,
                      'showType': showType,
                      'showExpection': showExpection,
                      'makeTime': makeTime,
                      'desc': desc
                  },
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('保存成功');
                          clearTaskModal();
                          $('#taskModal').modal('hide');
                          table.ajax.reload();
                      }
                  }
              );       
          }
      }
      
      function validateName() {
          var inputNameEle = $('#inputName');
          var authorName = inputNameEle.val();
          if(!authorName || $.trim(authorName).length == 0) {
              var formGroup = inputNameEle.parents('.form-group');
              if(!formGroup.hasClass('has-error')) {
                  inputNameEle.parents('.form-group').addClass('has-error');
                  inputNameEle.next('.feedback-tip').find('span').text('作品名称不能为空');
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
      
      function validateAuthorName() {
          var inputAuthorNameEle = $('#inputAuthorName');
          var authorName = inputAuthorNameEle.val();
          if(!authorName || $.trim(authorName).length == 0) {
              var formGroup = inputAuthorNameEle.parents('.form-group');
              if(!formGroup.hasClass('has-error')) {
                  inputAuthorNameEle.parents('.form-group').addClass('has-error');
                  inputAuthorNameEle.next('.feedback-tip').find('span').text('作者不能为空');
                  inputAuthorNameEle.next('.feedback-tip').show();
              }
              return false;
          }else{
              inputAuthorNameEle.parents('.form-group').removeClass('has-error');
              inputAuthorNameEle.next('.feedback-tip').find('span').text('');
              inputAuthorNameEle.next('.feedback-tip').hide();
              return true;
          }
      }
      
      function validateWordCount() {
          var inputWordCountEle = $('#inputWordCount');
          var wordCount = inputWordCountEle.val();
          if(!wordCount || $.trim(wordCount).length == 0) {
              var formGroup = inputWordCountEle.parents('.form-group');
              if(!formGroup.hasClass('has-error')) {
                  inputWordCountEle.parents('.form-group').addClass('has-error');
                  inputWordCountEle.next('.feedback-tip').find('span').text('字数不能为空');
                  inputWordCountEle.next('.feedback-tip').show();
              }
              return false;
          }else{
              inputWordCountEle.parents('.form-group').removeClass('has-error');
              inputWordCountEle.next('.feedback-tip').find('span').text('');
              inputWordCountEle.next('.feedback-tip').hide();
              return true;
          }
      }
      
      function clearTaskModal() {
          $('#inputProductId').val('');
      }
      
      function popAuditProduct(id, name) {
          $('#auditProductName').text(name);
          $('#auditProductId').val(id);
          
          $('#auditModal').modal('show');
      }
      
      function closeAuditModal() {
          clearAuditModal();
          $('#auditModal').modal('hide');
      }
      
      function clearAuditModal() {
          $('#auditProductName').text('');
          $('#auditProductId').val('');
      }
      
      function deleteProduct(id, name) {
          var r = confirm("您真的要删除作品[" + name + "]吗？");
          if(r) {
              $.post(
                  '<idp:url value="/evaluation/product/"/>' + id,
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
      
      function changePublishState() {
          var publishState = $('#inputPublishState').val();
          if(publishState == '0') {
              $('#publishYearLabel').show();
              $('#publishYearDiv').show();
              $('#finishYearLabel').hide();
              $('#finishYearDiv').hide();
              $('#pressDiv').show();
              $('#isbnDiv').show();
              $('#websiteDiv').hide();
          }else{
              if(publishState == '1') {
                  $('#websiteDiv').show();
              }else{
                  $('#websiteDiv').hide();
              }
          
              $('#publishYearLabel').hide();
              $('#publishYearDiv').hide();
              $('#finishYearLabel').show();
              $('#finishYearDiv').show();
              $('#pressDiv').hide();
              $('#isbnDiv').hide();
          }
      }
      
      function hasAudioClick() {
          $('#audioCopyrightDiv').show();
          $('#audioDescDiv').show();
      }
      
      function noAudioClick() {
          $('#audioCopyrightDiv').hide();
          $('#audioDescDiv').hide();
      }
      
      //--------------- 评价 ---------------------
      function popEvaluationModal(id, name) {
          $('#evaluateProductName').text(name);
          $('#evaluateProductId').val(id);
          $('#evaluationModal').modal('show');
      }
      
      function clearEvaluationModal() {
          $('#evaluateProductName').text();
          $('#evaluateProductId').val('');
          $('#inviteEvaluator').val('');
      }
      
      function submitEvaluate() {
          var s = $('#inviteEvaluator').val();
          var proId = $('#evaluateProductId').val();
          
          if(!s || $.trim(s).length == 0) {
              alert('您没有选择任何评价人，无法发送邀请.');
          }
          
          $.post(
              '<idp:url value="/evaluation/inviteEvaluation/"/>'+proId,
              {
                  'userIds': s+''
              },
              function(json) {
                  alert(json);
              }
          );
      }
      
      function passProduct() {
          var prodId = $('#auditProductId').val();
          $.post(
              '<idp:url value="/evaluation/passProduct"/>',
              {id: prodId},
              function(data) {
                  alert('审核成功');
                  closeAuditModal();
                  table.ajax.reload();
              }
          );
      }
      
      function rejectProduct() {
          var prodId = $('#auditProductId').val();
          $.post(
              '<idp:url value="/evaluation/rejectProduct"/>',
              {id: prodId},
              function(data) {
                  alert('审核成功');
                  closeAuditModal();
                  table.ajax.reload();
              }
          );
      }
      
      function popEditModal(id) {
          $.get(
              '<idp:url value="/evaluation/product"/>/'+id,
              {},
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      clearProductModal();
                      var prod = result.data;
                      
                      $('#inputId').val(prod.id);
                      $('#inputName').val(prod.name);
                      $('#inputAuthorName').val(prod.author.name);
                      $('#inputAuthorPseudonym').val(prod.author.pseudonym);
                      $('#inputWordCount').val(prod.wordCount);
                      $('#inputSubject').find('option[value=' + prod.subject.id + ']').attr('selected', true);
                      $('#inputPublishState').find('option[value=' + prod.publishState + ']').attr('selected', true);
                      if(prod.publishState == 0) {
                          $('#inputPublishYear').find('option[value=' + prod.publishYear + ']').attr('selected', true);
                          $('#inputPress').val(prod.press);
                          $('#inputIsbn').val(prod.isbn);
                      }else{
                          $('#publishYearDiv').hide();
                          $('#pressDiv').hide();
                          $('#isbnDiv').hide();
                          $('#inputFinishYear').find('option[value=' + prod.finishYear + ']').attr('selected', true);
                          $('#finishYearDiv').show();
                          if(prod.publishState == 1) {
                              $('#inputWebsite').val(prod.website);
                              $('#websiteDiv').show();
                          }
                      }
                      $('#inputSummary').val(prod.summary);
                      if(prod.samples.length > 0) {
                          $('#samplesShowDiv a').attr('href', '<idp:url value=""/>' + prod.samples[0].fileUrl);
                          $('#samplesUploadDiv').hide();
                          $('#samplesShowDiv').show();
                      }
                      
                      if(prod.hasAudio == '1') {
                          $('#hasAudio').attr('checked', true);
                          $('#inputAudioCopyright').find('option[value=' + prod.audioCopyright + ']').attr('selected', true);
                          $('#inputAudioDesc').val(prod.audioDesc);
                          $('#audioCopyrightDiv').show();
                          $('#audioDescDiv').show();
                      }else{
                          $('#noAudio').attr('checked', true);
                          $('#inputAudioDesc').val('');
                          $('#audioCopyrightDiv').hide();
                          $('#audioDescDiv').hide();
                      }
                      
                      $('#productModal').modal('show');
                  }
              }
          );
      }
    </script>
  </body>
</html>