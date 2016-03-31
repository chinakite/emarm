<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数字音频版权云平台 | 评价管理</title>
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
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">作品列表</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <form class="form-horizontal">
                    <div class="col-sm-12">
                      <div class="col-sm-4">
                        <div class="form-group">
                          <label for="inputSearchProductName" class="col-xs-3 control-label">作品名称</label>
                          <div class="col-xs-9">
                            <input type="text" class="form-control" id="inputSearchProductName" placeholder="作品名称关键字">
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4">
                        <div class="form-group">
                          <label for="inputSearchAuthorName" class="col-xs-3 control-label">作者姓名</label>
                          <div class="col-xs-9">
                            <input type="text" class="form-control" id="inputSearchAuthorName" placeholder="作者姓名">
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4">
                        <div class="form-group">
                          <label for="inputSearchIsbn" class="col-xs-3 control-label">ISBN号</label>
                          <div class="col-xs-9">
                            <input type="text" class="form-control" id="inputSearchIsbn" placeholder="ISBN号">
                          </div>
                        </div>
                      </div>
                    </div>  
                    <div class="col-sm-12">
                      <div class="col-sm-4">
                        <div class="form-group">
                          <label for="inputSearchSubject" class="col-xs-3 control-label">作品题材</label>
                          <div class="col-xs-9">
                            <select id="inputSearchSubject" class="form-control">
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4">  
                        <div class="form-group">
                          <label for="inputSearchPublishState" class="col-xs-3 control-label">出版状态</label>
                          <div class="col-xs-9">
                            <select id="inputSearchPublishState" class="form-control">
                                <option value="-1">全部</option>
                                <option value="0">已出版</option>
                                <option value="1">网络签约</option>
                                <option value="2">网络未签约</option>
                                <option value="3">未公开</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4">  
                        <div class="form-group">
                          <label for="inputSearchState" class="col-xs-3 control-label">作品状态</label>
                          <div class="col-xs-9">
                            <select id="inputSearchState" class="form-control">
                                <option value="-1">全部</option>
                                <option value="1">待审核</option>
                                <option value="101">审核不过</option>
                                <option value="2">待评价</option>
                                <option value="3">已评价</option>
                                <option value="4">评价完成</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div><!-- /.box-body -->
                    <div style="text-align: center;">
                          <button type="button" class="btn btn-emarm pull-center" onclick="searchProducts();"><i class="fa fa-search"></i>&nbsp;查询</button>
                          <button type="button" class="btn btn-default pull-center" style="margin-left: 20px;" onclick="resetSearch();"><i class="fa fa-rotate-left"></i>&nbsp;重置</button>
                    </div>
                  </form>
                </div>
                <!--
                <div class="tblToolbar">
                    <button class="btn btn-default" data-toggle="modal" data-target="#productModal"><i class="fa fa-plus"></i>&nbsp;新建</button>
                    <button class="btn btn-default ml10" onclick="batchDeleteAuthors();"><i class="fa fa-remove"></i>&nbsp;删除</button>
                </div>
                -->
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
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
      <%@ include file="../footer.jsp"%>
    </div><!-- ./wrapper -->

    <div id="productModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">新建作品</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal">
                <input id="inputId" type="hidden"/>
                <div class="clearfix">
                    <div class="col-xs-12">
                      <div class="form-group required">
                          <label for="inputName" class="col-xs-2 control-label">名称</label>
                          <div class="col-xs-10">
                              <input type="text" class="form-control" id="inputName" placeholder="名称" onblur="validateName();">
                              <div class="feedback-tip">
                                <label for="inputName"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div>
                    </div>
                </div>
                <div class="clearfix">
                    <div class="col-xs-6">
                      <div class="form-group required">
                          <label for="inputAuthorName" class="col-xs-4 control-label">作者</label>
                          <div class="col-xs-8">
                              <input type="text" class="form-control" id="inputAuthorName" placeholder="作者" onblur="validateAuthorName();">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputAuthorName"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div>
                    </div>  
                    <div class="col-xs-6">
                      <div class="form-group">
                          <label for="inputAuthorPseudonym" class="col-xs-4 control-label">作者笔名</label>
                          <div class="col-xs-8">
                              <input type="text" class="form-control" id="inputAuthorPseudonym" placeholder="作者笔名">
                          </div>
                      </div>
                    </div>
                </div>
                <div class="clearfix">
                    <div class="col-xs-6">
                        <div class="form-group required">
                          <label for="inputWordCount" class="col-xs-4 control-label">字数</label>
                          <div class="col-xs-8">
                              <input type="text" class="form-control" id="inputWordCount" placeholder="单位：万字" onblur="validateWordCount();">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputWordCount"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="form-group required">
                          <label for="inputSubject" class="col-xs-4 control-label">作品题材</label>
                          <div class="col-xs-8">
                              <select id="inputSubject" class="form-control">
                                  <option value="1">穿越</option>
                              </select>
                          </div>
                        </div>
                    </div>    
                </div>
                <div class="clearfix">
                    <div class="col-xs-6">
                        <div class="form-group required">
                          <label for="inputPublishState" class="col-xs-4 control-label">出版状态</label>
                          <div class="col-xs-8">
                              <select id="inputPublishState" class="form-control" onchange="changePublishState();">
                                  <option value="0">已出版</option>
                                  <option value="1">网络签约</option>
                                  <option value="2">网络未签约</option>
                                  <option value="3">未公开</option>
                              </select>
                          </div>
                        </div>
                    </div>
                    <div id="publishYearDiv" class="col-xs-6">
                        <div class="form-group required">
                          <label id="publishYearLabel" for="inputPublishYear" class="col-xs-4 control-label">出版年份</label>
                          <div class="col-xs-8">
                              <select id="inputPublishYear" class="form-control">
                                  <option value="2016">2016</option>
                                  <option value="2015">2015</option>
                                  <option value="2014">2014</option>
                                  <option value="2013">2013</option>
                                  <option value="2013">2012</option>
                                  <option value="2013">2011</option>
                                  <option value="2013">2010</option>
                                  <option value="2013">2009</option>
                                  <option value="2013">2008</option>
                                  <option value="2013">2007</option>
                                  <option value="2013">2006</option>
                                  <option value="2013">2005</option>
                                  <option value="2013">2004</option>
                                  <option value="2013">2003</option>
                                  <option value="2013">2002</option>
                                  <option value="2013">2001</option>
                                  <option value="2013">2000</option>
                                  <option value="2013">1999</option>
                                  <option value="2013">1998</option>
                                  <option value="2013">1997</option>
                                  <option value="2013">1996</option>
                                  <option value="2013">1995</option>
                                  <option value="2013">1994</option>
                                  <option value="2013">1993</option>
                                  <option value="2013">1992</option>
                                  <option value="2013">1991</option>
                                  <option value="2013">1990</option>
                              </select>
                          </div>
                        </div>
                    </div>
                    <div id="finishYearDiv" class="col-xs-6" style="display:none;">
                        <div class="form-group required">
                          <label for="inputFinishYear" class="col-xs-4 control-label">完结年份</label>
                          <div class="col-xs-8">
                              <select id="inputFinishYear" class="form-control">
                                  <option value="2016">2016</option>
                                  <option value="2015">2015</option>
                                  <option value="2014">2014</option>
                                  <option value="2013">2013</option>
                                  <option value="2013">2012</option>
                                  <option value="2013">2011</option>
                                  <option value="2013">2010</option>
                                  <option value="2013">2009</option>
                                  <option value="2013">2008</option>
                                  <option value="2013">2007</option>
                                  <option value="2013">2006</option>
                                  <option value="2013">2005</option>
                                  <option value="2013">2004</option>
                                  <option value="2013">2003</option>
                                  <option value="2013">2002</option>
                                  <option value="2013">2001</option>
                                  <option value="2013">2000</option>
                                  <option value="2013">1999</option>
                                  <option value="2013">1998</option>
                                  <option value="2013">1997</option>
                                  <option value="2013">1996</option>
                                  <option value="2013">1995</option>
                                  <option value="2013">1994</option>
                                  <option value="2013">1993</option>
                                  <option value="2013">1992</option>
                                  <option value="2013">1991</option>
                                  <option value="2013">1990</option>
                              </select>
                          </div>
                        </div>
                    </div>
                </div>
                <div id="pressDiv" class="clearfix">
                    <div class="col-xs-12">
                        <div class="form-group required">
                          <label for="inputPress" class="col-xs-2 control-label">出版社</label>
                          <div class="col-xs-10">
                              <input type="text" class="form-control" id="inputPress" placeholder="出版社" onblur="validatePress();">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputPress"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                        </div>
                    </div>
                </div>
                <div id="isbnDiv" class="clearfix">
                    <div id="isbnDiv" class="col-xs-12">
                        <div class="form-group required">
                          <label for="inputIsbn" class="col-xs-2 control-label">ISBN</label>
                          <div class="col-xs-10">
                              <input type="text" class="form-control" id="inputIsbn" placeholder="ISBN号" onblur="validateIsbn();">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputIsbn"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                        </div>
                    </div>
                </div>
                <div id="websiteDiv" class="clearfix" style="display: none;">
                    <div class="col-xs-12">
                        <div class="form-group required">
                          <label for="inputWebsite" class="col-xs-2 control-label">签约网站</label>
                          <div class="col-xs-10">
                              <input type="text" class="form-control" id="inputWebsite" placeholder="签约网站" onblur="validateWebsite();">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputWebsite"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                        </div>
                    </div>    
                </div>
                <div class="clearfix">
                    <div class="col-xs-12">
                        <div class="form-group required">
                          <label for="inputSummary" class="col-xs-2 control-label">内容简介</label>
                          <div class="col-xs-10">
                              <textarea id="inputSummary" class="form-control" rows="4" placeholder="内容简介 ..."></textarea>
                              <div class="feedback-tip">
                                <label class="control-label" for="inputSummary"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix">
                    <div class="col-xs-12">
                        <div class="form-group required">
                          <label for="inputFile" class="col-xs-2 control-label">样章</label>
                          <div id="samplesUploadDiv" class="col-xs-10">
                              <input  id="importFile" name="importFile" type="file" class="form-control"/>
                              <input id="inputSamples" type="hidden"/>
                              <ul id="uploadedFile"></ul>
                          </div>
                          <div id="samplesShowDiv" class="col-xs-10 checkbox" style="display:none;">
                              <a href='#' class="label bg-gray">下载</a>
                          </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix">
                    <div class="col-xs-12">
                        <div class="form-group required">
                          <label for="inputHasAudio" class="col-xs-2 control-label">网络音频</label>
                          <div class="col-xs-10">
                              <div class="col-xs-2 radio">
                                  <label for="hasAudio"><input id="hasAudio" name="hasAudio" type="radio" value="1" onclick="hasAudioClick();"/>有</label>
                              </div>
                              <div class="col-xs-2 radio">
                                  <label for="noAudio"><input id="noAudio" name="hasAudio" type="radio" value="0" checked onclick="noAudioClick();"/>无</label>
                              </div>
                          </div>
                        </div>
                    </div>
                </div>
                <div id="audioCopyrightDiv" class="clearfix" style="display: none;">
                    <div class="col-xs-12">
                        <div class="form-group">
                          <label for="inputAudioCopyright" class="col-xs-2 control-label">音频情况</label>
                          <div class="col-xs-10">
                              <select id="inputAudioCopyright" class="form-control">
                                  <option value="1">有正规授权</option>
                                  <option value="1">无正规授权</option>
                              </select>
                          </div>
                        </div>
                    </div>
                </div>
                <div id="audioDescDiv" class="clearfix" style="display: none;">
                    <div class="col-xs-12">
                        <div class="form-group required">
                          <label for="inputAudioDesc" class="col-sm-2 control-label">音频备注</label>
                          <div class="col-sm-10">
                              <textarea id="inputAudioDesc" class="form-control" rows="2" placeholder="音频备注 ..."></textarea>
                          </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="sampleUrls">
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearProductModal();">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="submitProduct('2');">保存</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
    <div id="evaluationModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">邀请评价</h4>
          </div>
          <div class="modal-body">
              <p>待评价作品：<span id="evaluateProductName"></span></p>
              <form class="form-horizontal">
                  <input type="hidden" id="evaluateProductId"/>
                  <div class="col-md-12">
                  <div class="form-group">
                    <label>选择评价人</label>
                    <select id="inviteEvaluator" class="form-control select2" multiple="multiple" data-placeholder="选择评价人" style="width: 100%;">
                    </select>
                  </div><!-- /.form-group -->
                  </div>
              </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearProductModal();">关闭</button>
            <button type="button" class="btn btn-primary" onclick="submitEvaluate();">确定</button>
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
          $('#menu_evaluation').addClass('active');
          $('#menu_eva_prodmgr').addClass('active');
      
          $('#importFile').fileupload({
              url: '<idp:url value="/uploadDoc"/>',
              dataType: 'json',
              done: function (e, data) {
                     var fileUrl = data['result']['data'][0]['fileUrl'];
                     var fileName = data['result']['data'][0]['fileName'];
                     $('#uploadedFile').append('<li>'+fileName+'</li>');
                     $('#inputSamples').val(fileUrl);
              }
          });
      
          initProductTbl();
          loadUsers();
          loadCategories();
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
                      $('#inputSearchSubject').empty()
                                              .append('<option value="-1">全部</option>')
                                              .append(html);
                  }
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
              "ajax": {url: '<idp:url value="/evaluation/dtProducts"/>',
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
                          <c:if test="${fn:indexOf(sessionScope.__SESSION__USER__.role, '03') > -1}">    
                              html += '<span class="small">|</span> ';
                              html += '<a onclick="popEditModal(\'' + full.id + '\');">编辑</a>';
                          </c:if>    
                          if(full.state == '1'){
                              html += ' <span class="small">|</span> ';
                              html += '<a onclick="popAuditProduct(\'' + full.id + '\',\'' + full.name + '\');">审核</a>';
                          }else if(full.state == '2'){
                              html += '<span class="small">|</span> ';
                              html += '<a onclick="popEvaluationModal(\'' + full.id + '\',\'' + full.name + '\');">邀请评价</a>';
                          }else if(full.state == '3'){
                              html += '<span class="small">|</span> ';
                              html += '<a onclick="popEvaluationModal(\'' + full.id + '\',\'' + full.name + '\');">邀请评价</a>';
                          }else if(full.state == '4'){
                              
                          }
                          
                          if(full.state == '0' || full.state == '1') {
                              html += ' <span class="small">|</span> <a onclick="deleteProduct(\'' + full.id + '\', \'' + full.name + '\');">删除</a>';
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
      
      function resetSearch() {
          $('#inputSearchProductName').val('');
          $('#inputSearchAuthorName').val('');
          $('#inputSearchIsbn').val('');
          $('#inputSearchSubject')[0].selectedIndex = 0;
          $('#inputSearchPublishState')[0].selectedIndex = 0;
          $('#inputSearchState')[0].selectedIndex = 0;
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
              var id = $('#inputId').val();
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
              var isbn = $('#inputIsbn').val();
              
              $.post(
                  '<idp:url value="/evaluation/product"/>',
                  {
                      'id': id,
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
                      'submit': submit,
                      'isbn': isbn
                  },
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('保存成功');
                          clearProductModal();
                          $('#productModal').modal('hide');
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
      
      function clearProductModal() {
          $('#inputId').val('');
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
                  var result = IDEA.parseJSON(json);
                  if(result.type = 'success') {
                      alert('发送成功.');
                  }else{
                      alert('发送失败，请联系管理员.');
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
                      if(prod.samples && prod.samples.length > 0) {
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