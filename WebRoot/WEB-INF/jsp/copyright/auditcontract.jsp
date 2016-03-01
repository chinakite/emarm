<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>悦库时光音频资源管理系统 | 版权管理 - 合同审批</title>
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
          <h1>合同审批
            <small>需要我审批的版权合同。</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href='<idp:url value="/home"/>'><i class="fa fa-home"></i> 首页</a></li>
            <li><i class="fa fa-book"></i> 版权管理</li>
            <li class="active">合同审批</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">合同列表</h3>
                </div><!-- /.box-header -->
                <div>
                    <form class="form-horizontal">
                      <div class="box-body">
                        <div class="form-group col-sm-4">
                          <label for="inputSearchCode" class="col-sm-3 control-label">合同编号</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputSearchCode" placeholder="合同编号">
                          </div>
                        </div>
                        <div class="form-group col-sm-4">
                          <label for="inputSearchOwner" class="col-sm-3 control-label">甲方</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputSearchOwner" placeholder="甲方关键字">
                          </div>
                        </div>
                        <div class="form-group col-sm-4">
                          <label for="inputSearchAudithState" class="col-sm-3 control-label">审批状态</label>
                          <div class="col-sm-9">
                            <select id="inputSearchAudithState" class="form-control">
                                <option value="-1">全部</option>
                                <option value="1">待主管审批</option>
                                <option value="2">待经理审批</option>
                                <option value="3">待总经理审批</option>
                                <option value="4">业务审批完成</option>
                                <option value="5">待法务审批</option>
                                <option value="6">待法务确认</option>
                                <option value="100">已完成</option>
                            </select>
                          </div>
                        </div>
                      </div><!-- /.box-body -->
                      <div style="text-align: center;">
                          <button type="button" class="btn btn-emarm pull-center" onclick="searchProducts();"><i class="fa fa-search"></i>&nbsp;查询</button>
                          <button type="button" class="btn btn-default pull-center" style="margin-left: 20px;" onclick="resetSearch();"><i class="fa fa-rotate-left"></i>&nbsp;重置</button>
                      </div>
                    </form>
                </div>
                <div class="tblToolbar">
                    <button class="btn btn-default ml10" onclick="batchDeleteAuthors();"><i class="fa fa-plus"></i>&nbsp;新建合同</button>
                </div>
                <div class="box-body">
                  <table id="productTbl" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th width="1" style="padding-right:8px;"><input type="checkbox" onclick="checkAll(this);"/></th>
                        <th>合同编号</th>
                        <th>甲方</th>
                        <th>乙方联系人</th>
                        <th>版权</th>
                        <th>版权类型</th>
                        <th>版权范围</th>
                        <th>版权期限</th>
                        <th>审批状态</th>
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
    
    <div id="contractModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">新建版权合同</h4>
          </div>
          <div class="modal-body">
              <form class="form-horizontal">
                  <input type="hidden" id="inputContractId"/>
                  <input type="hidden" id="contractProductIds"/>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputTotalPrice" class="col-md-2 control-label">总价</label>
                          <div class="col-md-10">
                              <div class=" input-group">
                                  <input type="text" class="form-control" id="inputTotalPrice" placeholder="总价">
                                  <span class="input-group-addon">元</span>
                              </div>
                              <div class="feedback-tip">
                                <label class="control-label" for="inputTotalPrice"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label class="col-md-2 control-label">单价</label>
                          <div class="col-md-10">
                              <table id="contractProductTbl" class="w100p">
                                  <tr>
                                      <td width="50%">庆余年</td>
                                      <td><div class="input-group w100p"><input type="text" class="form-control" id="inputPrice_1"/><span class="input-group-addon">元</span></div></td>
                                  </tr>
                              </table>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputOwner" class="col-md-2 control-label">甲方</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputOwner" placeholder="授权方">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputOwner"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputOwnerContact" class="col-md-2 control-label">联系人</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputOwnerContact" placeholder="授权方联系人">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputOwnerContact"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputOwnerContactPhone" class="col-md-2 control-label">联系电话</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputOwnerContactPhone" placeholder="授权方联系电话">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputOwnerContactPhone"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputOwnerContactAddress" class="col-md-2 control-label">联系地址</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputOwnerContactAddress" placeholder="授权方联系地址">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputOwnerContactAddress"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputOwnerContactEmail" class="col-md-2 control-label">电子邮箱</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputOwnerContactEmail" placeholder="授权方电子邮箱">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputOwnerContactEmail"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
                  <hr/>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputBuyer" class="col-md-2 control-label">乙方</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputBuyer" placeholder="被授权方">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputBuyer"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputBuyerContact" class="col-md-2 control-label">联系人</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputBuyerContact" placeholder="被授权方联系人">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputBuyerContact"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputBuyerContactPhone" class="col-md-2 control-label">联系电话</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputBuyerContactPhone" placeholder="被授权方联系电话">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputBuyerContactPhone"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputBuyerContactAddress" class="col-md-2 control-label">联系地址</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputBuyerContactAddress" placeholder="被授权方联系地址">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputBuyerContactAddress"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputBuyerContactEmail" class="col-md-2 control-label">电子邮箱</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputBuyerContactEmail" placeholder="被授权方电子邮箱">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputBuyerContactEmail"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
                  <hr/>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label class="col-md-2 control-label">授权种类</label>
                          <div class="col-md-10">
                              <div class="col-md-4 checkbox">
                                  <label for="audioEditPrg"><input id="audioEditPrg" name="inputPrivileges" type="checkbox" value="01" checked/>音频改编权</label>
                              </div>
                              <div class="col-md-4 checkbox">
                                  <label for="broadcastPrg"><input id="broadcastPrg" name="inputPrivileges" type="checkbox" value="02"/>广播权</label>
                              </div>
                              <div class="col-md-4 checkbox">
                                  <label for="netcastPrg"><input id="netcastPrg" name="inputPrivileges" type="checkbox" value="03"/>信息网络传播权</label>
                              </div>
                              <div class="col-md-4 checkbox">
                                  <label for="grantPrg"><input id="grantPrg" name="inputPrivileges" type="checkbox" value="04"/>再许可授权</label>
                              </div>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputPrivilegeType" class="col-md-2 control-label">授权方式</label>
                          <div class="col-md-10">
                              <select id="inputPrivilegeType" class="form-control">
                                  <option value="0">专有许可使用</option>
                                  <option value="1">非专有许可使用</option>
                              </select>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputPrivilegeRange" class="col-md-2 control-label">授权范围</label>
                          <div class="col-md-10">
                              <select id="inputPrivilegeRange" class="form-control">
                                  <option value="0">中国大陆地区</option>
                                  <option value="1">中国大陆及港澳台地区</option>
                                  <option value="2">全球</option>
                              </select>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputPrivilegeDeadline" class="col-md-2 control-label">授权期限</label>
                          <div class="col-md-4">
                              <select id="inputPrivilegeDeadline" class="form-control">
                                  <option value="1">一年</option>
                                  <option value="2">二年</option>
                                  <option value="3">三年</option>
                                  <option value="4">四年</option>
                                  <option value="5">五年</option>
                                  <option value="6">六年</option>
                                  <option value="7">七年</option>
                                  <option value="8">八年</option>
                                  <option value="9">九年</option>
                                  <option value="10">十年</option>
                              </select>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputBankAccountName" class="col-md-2 control-label">账户名称</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputBankAccountName" placeholder="收款方账户名称">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputBankAccountName"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputBank" class="col-md-2 control-label">开户银行</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputBank" placeholder="收款方开户银行">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputBank"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputAccountNo" class="col-md-2 control-label">账号</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputAccountNo" placeholder="收款账号">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputAccountNo"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
              </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearProductModal();">关闭</button>
            <button type="button" class="btn btn-primary" onclick="submitCopyrightContract();">确定</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <div id="auditModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">作品审核</h4>
          </div>
          <div class="modal-body">
              <p>待审核作品：<span id="auditProductName"></span></p>
              <form class="form-horizontal">
                  <input type="hidden" id="auditProductId"/>
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
            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="rejectProduct();">不通过</button>
            <button type="button" class="btn btn-emarm" onclick="passProduct();">通过</button>
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
    
    <script id="contractProdTblTmpl" type="text/html">
        {{each prodlist as prod idx}}
           <tr>
              <td width="50%">{{prod.name}}</td>
              <td><div class="input-group w100p"><input type="text" class="form-control" id="inputPrice_{{prod.id}}" rel="{{prod.id}}"/><span class="input-group-addon">元</span></div></td>
          </tr>
        {{/each}}
    </script>
    
    <!-- page script -->
    <script>
      var table;
    
      $(document).ready(function(){
          $('#menu_copyright').addClass('active');
          $('#menu_cc_contract').addClass('active');
          $('#menu_cc_auditcontract').addClass('active');
      
          initContractTbl();
          //loadUsers();
      });
      
      function loadUsers() {
          $.get(
              '<idp:url value="/system/users"/>?status=1',
              {},
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var users = result.data;
                      var html = template('userSelectorTmpl', {"userlist" : users});
                      $('#inviteEvaluator').empty().append(html);
                  }
              
                  $("#inviteEvaluator").select2();
              }
          )
      }
      
      function initContractTbl() {
          table = $('#productTbl').DataTable({
              "processing": true,
              "paging": true,
              "lengthChange": false,
              "searching": false,
              "ordering": false,
              "info": true,
              "autoWidth": false,
              "serverSide": true,
              "ajax": '<idp:url value="/copyright/dtAuditContracts"/>',
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
                {},
                {},
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
                        return '<input type="checkbox" value="' + full.id + '" class="tblRowCheckbox"/>';
                      }
                  },
                  {
                      "targets": [1],
                      "render": function(data, type, full) {
                          return full.code;
                      }
                  },
                  {
                      "targets": [2],
                      "render": function(data, type, full) {
                          if(full.owner) {
                              return full.owner;
                          }else{
                              return '';
                          }
                      }
                  },
                  {
                      "targets": [3],
                      "render": function(data, type, full) {
                          return full.buyerContact;
                      }
                  },
                  {
                      "targets": [4],
                      "render": function(data, type, full) {
                          return full.privilegesText.replace(/,/g, '<br/>');
                      }
                  },
                  {
                      "targets": [5],
                      "render": function(data, type, full) {
                          return full.privilegeTypeText;
                      }
                  },
                  {
                      "targets": [6],
                      "render": function(data, type, full) {
                          return full.privilegeRangeText;
                      }
                  },
                  {
                      "targets": [7],
                      "render": function(data, type, full) {
                          return full.privilegeDeadline + "年";
                      }
                  },
                  {
                      "targets": [8],
                      "render": function(data, type, full) {
                          return full.auditStateText;
                      }
                  },
                  {
                      "targets": [9],
                      "render": function(data, type, full) {
                          var html = '<a href=\'<idp:url value="/copyright/contractDetail"/>?id=' + full.id + '\' target="_blank">查看</a> ';
                              
                          if(full.state == '4') {
                              html += '<span class="small">|</span> ';
                              html += '<a onclick="popContractModal(\'' + full.id + '\');">新建合同</a>';
                          }
                          
                          return html;
                      }
                  }
              ]
          });
      }
      
      function submitProduct(submit) {
          var r = false;
          if(submit == '0') {
              r = validateName();
          }else{
              r = validateName()
                    && validateAuthorName()
                    && validateWordCount();
          }
      
          if(!r) {
              return ;
          }else{
              var name = $('#inputName').val();
              var authorName = $('#inputAuthorName').val();
              var authorPseudonym = $('#inputAuthorPseudonym').val();
              var wordCount = $('#inputWordCount').val();
              var subject = $('#inputSubject').val();
              var publishState = $('#inputPublishState').val();
              var publishYear = $('#inputPublishYear').val();
              var press = $('#inputPress').val();
              var finishYear = $('#inputFinishYear').val();
              var website = $('#inputWebsite').val();
              var summary = $('#inputSummary').val();
              var hasAudio = $('input[name=hasAudio]:checked').val();
              var audioCopyright = $('#inputAudioCopyright').val();
              var audioDesc = $('#inputAudioDesc').val();
              var samples = $('#inputSamples').val();
              
              $.post(
                  '<idp:url value="/evaluation/product"/>',
                  {
                      'name': name,
                      'authorName': authorName,
                      'authorPseudonym': authorPseudonym,
                      'wordCount': wordCount,
                      'subject': subject,
                      'publishState': publishState,
                      'publishYear': publishYear,
                      'press': press,
                      'finishYear': finishYear,
                      'website': website,
                      'summary': summary,
                      'hasAudio': hasAudio,
                      'audioCopyright': audioCopyright,
                      'audioDesc': audioDesc,
                      'samples': samples,
                      'submit': submit
                  },
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('保存成功');
                          clearProductModal();
                          $('#productModal').modal('hide');
                          table.ajax().reload();
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
      
      function clearProductModal() {
          $('#inputName').val('');
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
      
      //--------------- 新建合同 ---------------------
      function popContractModal(id) {
          $.get(
              '<idp:url value="/evaluation/product"/>/'+id,
              {},
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      clearContractModal();
                      var prod = result.data;
                      $('#contractProductIds').val(id);
                      
                      var prodTblHtml = template('contractProdTblTmpl', {'prodlist': [prod]});
                      $('#contractProductTbl').html(prodTblHtml);
                      $('#inputOwner').val(prod.author.name);
                      $('#inputBuyer').val('北京悦库时光文化传媒有限公司');
                      
                      $('#contractModal').modal('show');
                  }
              }
          );
      }
      
      function clearContractModal(){
          $('#contractProductTbl').empty();
      }
      
      function submitCopyrightContract() {
          var contractId = $('#inputContractId').val();
          var totalPrice = $('#inputTotalPrice').val();
          
          var priceEles = $('input[id^=inputPrice_]');
          var idarr = [];
          var pricearr = [];
          for(var i=0; i<priceEles.length; i++) {
              var ele = priceEles[i];
              var prodId = $(ele).attr('rel');
              idarr.push(prodId);
              pricearr.push($(ele).val());
          }
          var contractProductIds = idarr.join(',');
          var prices = pricearr.join(',');
          
          var owner = $('#inputOwner').val();
          var ownerContact = $('#inputOwnerContact').val();
          var ownerContactPhone = $('#inputOwnerContactPhone').val();
          var ownerContactAddress = $('#inputOwnerContactAddress').val();
          var ownerContactEmail = $('#inputOwnerContactEmail').val();
          
          var buyer = $('#inputBuyer').val();
          var buyerContact = $('#inputBuyerContact').val();
          var buyerContactPhone = $('#inputBuyerContactPhone').val();
          var buyerContactAddress = $('#inputBuyerContactAddress').val();
          var buyerContactEmail = $('#inputBuyerContactEmail').val();
          
          var checkPrivgs = $('input[name=inputPrivileges]:checked');
          var privgArr = [];
          for(var j=0; j<checkPrivgs.length; j++) {
              privgArr.push($(checkPrivgs[j]).val());
          }
          var privileges = privgArr.join(',');
          var privilegeType = $('#inputPrivilegeType').val();
          var privilegeRange = $('#inputPrivilegeRange').val();
          var privilegeDeadline = $('#inputPrivilegeDeadline').val();
          
          var bankAccountName = $('#inputBankAccountName').val();
          var bankAccountNo = $('#inputBankAccountNo').val();
          var bank = $('#inputBank').val();
          
          $.post(
              '<idp:url value="/copyright/copyrightContract"/>',
              {
                  'contractId': contractId,
                  'totalPrice': totalPrice,
                  'contractProductIds' : contractProductIds,
                  'prices': prices,
                  'owner': owner,
                  'ownerContact': ownerContact,
                  'ownerContactPhone': ownerContactPhone,
                  'ownerContactAddress': ownerContactAddress,
                  'ownerContactEmail': ownerContactEmail,
                  'buyer': buyer,
                  'buyerContact': buyerContact,
                  'buyerContactPhone': buyerContactPhone,
                  'buyerContactAddress': buyerContactAddress,
                  'buyerContactEmail': buyerContactEmail,
                  'privileges': privileges,
                  'privilegeType': privilegeType,
                  'privilegeRange': privilegeRange,
                  'privilegeDeadline': privilegeDeadline,
                  'bankAccountName': bankAccountName,
                  'bankAccountNo': bankAccountName,
                  'bank': bank,
                  'submit': 1
              },
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      alert('保存成功');
                  }else{
                      alert('保存失败，请重试或联系管理员');
                  }
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
    </script>
  </body>
</html>