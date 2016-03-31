<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数字音频版权云平台 | 制作任务详情</title>
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
              <span class="emarm_title_text">数字音频版权云平台</span>
              <!--
              <img style="margin-top: 4px;" src='<idp:url value="/img/logo.png"/>' height="40"/>
              -->
            </div>
          </div><!-- /.container-fluid -->
        </nav>
    </header>
    <div class="wrapper detailBody">
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper detailContent">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1 class="detailTitle col-xs-6">${task.product.name}</h1>
            <span class="label bg-green pull-right">${task.stateText}</span>
            <!--
            <c:if test="${product.state == '0' || fn:indexOf(sessionScope.__SESSION__USER__.role, '99') != '-1' || fn:indexOf(sessionScope.__SESSION__USER__.role, '02') != '-1' || fn:indexOf(sessionScope.__SESSION__USER__.role, '03') != '-1'}">
                <button class="btn btn-default pull-right ml10" onclick="deleteProduct('${product.name}');"><i class="fa fa-remove"></i> 删除</button>
                <button class="btn btn-default pull-right ml10" onclick="popAuditProduct('${product.id}', '${product.name}');"><i class="fa fa-edit"></i> 编辑</button>
            </c:if>
            <c:if test="${product.state == '2' || product.state == '3'}">
                <button class="btn btn-default pull-right ml10" onclick="popAuditProduct('${product.id}', '${product.name}');"><i class="fa fa-tag"></i> 邀请评价</button>
            </c:if>
            <c:if test="${product.state == '1'}">
                <button class="btn btn-default pull-right ml10" onclick="popAuditProduct('${product.name}');"><i class="fa fa-star-half-empty"></i> 审核</button>
            </c:if>
            -->
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box box-widget">
                  <div class="box-body">
                      <div class="row">
                          <div class="col-xs-2">
                              <img width="136" src='<idp:url value="/img/default_product_logo.jpg"/>'/>
                          </div>
                          <div class="col-xs-10">
                              <p class="col-xs-12">作品：<a>${task.product.name}</a></p>
                              <p class="col-xs-5 detailInfo-light">制作团队：${task.maker.name}</p>
                              <p class="col-xs-7 detailInfo-light">制作合同：<a href=''>aaa</a></p>
                              <p class="col-xs-5 detailInfo-light">单集时长：${task.timePerSection} 分钟</p>
                              <p class="col-xs-7 detailInfo-light">制作周期：${task.makeTime}&nbsp;天</p>
                              <p class="col-xs-12 detailInfo-light">演员要求：</p>
                              <p class="col-xs-12 detailInfo-light productSummary">${task.showExpection}</p>
                              <p class="col-xs-12 detailInfo-light">备注：</p>
                              <p class="col-xs-12 detailInfo-light productSummary">${task.desc}</p>
                          </div>
                      </div>
                      <div class="row mt30">
                          <div class="col-md-12">
                              <div class="box box-emarm">
                                  <div class="box-header with-border">
                                      <h3 class="box-title"><span>音频列表</span></h3>
                                      <span class="pull-right">共 ${task.totalSection} 集</span>
                                  </div>
                                  <div class="box-body">
                                      <div style="height: 40px;">
                                          <button class="btn btn-default pull-right ml10" onclick="popSectionModal();"><i class="fa fa-star-half-empty"></i> 新增单集</button>
                                      </div>
                                      <div id="audioList">
                                          
                                      </div>
                                  </div> 
                              </div><!-- /.box -->
                          </div>
                      </div>
                  </div> 
              </div><!-- /.box -->
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
        <strong style="margin-left: 230px;">Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">北京广播公司</a>.</strong> All rights reserved.
    </footer>

    <div id="sectionModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">新增单集</h4>
          </div>
          <div class="modal-body">
              <form class="form-horizontal">
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputSectionName" class="col-md-2 control-label">名称</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputSectionName" placeholder="名称">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputSectionName"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div>
                  </div>
              </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeSectionModal();">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="submitSection();">保存</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <div id="auditModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">评论</h4>
          </div>
          <div class="modal-body">
              <form class="form-horizontal">
                  <input id="inputAuditMakeTaskAudioId" type="hidden"/>
                  <div class="col-md-12">
                  <div class="form-group">
                    <label>内容</label>
                    <textarea id="auditText" class="form-control" multiple="multiple" data-placeholder="审核意见" style="width: 100%;"></textarea>
                  </div><!-- /.form-group -->
                  </div>
              </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeAuditModal();">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="submitAudit();">保存</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <div id="audioModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">上传音频文件</h4>
          </div>
          <div class="modal-body">
              <form class="form-horizontal">
                  <input id="inputSectionId" type="hidden"/>
                  <div class="col-xs-12">
                      <div class="form-group required">
                          <label for="inputFile" class="col-xs-2 control-label">音频文件</label>
                          <div id="docUploadDiv" class="col-xs-10">
                              <input id="importFile" name="importFile" type="file" class="form-control"/>
                              <ul id="uploadedFile"></ul>
                              <input type="hidden" id="inputAudio"/>
                          </div>
                      </div>
                      <div class="form-group required">
                          <label class="col-xs-2 control-label">版本</label>
                          <div class="col-xs-2">
                              <select class="form-control col-md-1" id="version1">
                                  <option value="1">1</option>
                                  <option value="2">2</option>
                                  <option value="3">3</option>
                                  <option value="4">4</option>
                                  <option value="5">5</option>
                                  <option value="6">6</option>
                                  <option value="7">7</option>
                                  <option value="8">8</option>
                                  <option value="9">9</option>
                                  <option value="10">10</option>
                              </select>
                          </div>
                          <div class="pull-left" style="font-weight: bold; margin-top: 10px;">
                              <span>.</span>
                          </div>
                          <div class="col-xs-2">
                              <select class="form-control col-md-1" id="version2">
                                  <option value="0">0</option>
                                  <option value="1">1</option>
                                  <option value="2">2</option>
                                  <option value="3">3</option>
                                  <option value="4">4</option>
                                  <option value="5">5</option>
                                  <option value="6">6</option>
                                  <option value="7">7</option>
                                  <option value="8">8</option>
                                  <option value="9">9</option>
                              </select>
                          </div>
                      </div>
                  </div>
              </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeAudioModal();">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="submitAudio();">确定</button>
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
    
    <script src='<idp:url value="/plugins/fileupload/jquery.ui.widget.js"/>'></script>
    <script src='<idp:url value="/plugins/fileupload/jquery.fileupload.js"/>'></script>
    <script src='<idp:url value="/plugins/fileupload/jquery.iframe-transport.js"/>'></script>
    
    <script src='<idp:url value="/js/ideajs.js"/>'></script>
    <script src='<idp:url value="/js/template.js"/>'></script>
    
    <script id="makeAudioTmpl" type="text/html">
        {{each audioes as audio index}}
            <div class="box box-default box-solid collapsed-box" rel="{{audio.id}}">
              <div class="box-header with-border">
                  <span>{{audio.title}}&nbsp;&nbsp;{{if audio.state == '1'}}<span class="label bg-green">已通过</span>{{/if}}</span>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" onclick="popAudioModal('{{audio.id}}');"><i class="fa fa-up"></i>上传</button>
                    <button class="btn btn-box-tool mr30" onclick="popAuditModal('{{audio.id}}');"><i class="fa fa-up"></i>评论</button>
                    <button class="btn btn-box-tool" data-widget="collapse" onclick="listAudioFiles('{{audio.id}}', this);"><i class="fa fa-plus"></i></button>
                  </div><!-- /.box-tools -->
              </div>
              <div class="box-body" style="display: none;">
                  <strong>文件列表</strong>
                  <table rel="{{audio.id}}" class="table table-bordered table-hover" style="width:100%;">
                      <tbody>
                      
                      </tbody>
                  </table>
                  <strong>审核信息</strong>
                  <ul class="list-group" rel="{{audio.id}}">
                      
                  </ul>
              </div>
            </div>
        {{/each}}
    </script>
    
    <script id="fileTblTmpl" type="text/html">
        {{each files as file index}}
            <tr>
              <td>{{file.version}}</td>
              <td>{{file.createTime}}</td>
              <td>{{if file.state == '1'}}已通过{{else}}未通过{{/if}}</td>
              <td>
                  <a href='<idp:url value="{{file.fileUrl}}"/>' class="label bg-green">下载</a>
                  {{if file.state == '0'}}<a href='javascript:void(0);' class="label bg-green" onclick="passAudio('{{file.id}}');">通过</a>{{/if}}
              </td>
            </tr>
        {{/each}}
    </script>
    
    <script id="auditListTmpl" type="text/html">
        {{each audits as audit index}}
            <li class="list-group-item col-xs-12">
              <div class="col-xs-2">{{audit.auditor.name}}</div>
              <div class="col-xs-3">{{audit.createTime}}</div>
              <div class="col-xs-7">{{audit.remark}}</div>
            </li>
        {{/each}}
    </script>
    
    <!-- page script -->
    <script>
      $(document).ready(function(){
          loadMakeTaskAudioes();
          
          $('#importFile').fileupload({
              url: '<idp:url value="/uploadAudio"/>',
              dataType: 'json',
              done: function (e, data) {
                     var fileUrl = data['result']['data'][0]['fileUrl'];
                     var fileName = data['result']['data'][0]['fileName'];
                     $('#uploadedFile').html('<li>'+fileName+'</li>');
                     $('#inputAudio').val(fileUrl);
              }
          });
      });
      
      function loadMakeTaskAudioes() {
          $.get(
              '<idp:url value="/make/makeTaskAudioes"/>?id=${task.id}',
              {},
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type = 'success') {
                      var audioes = result.data;
                      var html = template('makeAudioTmpl', {"audioes": audioes});    
                      $('#audioList').html(html);
                  }
                  
              }
          )
      }
      
      function popSectionModal() {
          clearSectionModal();
          $('#sectionModal').modal('show');
      }
      
      function clearSectionModal() {
          $('#inputSectionName').val('');
      }
      
      function closeSectionModal() {
          clearSectionModal();
          $('#sectionModal').modal('hide');
      }
      
      function submitSection() {
          var name = $('#inputSectionName').val();
          
          $.post(
              '<idp:url value="/make/createSection"/>',
              {
                  "name": name,
                  "makeTaskId": '${task.id}'   
              },
              function(json) {
                  var result = $.parseJSON(json);
                  if(result.type == 'success') {
                      alert('保存成功。');
                      window.location.reload();
                  }
              }
          );
      }
      
      function validateSectionName() {
          
      }
      
      
      
      function popAudioModal(id) {
          clearAudioModal();
          $('#inputSectionId').val(id);
          $('#audioModal').modal('show');
      }
      
      function clearAudioModal() {
          $('#inputSectionId').val('');
          $('#inputAudio').val('');
          $('#importFile').val('');
          $('#uploadedFile').empty();
          $('#version1')[0].selectedIndex = 0;
          $('#version2')[0].selectedIndex = 0;
      }
      
      function closeAudioModal() {
          clearAudioModal();
          $('#audioModal').modal('hide');
      }
      
      function submitAudio() {
          var id = $('#inputSectionId').val();
          var fileUrl = $('#inputDoc').val();
          var version = $('#version1').val() + "." + $('#version2').val();
          
          $.post(
              '<idp:url value="/make/makeTaskAudioFile"/>',
              {
                  "makeTaskAudioId": id,
                  "version": version,
                  "fileUrl": fileUrl
              },
              function(json) {
                  var result = $.parseJSON(json);
                  if(result.type == 'success') {
                      alert('保存成功。');
                      window.location.reload();
                  }
              }
          );
      }
      
      function listAudioFiles(id, obj) {
          var parentBox = $(obj).parentsUntil('box').parent();
          if(parentBox.hasClass('collapsed-box')) {
              $.get(
                  '<idp:url value="/make/makeTaskAudioFiles"/>?makeTaskAudioId=' + id,
                  {},
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          var files = result.data;
                          var html = template('fileTblTmpl', {"files": files});
                          $('table[rel=' + id + '] tbody').html(html);
                      }
                  }
              );
              
              $.get(
                  '<idp:url value="/make/makeTaskAudioAudits"/>?makeTaskAudioId=' + id,
                  {},
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          var audits = result.data;
                          var html = template('auditListTmpl', {"audits": audits});
                          $('.list-group[rel=' + id + ']').html(html);
                      }
                  }
              );
          }
      }
      
      function popAuditModal(id) {
          clearAuditModal();
          $('#inputAuditMakeTaskAudioId').val(id);
          $('#auditModal').modal('show');
      }
      
      function clearAuditModal() {
          $('#inputAuditMakeTaskAudioId').val('');
          $('#auditText').val('');
      }
      
      function closeAuditModal() {
          clearAuditModal();
          $('#auditModal').modal('hide');
      }
      
      function submitAudit() {
          var id = $('#inputAuditMakeTaskAudioId').val();
          var remark = $('#auditText').val();
          
          $.post(
              '<idp:url value="/make/makeTaskAudioAudit"/>',
              {
                  "makeTaskAudioId": id,
                  "remark": remark
              },
              function(json) {
                  var result = $.parseJSON(json);
                  if(result.type == 'success') {
                      alert('保存成功。');
                      window.location.reload();
                  }
              }
          );
      }
      
      function passAudio(id) {
          var r = window.confirm('通定通过此音频吗？');
          if(r) {
              $.post(
                  '<idp:url value="/make/passAudio"/>',
                  {"audioId" : id},
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('保存成功.');
                          window.location.reload();
                      }
                  }
              );
          }
      }
    </script>
  </body>
</html>