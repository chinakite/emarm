<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数字音频版权云平台 | 合同详情</title>
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
    <input type="hidden" id="auditContractId" value="${contract.id}"/>
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
            <h1 class="detailTitle col-xs-6">合同编号：${contract.code}</h1>
            <c:if test="${contract.state != '10'}">
            <c:if test="${contract.state == '0' || fn:indexOf(sessionScope.__SESSION__USER__.role, '99') != '-1' || fn:indexOf(sessionScope.__SESSION__USER__.role, '32') != '-1' || fn:indexOf(sessionScope.__SESSION__USER__.role, '31') != '-1'}">
                <button class="btn btn-default pull-right ml10" onclick="deleteProduct('${contract.id}');"><i class="fa fa-remove"></i> 删除</button>
                <button class="btn btn-default pull-right ml10" onclick="popAuditProduct('${contract.id}');"><i class="fa fa-edit"></i> 编辑</button>
            </c:if>
            <button class="btn btn-default pull-right ml10" onclick="finishContract();"><i class="fa fa-remove"></i> 确认完成</button>
            <button class="btn btn-default pull-right ml10" onclick="popUploadContractDoc('${contract.id}');"><i class="fa fa-remove"></i> 上传合同</button>
            </c:if>
        </section>

        <!-- Main content -->
        <section class="content mt30">
          <div class="row">
            <div class="col-md-12">
              <div class="col-md-6">
                <div class="box box-emarm">
                  <div class="box-header">
                      <h3 class="box-title">甲方：${contract.owner}</h3>
                  </div>
                  <div class="box-body">
                      <ul class="list-group list-group-unbordered">
                        <li class="list-group-item">
                          <b>联系人</b> <span class="pull-right">${contract.ownerContact}</span>
                        </li>
                        <li class="list-group-item">
                          <b>联系电话</b> <span class="pull-right">${contract.ownerContactPhone}</span>
                        </li>
                        <li class="list-group-item">
                          <b>联系地址</b> <span class="pull-right">${contract.ownerContactAddress}</span>
                        </li>
                        <li class="list-group-item">
                          <b>电子邮箱</b> <span class="pull-right">${contract.ownerContactEmail}</span>
                        </li>
                      </ul>
                  </div> 
                </div><!-- /.box -->
              </div>
              <div class="col-md-6">
                <div class="box box-emarm">
                  <div class="box-header with-border">
                      <h3 class="box-title">乙方：${contract.buyer}</h3>
                  </div>
                  <div class="box-body">
                      <ul class="list-group list-group-unbordered">
                        <li class="list-group-item">
                          <b>联系人</b> <span class="pull-right">${contract.buyerContact}</span>
                        </li>
                        <li class="list-group-item">
                          <b>联系电话</b> <span class="pull-right">${contract.buyerContactPhone}</span>
                        </li>
                        <li class="list-group-item">
                          <b>联系地址</b> <span class="pull-right">${contract.buyerContactAddress}</span>
                        </li>
                        <li class="list-group-item">
                          <b>电子邮箱</b> <span class="pull-right">${contract.buyerContactEmail}</span>
                        </li>
                      </ul>
                  </div> 
                </div><!-- /.box -->
              </div>
              <div class="col-md-6">
                <div class="box box-emarm">
                  <div class="box-header with-border">
                      <h3 class="box-title">授权信息</h3>
                  </div>
                  <div class="box-body">
                      <ul class="list-group list-group-unbordered">
                        <li class="list-group-item">
                          <b>授权种类</b> <span class="pull-right">${contract.privilegesText}</span>
                        </li>
                        <li class="list-group-item">
                          <b>授权方式</b> <span class="pull-right">${contract.privilegeTypeText}</span>
                        </li>
                        <li class="list-group-item">
                          <b>授权范围</b> <span class="pull-right">${contract.privilegeRangeText}</span>
                        </li>
                        <li class="list-group-item">
                          <b>授权期限</b> <span class="pull-right">${contract.privilegeDeadline}年</span>
                        </li>
                      </ul>
                  </div> 
                </div><!-- /.box -->
              </div>
              <div class="col-md-6">
                <div class="box box-emarm">
                  <div class="box-header with-border">
                      <h3 class="box-title">付款信息</h3>
                  </div>
                  <div class="box-body">
                      <ul class="list-group list-group-unbordered">
                        <li class="list-group-item">
                          <b>账户名称</b> <span class="pull-right">${contract.bankAccountName}</span>
                        </li>
                        <li class="list-group-item">
                          <b>开户行</b> <span class="pull-right">${contract.bank}</span>
                        </li>
                        <li class="list-group-item">
                          <b>银行账号</b> <span class="pull-right">${contract.bankAccountNo}</span>
                        </li>
                      </ul>
                  </div> 
                </div><!-- /.box -->
              </div>
            </div><!-- /.col -->
            <div class="col-md-12">
                <div class="box box-emarm">
                  <div class="box-header with-border">
                      <h3 class="box-title"><span>作品列表</span></h3>
                      <span class="pull-right">总价：${contract.totalPrice}元</span>
                  </div>
                  <div class="box-body">
                      <table id="prodTbl" class="table table-bordered">
                        <tbody>
                            
                        </tbody>
                      </table>
                  </div> 
                </div><!-- /.box -->
            </div>
            <div class="col-md-12">
                <div class="box box-emarm">
                  <div class="box-header with-border">
                      <h3 class="box-title"><span>审批信息</span></h3>
                  </div>
                  <div class="box-body">
                      <table id="auditTbl" class="table table-bordered">
                        <tbody>
                            
                        </tbody>
                      </table>
                  </div> 
                </div><!-- /.box -->
            </div>
            <div class="col-md-12">
                <div class="box box-emarm">
                  <div class="box-header with-border">
                      <h3 class="box-title"><span>合同文档列表</span></h3>
                  </div>
                  <div class="box-body">
                      <table id="docTbl" class="table table-bordered">
                        <tbody>
                            
                        </tbody>
                      </table>
                  </div> 
                </div><!-- /.box -->
            </div>
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

    <div id="auditModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">合同审核</h4>
          </div>
          <div class="modal-body">
              <form class="form-horizontal">
                  <div class="col-md-12">
                  <div class="form-group">
                    <label>审核意见</label>
                    <textarea id="auditText" class="form-control" multiple="multiple" data-placeholder="审核意见" style="width: 100%;"></textarea>
                  </div><!-- /.form-group -->
                  </div>
              </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeAuditModal();">关闭</button>
            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="rejectContract('${contract.id}');">不通过</button>
            <button type="button" class="btn btn-emarm" onclick="passContract('${contract.id}');">通过</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
    <div id="docModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">上传合同文件</h4>
          </div>
          <div class="modal-body">
              <form class="form-horizontal">
                  <input id="finishedDoc" type="hidden" value="0"/>
                  <div class="col-xs-12">
                      <div class="form-group required">
                          <label for="inputFile" class="col-xs-2 control-label">合同文件</label>
                          <div id="docUploadDiv" class="col-xs-10">
                              <input id="importFile" name="importFile" type="file" class="form-control"/>
                              <ul id="uploadedFile"></ul>
                              <input type="hidden" id="inputDoc"/>
                          </div>
                      </div>
                      <div class="form-group required">
                          <label for="inputFile" class="col-xs-2 control-label">文件类别</label>
                          <div id="docTypeDiv" class="col-xs-10">
                              <select class="form-control" id="docType">
                                  <option value="1">合同文件</option>
                                  <option value="2">补充协议</option>
                              </select>
                          </div>
                      </div>
                      <div class="form-group required">
                          <label for="inputFile" class="col-xs-2 control-label">合同版本</label>
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
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeDocModal();">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="uploadContractDoc('${contract.id}');">确定</button>
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
    
    <script id="productTblTmpl" type="text/html">
        {{each prodlist as prod idx}}
           <tr>
              <td>{{prod.name}}</td>
              <td>{{prod.isbn}}</td>
              <td>{{prod.scProduct.price}}元</td>
           </tr>
        {{/each}}
    </script>
    
    <script id="auditTblTmpl" type="text/html">
        {{each ccalist as cca idx}}
           <tr>
              <td>{{cca.auditor.name}}</td>
              <td>{{cca.auditResultText}}</td>
              <td>{{cca.auditRemark}}</td>
              <td>{{cca.auditTime}}</td>
           </tr>
        {{/each}}
    </script>
    
    <script id="docTblTmpl" type="text/html">
        {{each doclist as doc idx}}
           <tr>
              <td>{{doc.typeText}}</td>
              <td>{{doc.version}}</td>
              <td>{{doc.createTime}}</td>
              <td><a href="<idp:ctx/>{{doc.fileUrl}}">下载</a></td>
           </tr>
        {{/each}}
    </script>
    
    <!-- page script -->
    <script>
      var table;
    
      $(document).ready(function(){
          loadContractProducts();
          //loadContractAudits();
          loadContractDocs();
          
          $('#importFile').fileupload({
              url: '<idp:url value="/uploadDoc"/>',
              dataType: 'json',
              done: function (e, data) {
                     var fileUrl = data['result']['data'][0]['fileUrl'];
                     var fileName = data['result']['data'][0]['fileName'];
                     $('#uploadedFile').html('<li>'+fileName+'</li>');
                     $('#inputDoc').val(fileUrl);
              }
          });
      });
      
      function loadContractProducts() {
          $.get(
              '<idp:url value="/sale/contractProducts"/>?contractId=${contract.id}',
              {},
              function(json){
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var data = result.data;
                      var html = template('productTblTmpl', {prodlist: data});
                      $('#prodTbl tbody').html(html);
                  }
              }
          );
      }
      
      function loadContractAudits() {
          $.get(
              '<idp:url value="/sale/contractAudits"/>?contractId=${contract.id}',
              {},
              function(json){
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var data = result.data;
                      var html = template('auditTblTmpl', {ccalist: data});
                      $('#auditTbl tbody').html(html);
                  }
              }
          );
      }
      
      function loadContractDocs() {
          $.get(
              '<idp:url value="/sale/contractDocs"/>?contractId=${contract.id}',
              {},
              function(json){
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var data = result.data;
                      var html = template('docTblTmpl', {doclist: data});
                      $('#docTbl tbody').html(html);
                  }
              }
          );
      }
      
      function populateNonFinalEvaPanel() {
          var html = template('nonFinalEvaTmpl' ,{});
          $('#finalEvaBody').html(html);
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
                      $('#productModal').modal('show');
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
      
      function changePublishState() {
          var publishState = $('#inputPublishState').val();
          if(publishState == '0') {
              $('#publishYearLabel').show();
              $('#publishYearDiv').show();
              $('#finishYearLabel').hide();
              $('#finishYearDiv').hide();
              $('#pressDiv').show();
          }else{
              $('#publishYearLabel').hide();
              $('#publishYearDiv').hide();
              $('#finishYearLabel').show();
              $('#finishYearDiv').show();
              $('#pressDiv').hide();
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
      
      function auditContract(name) {
          $('#auditModal').modal('show');
      }
      
      function closeAuditModal() {
          clearAuditModal();
          $('#auditModal').modal('hide');
      }
      
      function clearAuditModal() {
          $('#auditProductName').text('');
      }
      
      function passContract(contractId) {
          var remark = $('#auditText').val();
          $.post(
              '<idp:url value="/copyright/passContract"/>',
              {
                  id: contractId,
                  'remark': remark
              },
              function(data) {
                  alert('审核结果保存成功');
                  closeAuditModal();
                  window.location.reload();
              }
          );
      }
      
      function rejectContract(contractId) {
          $.post(
              '<idp:url value="/copyright/rejectContract"/>',
              {
                  id: contractId,
                  'remark': remark
              },
              function(data) {
                  alert('审核结果保存成功');
                  closeAuditModal();
                  window.location.reload();
              }
          );
      }
      
      function generateDoc(contractId) {
          $.post(
              '<idp:url value="/copyright/generateDoc"/>',
              {
                  id: contractId
              },
              function(data) {
                  alert('生成成功');
                  window.location.reload();
              }
          );
      }
      
      function toLawyer(contractId) {
          var r = window.confirm('确定提交法务审核吗?');
          if(!r) {
              return;
          } 
          
          $.post(
              '<idp:url value="/copyright/toLawyer"/>',
              {
                  id: contractId
              },
              function(data) {
                  alert('提交成功');
                  window.location.reload();
              }
          );
      }
      
      function popUploadContractDoc(contractId) {
          clearDocModal();
          $('#docModal').modal('show');
      }
      
      function popUploadFinishContractDoc(contractId) {
          clearDocModal();
          $('#finishedDoc').val('1');
          $('#docModal').modal('show');
      }
      
      function closeDocModal() {
          clearDocModal();
          $('#docModal').modal('hide');
      }
      
      function clearDocModal() {
          $('#finishedDoc').val('0');
          $('#version1')[0].selectedIndex = 0;
          $('#version2')[0].selectedIndex = 0;
          $('#inputFile').val('');
          $('#inputDoc').val('');
          $('#uploadedFile').empty();
      }
      
      function uploadContractDoc(contractId) {
          var fileUrl = $('#inputDoc').val();
          var type = $('#docType').val();
          var version = $('#version1').val() + "." + $('#version2').val();
          
          $.post(
              '<idp:url value="/sale/uploadContractDoc"/>',
              {
                  "id": contractId,
                  "fileUrl": fileUrl,
                  "version": version,
                  "type": type
              },
              function(json) {
                  alert('保存成功');
                  window.location.reload();
              }
          );
      }
      
      function deleteProduct(name) {
          var r = confirm("您真的要删除作品[" + name + "]吗？");
          if(r) {
              $.post(
                  '<idp:url value="/evaluation/product/"/>${product.id}',
                  {'_method': "delete"},
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('删除成功');
                          window.close();
                      }
                  }
              );
          }
      }
      
      function finishEvaluation() {
          var r = confirm("评价完成以后将不能修改评价信息，并将自动流转到版权入理模块，您确定吗？");
          var productLevel = $('input[name=productEva]:checked').val();
          var authorLevel = $('input[name=authorEva]:checked').val();
          var storyLevel = $('input[name=storyLevel]:checked').val();
          var makeAudioEdit = $('input[name=makeAudioEdit]:checked').val();
          var onlyWebCast = $('#onlyWebCast').prop('checked');
          if(onlyWebCast) {
              onlyWebCast = '1';
          }else{
              onlyWebCast = '0';
          }
          var hotSubject = $('#hotSubject').prop('checked');
          if(hotSubject) {
              hotSubject = '1';
          }else{
              hotSubject = '0';
          }
          var refPrice = $('#pricePanel').text();
          
          alert(authorLevel);
          
          if(r) {
              $.post(
                  '<idp:url value="/evaluation/finishEvaluation"/>',
                  {
                      'productId': '${product.id}',
                      'productLevel': productLevel,
                      'authorLevel': authorLevel,
                      'storyValue': storyLevel,
                      'makeValue': makeAudioEdit,
                      'onlyWebCast': onlyWebCast,
                      'hotSubject': hotSubject,
                      'refPrice': refPrice
                  },
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('保存成功');
                          window.location.reload();
                      }
                  }
              );
          }
      }
      
      function finishContract() {
          var r = confirm("合同完成后将不能修改，您确定吗？");
          if(r) {
              $.post(
                  '<idp:url value="/sale/finishContract"/>',
                  {
                      'contractId': '${contract.id}'
                  },
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('操作成功');
                          window.location.reload();
                      }
                  }
              );
          }
      }
    </script>
  </body>
</html>