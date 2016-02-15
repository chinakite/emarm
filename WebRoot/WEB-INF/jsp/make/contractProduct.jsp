<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>悦库时光音频资源管理系统 | 制作合同</title>
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
          <h1>评价管理
            <small>所有作品的评价信息。</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href='<idp:url value="/home"/>'><i class="fa fa-home"></i> 首页</a></li>
            <li class="active">评价管理</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">作品列表</h3>
                </div><!-- /.box-header -->
                <div>
                    <form class="form-horizontal">
                      <div class="box-body">
                        <div class="form-group col-sm-4">
                          <label for="inputSearchProductName" class="col-sm-3 control-label">作品名称</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputSearchProductName" placeholder="作品名称关键字">
                          </div>
                        </div>
                        <div class="form-group col-sm-4">
                          <label for="inputSearchAuthorName" class="col-sm-3 control-label">作者姓名</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputSearchAuthorName" placeholder="作者姓名">
                          </div>
                        </div>
                        <div class="form-group col-sm-4">
                          <label for="inputSearchIsbn" class="col-sm-3 control-label">ISBN号</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputSearchIsbn" placeholder="ISBN号">
                          </div>
                        </div>
                        <div class="form-group col-sm-4">
                          <label for="inputSearchSubject" class="col-sm-3 control-label">作品题材</label>
                          <div class="col-sm-9">
                            <select id="inputSearchSubject" class="form-control">
                            </select>
                          </div>
                        </div>
                        <div class="form-group col-sm-4">
                          <label for="inputSearchPublishState" class="col-sm-3 control-label">出版状态</label>
                          <div class="col-sm-9">
                            <select id="inputSearchPublishState" class="form-control">
                                <option value="-1">全部</option>
                                <option value="0">已出版</option>
                                <option value="1">网络签约</option>
                                <option value="2">网络未签约</option>
                                <option value="3">未公开</option>
                            </select>
                          </div>
                        </div>
                        <div class="form-group col-sm-4">
                          <label for="inputSearchState" class="col-sm-3 control-label">作品状态</label>
                          <div class="col-sm-9">
                            <select id="inputSearchState" class="form-control">
                                <option value="-1">全部</option>
                                <option value="0">草稿</option>
                                <option value="1">待审核</option>
                                <option value="101">审核不过</option>
                                <option value="2">待评价</option>
                                <option value="3">已评价</option>
                                <option value="4">评价完成</option>
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
                <div class="box-body">
                  <table id="productTbl" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th width="1" style="padding-right:8px;"><input type="checkbox" onclick="checkAll(this);"/></th>
                        <th>名称</th>
                        <th>作者</th>
                        <th>出版状态</th>
                        <th>出版/完结时间</th>
                        <th>题材</th>
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

    <div id="contractModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">新建制作合同</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal">
                <input id="inputProductId" type="hidden"/>
                <div class="col-md-12">
                    <div class="form-group required">
                      <label for="inputTargetType" class="col-sm-2 control-label">合同类型</label>
                      <div class="col-sm-4">
                          <select id="inputTargetType" class="form-control">
                              <option value="0">对私</option>
                              <option value="1">对公</option>
                          </select>
                      </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group required">
                      <label for="inputMaker" class="col-sm-2 control-label">制作团队</label>
                      <div class="col-sm-10">
                          <select id="inputMaker" class="form-control">
                          </select>
                      </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group required">
                      <label for="inputOwner" class="col-md-2 control-label">甲方</label>
                      <div class="col-md-10">
                          <input type="text" class="form-control" id="inputOwner" placeholder="委托方">
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
                          <input type="text" class="form-control" id="inputOwnerContactEmail">
                          <div class="feedback-tip">
                            <label class="control-label" for="inputOwnerContactEmail"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                          </div>
                      </div>
                    </div><!-- /.form-group -->
                </div>
                <hr/>
                <div class="col-md-12">
                    <div class="form-group required">
                      <label for="inputWorker" class="col-md-2 control-label">乙方</label>
                      <div class="col-md-10">
                          <input type="text" class="form-control" id="inputWorker" placeholder="演播人">
                          <div class="feedback-tip">
                            <label class="control-label" for="inputWorker"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                          </div>
                      </div>
                    </div><!-- /.form-group -->
                </div>
                <div class="col-md-12">
                    <div class="form-group required">
                      <label for="inputWorkerContact" class="col-md-2 control-label">联系人</label>
                      <div class="col-md-10">
                          <input type="text" class="form-control" id="inputWorkerContact">
                          <div class="feedback-tip">
                            <label class="control-label" for="inputWorkerContact"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                          </div>
                      </div>
                    </div><!-- /.form-group -->
                </div>
                <div class="col-md-12">
                    <div class="form-group required">
                      <label for="inputWorkerContactPhone" class="col-md-2 control-label">联系电话</label>
                      <div class="col-md-10">
                          <input type="text" class="form-control" id="inputWorkerContactPhone">
                          <div class="feedback-tip">
                            <label class="control-label" for="inputWorkerContactPhone"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                          </div>
                      </div>
                    </div><!-- /.form-group -->
                </div>
                <div class="col-md-12">
                    <div class="form-group required">
                      <label for="inputWorkerContactAddress" class="col-md-2 control-label">联系地址</label>
                      <div class="col-md-10">
                          <input type="text" class="form-control" id="inputWorkerContactAddress" placeholder="被授权方联系地址">
                          <div class="feedback-tip">
                            <label class="control-label" for="inputWorkerContactAddress"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                          </div>
                      </div>
                    </div><!-- /.form-group -->
                </div>
                <div class="col-md-12">
                    <div class="form-group required">
                      <label for="inputWorkerContactEmail" class="col-md-2 control-label">电子邮箱</label>
                      <div class="col-md-10">
                          <input type="text" class="form-control" id="inputWorkerContactEmail" placeholder="被授权方电子邮箱">
                          <div class="feedback-tip">
                            <label class="control-label" for="inputWorkerContactEmail"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                          </div>
                      </div>
                    </div><!-- /.form-group -->
                </div>
                <div class="col-md-12">
                    <div class="form-group required">
                      <label for="inputTotalSection" class="col-md-2 control-label">总集数</label>
                      <div class="col-md-10">
                          <div class=" input-group">
                              <span class="input-group-addon">共</span>
                              <input type="text" class="form-control" id="inputTotalSection" placeholder="总集数">
                              <span class="input-group-addon">集</span>
                          </div>
                          <div class="feedback-tip">
                            <label class="control-label" for="inputTotalSection"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                          </div>
                      </div>
                    </div><!-- /.form-group -->
                </div>
                <div class="col-md-12">
                    <div class="form-group required">
                      <label for="inputPrice" class="col-md-2 control-label">单价</label>
                      <div class="col-md-10">
                          <div class=" input-group">
                              <input type="text" class="form-control" id="inputPrice" placeholder="单价">
                              <span class="input-group-addon">元</span>
                          </div>
                          <div class="feedback-tip">
                            <label class="control-label" for="inputPrice"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                          </div>
                      </div>
                    </div><!-- /.form-group -->
                </div>
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
                      <label for="inputPenalty" class="col-md-2 control-label">违约金</label>
                      <div class="col-md-10">
                          <div class=" input-group">
                              <input type="text" class="form-control" id="inputPenalty" placeholder="违约金比例">
                              <span class="input-group-addon">%</span>
                          </div>
                          <div class="feedback-tip">
                            <label class="control-label" for="inputPenalty"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                          </div>
                      </div>
                    </div><!-- /.form-group -->
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
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearContractModal();">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="submitMakeContract();">保存</button>
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
      
          initProductTbl();
          loadExtMakers();
          loadCategories();
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
      
      function initProductTbl() {
          table = $('#productTbl').DataTable({
              "processing": true,
              "paging": true,
              "lengthChange": false,
              "searching": false,
              "ordering": false,
              "info": true,
              "autoWidth": false,
              "serverSide": true,
              "ajax": {url: '<idp:url value="/make/dtProducts"/>',
                  "data": function(d) {
                      var productName = $('#inputSearchProductName').val();
                      if(productName && $.trim(productName).length > 0) {
                          d.productName = productName;
                      }
                      var authorName = $('#inputSearchAuthorName').val();
                      if(authorName && $.trim(authorName).length > 0) {
                          d.authorName = authorName;
                      }
                      var isbn = $('#inputSearchIsbn').val();
                      if(isbn && $.trim(isbn).length > 0) {
                          d.isbn = isbn;
                      }
                      var subject = $('#inputSearchSubject').val();
                      if(subject && $.trim(subject).length > 0) {
                          d.subject = subject;
                      }
                      var publishState = $('#inputSearchPublishState').val();
                      if(publishState && $.trim(publishState).length > 0) {
                          d.publishState = publishState;
                      }
                      var state = $('#inputSearchState').val();
                      if(state && $.trim(state).length > 0) {
                          d.state = state;
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
                          return full.name;
                      }
                  },
                  {
                      "targets": [2],
                      "render": function(data, type, full) {
                          if(full.author) {
                              return full.author.name;
                          }else{
                              return '';
                          }
                      }
                  },
                  {
                      "targets": [3],
                      "render": function(data, type, full) {
                          return full.publishStateText;
                      }
                  },
                  {
                      "targets": [4],
                      "render": function(data, type, full) {
                          if(full.publishYear) {
                              return full.publishYear;
                          }else if(full.finishYear){
                              return full.finishYear;
                          }else{
                              return '';
                          }
                      }
                  },
                  {
                      "targets": [5],
                      "render": function(data, type, full) {
                          if(full.subject)
                              return full.subject.name;
                          else
                              return '';
                      }
                  },
                  {
                      "targets": [6],
                      "render": function(data, type, full) {
                          return full.stateText;
                      }
                  },
                  {
                      "targets": [7],
                      "render": function(data, type, full) {
                          var role = '${sessionScope.__SESSION__USER__.role}';
                      
                          var html = '<a href=\'<idp:url value="/evaluation/productDetail"/>?id=' + full.id + '\' target="_blank">查看</a> ';
                              
                          if(full.state == '10'){
                              html += ' <span class="small">|</span> ';
                              html += '<a onclick="popContractModal(\'' + full.id + '\');">创建合同</a>';
                          }else if(full.state == '11' || full.state == '12' || full.state == '13' || full.state == '14'){
                              html += ' <span class="small">|</span> ';
                              html += '<a href=\'<idp:url value="/make/contractDetail"/>?productId=' + full.id +'\' target="_blank">查看合同</a>';
                          }
                          
                          return html;
                      }
                  }
              ]
          });
      }
      
      function searchProducts() {
          table.ajax.reload();
      }
      
      function popContractModal(productId) {
          $('#inputProductId').val(productId);
          $('#contractModal').modal('show');
      }
      
      function submitMakeContract() {
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
              var targetType = $('#inputTargetType').val();
              
              var owner = $('#inputOwner').val();
              var ownerContact = $('#inputOwnerContact').val();
              var ownerContactPhone = $('#inputOwnerContactPhone').val();
              var ownerContactAddress = $('#inputOwnerContactAddress').val();
              var ownerContactEmail = $('#inputOwnerContactEmail').val();
              
              var worker = $('#inputWorker').val();
              var workerContact = $('#inputWorkerContact').val();
              var workerContactPhone = $('#inputWorkerContactPhone').val();
              var workerContactAddress = $('#inputWorkerContactAddress').val();
              var workerContactEmail = $('#inputWorkerContactEmail').val();
          
              var totalPrice = $('#inputTotalPrice').val();
              var price = $('#inputPrice').val();
              var totalSection = $('#inputTotalSection').val();
              var penalty = $('#inputPenalty').val();
              
              var bankAccountName = $('#inputBankAccountName').val();
              var bankAccountNo = $('#inputBankAccountNo').val();
              var bank = $('#inputBank').val();
              
              $.post(
                  '<idp:url value="/make/makeContract"/>',
                  {
                      'productId': productId,
                      'makerId': makerId,
                      'targetType': targetType,
                      'totalPrice': totalPrice,
                      'price': price,
                      'totalSection': totalSection,
                      'penalty': penalty,
                      'owner': owner,
                      'ownerContact': ownerContact,
                      'ownerContactPhone': ownerContactPhone,
                      'ownerContactAddress': ownerContactAddress,
                      'ownerContactEmail': ownerContactEmail,
                      'worker': worker,
                      'workerContact': workerContact,
                      'workerContactPhone': workerContactPhone,
                      'workerContactAddress': workerContactAddress,
                      'workerContactEmail': workerContactEmail,
                      'bankAccountName': bankAccountName,
                      'bankAccountNo': bankAccountName,
                      'bank': bank
                  },
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('保存成功');
                          clearContractModal();
                          $('#contractModal').modal('hide');
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
      
      function clearContractModal() {
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