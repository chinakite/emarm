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
    <!-- Theme style -->
    <link rel="stylesheet" href='<idp:url value="/css/AdminLTE.min.css"/>'>
    
    <link rel="stylesheet" href='<idp:url value="/css/emarm.css"/>'>
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href='<idp:url value="/css/skins/_all-skins.min.css"/>'>

    <!-- DataTables -->
    <link rel="stylesheet" href='<idp:url value="/plugins/datatables/dataTables.bootstrap.css"/>'>

    <link rel="stylesheet" href='<idp:url value="/css/skins/skin-emarm.css"/>'>

    <!-- Select2 -->
    <link rel="stylesheet" href='<idp:url value="/plugins/select2/select2.min.css"/>'>
    

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
            <h1 class="detailTitle col-xs-6">${product.name}</h1>
            <c:if test="${product.state == '0' || fn:indexOf(sessionScope.__SESSION__USER__.role, '99') != '-1' || fn:indexOf(sessionScope.__SESSION__USER__.role, '02') != '-1' || fn:indexOf(sessionScope.__SESSION__USER__.role, '03') != '-1'}">
                <button class="btn btn-default pull-right ml10" onclick="deleteProduct('${product.name}');"><i class="fa fa-remove"></i> 删除</button>
                <button class="btn btn-default pull-right ml10" onclick="popEditModal('${product.id}');"><i class="fa fa-edit"></i> 编辑</button>
            </c:if>
            <c:if test="${(product.state == '2' || product.state == '3') && fn:indexOf(sessionScope.__SESSION__USER__.role, '03') != '-1'}">
                <button class="btn btn-default pull-right ml10" onclick="popEvaluationModal('${product.id}', '${product.name}');"><i class="fa fa-tag"></i> 邀请评价</button>
            </c:if>
            <c:if test="${product.state == '1' && (fn:indexOf(sessionScope.__SESSION__USER__.role, '02') != '-1' || fn:indexOf(sessionScope.__SESSION__USER__.role, '03') != '-1')}">
                <button class="btn btn-default pull-right ml10" onclick="popAuditProduct('${product.name}');"><i class="fa fa-star-half-empty"></i> 内容审核</button>
            </c:if>
            <c:if test="${product.state == '8' && fn:indexOf(sessionScope.__SESSION__USER__.role, '80') != '-1'}">
                <button class="btn btn-default pull-right ml10" onclick="popAuditProduct('${product.name}');"><i class="fa fa-star-half-empty"></i> 权属审核</button>
            </c:if>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box box-widget">
                  <div class="box-body">
                      <div class="row">
                          <div class="col-xs-2">
                              <c:if test="${product.logoUrl != null}">
                                  <img width="136" src='<idp:ctx/>${product.logoUrl}'/>
                              </c:if>
                              <c:if test="${product.logoUrl == null}">
                                  <img width="136" src='<idp:url value="/img/default_product_logo.jpg"/>'/>
                              </c:if>
                          </div>
                          <div class="col-xs-10">
                              <p class="col-xs-12">作品简介：</p>
                              <p class="col-xs-12 productSummary">${product.summary}</p>
                              <p class="col-xs-5 detailInfo-light">作者：${product.author.name}</p>
                              <p class="col-xs-7 detailInfo-light">作者笔名：${product.author.pseudonym}</p>
                              <p class="col-xs-5 detailInfo-light">题材：${product.subject.name}</p>
                              <p class="col-xs-7 detailInfo-light">字数：${product.wordCount}&nbsp;万字</p>
                              <p class="col-xs-5 detailInfo-light">出版状态：${product.publishStateText}</p>
                              <c:if test="${product.publishState == '0'}">
                              <p class="col-xs-7 detailInfo-light">出版年份：${product.publishYear}</p>
                              </c:if>
                              <c:if test="${product.publishState != '0'}">
                              <p class="col-xs-7 detailInfo-light">完结年份：${product.finishYear}</p>
                              </c:if>
                              <p class="col-xs-5 detailInfo-light">ISBN：${product.isbn}</p>
                              <div class="col-xs-12 detailInfo-light">
                                  <span>样章：</span><a href='<idp:url value=""/>${product.samples[0].fileUrl}' class="label bg-gray">下载</a>
                              </div>
                          </div>
                      </div>
                      <div class="row mt30">
                          <div class="col-xs-12">
                          <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                              <li class="active"><a href="#evaluationInfo" data-toggle="tab">评价信息</a></li>
                              <li><a href="#copyrightInfo" data-toggle="tab">版权信息</a></li>
                              <c:if test="${fn:indexOf(sessionScope.__SESSION__USER__.role, '99') > -1 || fn:indexOf(sessionScope.__SESSION__USER__.role, '03') > -1}">
                              <li><a href="#makeInfo" data-toggle="tab">制作信息</a></li>
                              <li><a href="#settings" data-toggle="tab">运营信息</a></li>
                              <li><a href="#gallery" data-toggle="tab">相册</a></li>
                              </c:if>
                            </ul>
                            <div class="tab-content">
                              <div class="active tab-pane" id="evaluationInfo">
                                <table class="table table-bordered">
                                   <thead>
                                       <tr id="evaTblHeader" style="background-color: #f4f4f4;">
                                           <th class="text-center" width="150" style="font-weight:normal;">评价人</th>
                                       </tr>    
                                   </thead>
                                   <tbody>
                                       <tr id="evaTblStory">
                                           <td width="150" style="vertical-align: middle;"><p class="text-center">内容评价</p></td>
                                       </tr>
                                       <tr id="evaTblMake">
                                           <td width="150" style="vertical-align: middle;"><p class="text-center">制作评价</p></td>
                                       </tr>
                                   </tbody>
                                </table>
                                <div class="box box-default">
                                    <div class="box-header with-border">
                                      <h3 class="box-title">评价汇总</h3>
                                      <p class="pull-right">参考价：<span id="pricePanel" class="text-red" style="font-weight: bold; font-size: 24px;">0</span>.00元</p>
                                    </div>
                                    <div id="finalEvaBody" class="box-body">
                                          
                                    </div>
                                </div>
                              </div><!-- /.tab-pane -->
                              <div class="tab-pane" id="copyrightInfo">
                                  <h5>权属文件<c:if test="${product.state == '0' || product.state == '1'}"><button class="btn btn-default pull-right ml10" onclick="popUploadCopyrightFile();"><i class="fa fa-upload"></i> 上传权属文件</button></c:if></h5>
                                  <table id="copyrightFileTbl" class="table table-bordered table-hover">
                                      <thead>
                                          <tr>
                                              <th>文件名</th>
                                              <th>创建时间</th>
                                              <th></th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                      
                                      </tbody>
                                  </table>  
                                  <hr/>
                                  <h5>版权合同</h5>
                                  <table id="copyrightTbl" class="table table-bordered table-hover">
                                      <thead>
                                          <tr>
                                              <th>合同编号</th>
                                              <th>甲方</th>
                                              <th>乙方联系人</th>
                                              <th>创建时间</th>
                                              <th></th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                      
                                      </tbody>
                                  </table>  
                              </div><!-- /.tab-pane -->
            
                              <div class="tab-pane" id="makeInfo">
                                  <h5>制作任务</h5>
                                  <table id="makeTaskTbl" class="table table-bordered table-hover">
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
                                      <tbody>
                                      
                                      </tbody>
                                  </table>
                                  <hr/>
                                  <h5>制作合同</h5>
                                  <table id="makeContractTbl" class="table table-bordered table-hover">
                                      <thead>
                                          <tr>
                                              <th>合同编号</th>
                                              <th>甲方</th>
                                              <th>乙方联系人</th>
                                              <th>创建时间</th>
                                              <th></th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                      
                                      </tbody>
                                  </table>  
                              </div><!-- /.tab-pane -->
                              <div class="tab-pane" id="gallery">
                                       
                              </div><!-- /.tab-pane -->
                            </div><!-- /.tab-content -->
                          </div><!-- /.nav-tabs-custom -->
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
                      <div class="prodTip" style="display:none;">
                          <h5>名称相似作品</h5>
                          <ul id="prodList" class="list-group">
                             
                          </ul>
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
                                <label for="inputAuthorName"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
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
                                <label for="inputWordCount"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
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
                                <label for="inputPress"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
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
                                <label for="inputIsbn"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
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
                              <textarea id="inputSummary" class="form-control" rows="4" placeholder="内容简介 ..." onblur="validateSummary();"></textarea>
                              <div class="feedback-tip">
                                <label for="inputSummary"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
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
                        <div class="form-group required">
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
                              <textarea id="inputAudioDesc" class="form-control" rows="2" placeholder="音频备注 ..." onblur="validateAudioDesc();"></textarea>
                              <div class="feedback-tip">
                                <label for="inputAudioDesc"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="sampleUrls">
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearProductModal();">关闭</button>
            <button type="button" class="btn btn-success" onclick="submitProduct('0');">暂存</button>
            <button type="button" class="btn btn-emarm" onclick="submitProduct('1');">提交审核</button>
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
              <input type="hidden" id="auditProductId" value="${product.id}"/>
              
              <p>待审核作品：<span id="auditProductName"></span></p>
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
            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="rejectProduct('${product.id}');">不通过</button>
            <button type="button" class="btn btn-emarm" onclick="passProduct('${product.id}');">通过</button>
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
    
    <div id="copyrightFileModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">上传权属文件</h4>
          </div>
          <div class="modal-body">
              <form class="form-horizontal">
                  <input id="finishedDoc" type="hidden" value="0"/>
                  <div class="col-xs-12">
                      <div class="form-group required">
                          <label for="inputFile" class="col-xs-2 control-label">合同文件</label>
                          <div id="docUploadDiv" class="col-xs-10">
                              <input id="importCopyrightFile" name="importFile" type="file" class="form-control"/>
                              <ul id="uploadedCopyrightFile"></ul>
                              <input type="hidden" id="inputCopyrightFile"/>
                          </div>
                      </div>
                  </div>
              </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeCopyrightFileModal();">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="uploadCopyrightFile();">确定</button>
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
    
    <script src='<idp:url value="/plugins/fileupload/jquery.ui.widget.js"/>'></script>
    <script src='<idp:url value="/plugins/fileupload/jquery.fileupload.js"/>'></script>
    <script src='<idp:url value="/plugins/fileupload/jquery.iframe-transport.js"/>'></script>
    
    <script src='<idp:url value="/js/ideajs.js"/>'></script>
    <script src='<idp:url value="/js/template.js"/>'></script>
    
    <script id="evaHeaderTmpl" type="text/html">
        <th class="text-center" style="font-weight:normal;">{{evaluation.user.name}}</th>
    </script>
    
    <script id="nonEvaHeaderTmpl" type="text/html">
        <th class="text-center" style="font-weight:normal;"></th>
    </script>
    
    <script id="evaStoryTmpl" type="text/html">
        <td>
           <div class="evaItem">
              <p class="evaItemTitle pull-left txt-indent">情节架构</p>
              {{if evaluation.storyFrame > 2}}
              <i class="fa fa-star text-yellow"></i>
              {{else}}
              <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if evaluation.storyFrame > 3}}
              <i class="fa fa-star text-yellow"></i>
              {{else}}
              <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if evaluation.storyFrame > 4}}
              <i class="fa fa-star text-yellow"></i>
              {{else}}
              <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if evaluation.storyFrame > 4}}
              <span class="evaItemText">优秀</span>
              {{else if evaluation.storyFrame > 3}}
              <span class="evaItemText">良好</span>
              {{else if evaluation.storyFrame > 2}}
              <span class="evaItemText">一般</span>
              {{else}}
              <span class="evaItemText">比较差</span>
              {{/if}}
           </div>
           <div class="evaItem">
              <p class="evaItemTitle pull-left txt-indent">文字水平</p>
              {{if evaluation.storyText > 2}}
              <i class="fa fa-star text-yellow"></i>
              {{else}}
              <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if evaluation.storyText > 3}}
              <i class="fa fa-star text-yellow"></i>
              {{else}}
              <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if evaluation.storyText > 4}}
              <i class="fa fa-star text-yellow"></i>
              {{else}}
              <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if evaluation.storyText > 4}}
              <span class="evaItemText">优秀</span>
              {{else if evaluation.storyText > 3}}
              <span class="evaItemText">良好</span>
              {{else if evaluation.storyText > 2}}
              <span class="evaItemText">一般</span>
              {{else}}
              <span class="evaItemText">比较差</span>
              {{/if}}
           </div>
           <div class="evaItem">
              <p class="evaItemTitle pull-left txt-indent">人物塑造</p>
              {{if evaluation.storyRole > 2}}
              <i class="fa fa-star text-yellow"></i>
              {{else}}
              <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if evaluation.storyRole > 3}}
              <i class="fa fa-star text-yellow"></i>
              {{else}}
              <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if evaluation.storyRole > 4}}
              <i class="fa fa-star text-yellow"></i>
              {{else}}
              <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if evaluation.storyRole > 4}}
              <span class="evaItemText">优秀</span>
              {{else if evaluation.storyRole > 3}}
              <span class="evaItemText">良好</span>
              {{else if evaluation.storyRole > 2}}
              <span class="evaItemText">一般</span>
              {{else}}
              <span class="evaItemText">比较差</span>
              {{/if}}
           </div>
           <div class="evaItem">
              <p class="evaItemTitle pull-left txt-indent">受众人群</p>
              <span class="evaItemText">{{evaluation.storyTarget}}</span>
           </div>
           <div class="evaItem">
              <p class="evaItemTitle pull-left txt-indent">其他意见</p>
              <span class="evaItemText">{{evaluation.storySuggest}}</span>
           </div>
       </td>
    </script>
    
    <!-- template -->
    <script id="userSelectorTmpl" type="text/html">
        {{each userlist as user idx}}
           <option value="{{user.id}}">{{user.name}}({{user.email}})</option>
        {{/each}}
    </script>
    
    <script id="nonEvaStoryTmpl" type="text/html">
       <td>暂时没有评价</td>
    </script>
    
    <script id="evaMakeTmpl" type="text/html">
       <td>
           <div class="evaItem">
              <span class="evaItemTitle">音频改编难度</span>
              {{if evaluation.makeAudioEdit > 2}}
              <span class="evaItemText">难</span>
              {{else if evaluation.makeAudioEdit > 1}}
              <span class="evaItemText">一般</span>
              {{else}}
              <span class="evaItemText">容易</span>
              {{/if}}
           </div>
           <div class="evaItem">
              <span class="evaItemTitle">播讲形式建议</span>
              {{if evaluation.playType.indexOf('1') > -1}}
              <span class="evaItemText">男声</span>
              {{/if}}
              {{if evaluation.playType.indexOf('2') > -1}}
              <span class="evaItemText">女声</span>
              {{/if}}
              {{if evaluation.playType.indexOf('3') > -1}}
              <span class="evaItemText">单播</span>
              {{/if}}
              {{if evaluation.playType.indexOf('4') > -1}}
              <span class="evaItemText">对播</span>
              {{/if}}
              {{if evaluation.playType.indexOf('5') > -1}}
              <span class="evaItemText">广播剧</span>
              {{/if}}
              {{if evaluation.playType.indexOf('6') > -1}}
              <span class="evaItemText">小说剧</span>
              {{/if}}
              {{if evaluation.playType.indexOf('7') > -1}}
              <span class="evaItemText">适合电台播出</span>
              {{/if}}
              {{if evaluation.playType.indexOf('8') > -1}}
              <span class="evaItemText">适合网络播出</span>
              {{/if}}
           </div>
           <div class="evaItem">
              <span class="evaItemTitle">演员风格建议</span>
              {{if evaluation.playStyle.indexOf('1') > -1}}
              <span class="evaItemText">甜美</span>
              {{/if}}
              {{if evaluation.playStyle.indexOf('2') > -1}}
              <span class="evaItemText">阳光</span>
              {{/if}}
              {{if evaluation.playStyle.indexOf('3') > -1}}
              <span class="evaItemText">温暖</span>
              {{/if}}
              {{if evaluation.playStyle.indexOf('4') > -1}}
              <span class="evaItemText">文艺</span>
              {{/if}}
              {{if evaluation.playStyle.indexOf('5') > -1}}
              <span class="evaItemText">厚重</span>
              {{/if}}
              {{if evaluation.playStyle.indexOf('6') > -1}}
              <span class="evaItemText">{{evaluation.otherStyle}}</span>
              {{/if}}
           </div>
           <div class="evaItem">
              <p class="evaItemTitle pull-left txt-indent">其他意见</p>
              <span class="evaItemText">{{evaluation.makeSuggest}}</span>
           </div>
       </td>
    </script>
    
    <script id="nonEvaMakeTmpl" type="text/html">
       <td>暂时没有评价</td>
    </script>
    
    <script id="nonFinalEvaTmpl" type="text/html">
        <form class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label">作品评价</label>
            <div class="col-sm-10 checkbox">
              <label for="famousProduct" ><input type="radio" id="famousProduct" name="productEva" value="1" onclick="calPrice();"/> 知名作品</label>
              <label for="normalProduct" ><input type="radio" id="normalProduct" name="productEva" checked value="0" onclick="calPrice();"/> 普通作品</label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">作家评价</label>
            <div class="col-sm-10 checkbox">
              <label for="topAuthor" ><input type="radio" id="topAuthor" name="authorEva" value="2" onclick="calPrice();"/> 名牌/热门作家</label>
              <label for="famousAuthor" ><input type="radio" id="famousAuthor" name="authorEva" value="1" onclick="calPrice();"/> 知名作家</label>
              <label for="normalAuthor" ><input type="radio" id="normalAuthor" name="authorEva" checked value="0" onclick="calPrice();"/> 普通作家</label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">内容评价</label>
            <div class="col-sm-10 checkbox">
              <label for="storyPerfect" ><input type="radio" id="storyPerfect" name="storyLevel" value="3" onclick="calPrice();"/> 优秀</label>
              <label for="storyGood" ><input type="radio" id="storyGood" name="storyLevel" value="2" checked onclick="calPrice();"/> 良好</label>
              <label for="storyNormal" ><input type="radio" id="storyNormal" name="storyLevel" value="1" onclick="calPrice();"/> 一般</label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">制作难度</label>
            <div class="col-sm-10 checkbox">
              <label for="makeHard" ><input type="radio" id="makeHard" name="makeAudioEdit" value="3" onclick="calPrice();"/> 难</label>
              <label for="makeNormal" ><input type="radio" id="makeNormal" name="makeAudioEdit" value="2" checked onclick="calPrice();"/> 一般</label>
              <label for="makeEasy" ><input type="radio" id="makeEasy" name="makeAudioEdit" value="1" onclick="calPrice();"/> 容易</label>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-10 checkbox">
              <label for="onlyWebCast" ><input type="checkbox" id="onlyWebCast" name="onlyWebCast" onclick="calPrice();"/> 只适合网络播出</label>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-10 checkbox">
              <label for="hotSubject" ><input type="checkbox" id="hotSubject" name="hotSubject" onclick="calPrice();"/> 热门题材</label>
            </div>
          </div>
          <div class="form-group text-center">
            <button type="button" class="btn btn-emarm" onclick="finishEvaluation();">评价完成</button>
          </div>
        </form>
    </script>
    
    <script id="finalEvaTmpl" type="text/html">
        <form class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label">作品评价</label>
            <div class="col-sm-10 checkbox">
              <span>{{if fe.productLevel == 1}}知名作品{{else}}普通作品{{/if}}</span>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">作家评价</label>
            <div class="col-sm-10 checkbox">
              <span>{{if fe.authorLevel == 2}}热门作家{{else if fe.authorLevel == 1}}知名作家{{else}}普通作家{{/if}}</span>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">内容评价</label>
            <div class="col-sm-10 checkbox">
              {{if fe.storyValue > 0}}
                  <i class="fa fa-star text-yellow"></i>
              {{else}}
                  <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if fe.storyValue > 1}}
                  <i class="fa fa-star text-yellow"></i>
              {{else}}
                  <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if fe.storyValue > 2}}
                  <i class="fa fa-star text-yellow"></i>
              {{else}}
                  <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if fe.storyValue > 2}}
              <span>优秀</span>
              {{else if fe.storyValue > 1}}
              <span>良好</span>
              {{else}}
              <span>一般</span>
              {{/if}}
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">制作难度</label>
            <div class="col-sm-10 checkbox">
              {{if fe.storyValue > 0}}
                  <i class="fa fa-star text-yellow"></i>
              {{else}}
                  <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if fe.storyValue > 1}}
                  <i class="fa fa-star text-yellow"></i>
              {{else}}
                  <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if fe.storyValue > 2}}
                  <i class="fa fa-star text-yellow"></i>
              {{else}}
                  <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if fe.storyValue > 2}}
              <span>难</span>
              {{else if fe.storyValue > 1}}
              <span>一般</span>
              {{else}}
              <span>容易</span>
              {{/if}}
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-10 checkbox">
              <label for="onlyWebCast" ><input type="checkbox" id="onlyWebCast" name="onlyWebCast" disabled {{if fe.onlyWebCast == '1'}}checked{{/if}}/> 只适合网络播出</label>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-10 checkbox">
              <label for="hotSubject" ><input type="checkbox" id="hotSubject" name="hotSubject" disabled {{if fe.hotSubject == '1'}}checked{{/if}}/> 热门题材</label>
            </div>
          </div>
        </form>
    </script>
    
    <script id="nonCopyrightTmpl" type="text/html">
        <tr>
            <td colspan="5">目前没有版权合同。</td>
        </tr>
    </script>
    
    <script id="copyrightTmpl" type="text/html">
        {{each cclist as cc idx}}
        <tr>
            <td>{{cc.code}}</td>
            <td>{{cc.owner}}</td>
            <td>{{cc.buyerContact}}</td>
            <td>{{cc.createTime}}</td>
            <td><a>查看</a></td>
        </tr>
        {{/each}}
    </script>
    
    <script id="nonCopyrightFileTmpl" type="text/html">
        <tr>
            <td colspan="3">目前没有权属文件。</td>
        </tr>
    </script>
    
    <script id="copyrightFileTmpl" type="text/html">
        {{each cflist as cf idx}}
        <tr>
            <td>{{cf.name}}</td>
            <td>{{cf.createTime}}</td>
            <td><a href="<idp:ctx/>{{cf.fileUrl}}">下载</a><c:if test="${product.state == '0' || product.state == '1'}"><span class="small"> | </span><a href="javascript:void(0);" onclick="deleteCopyrightFile('{{cf.id}}')">删除</a></c:if></td>
        </tr>
        {{/each}}
    </script>
    
    <script id="nonMakeTaskTmpl" type="text/html">
        <tr>
            <td colspan="7">目前没有制作任务。</td>
        </tr>
    </script>
    
    <script id="makeTaskTmpl" type="text/html">
        {{each tasklist as task idx}}
        <tr>
            <td>{{task.maker.name}}</td>
            <td>{{if task.contract}}{{task.contract.code}}{{/if}}</td>
            <td>{{task.timePerSection}} 分钟</td>
            <td>{{task.showTypeText}}</td>
            <td>{{task.makeTime}} 天</td>
            <td>{{task.stateText}}</td>
            <td><a>查看</a></td>
        </tr>
        {{/each}}
    </script>
    
    <script id="nonMakeContractTmpl" type="text/html">
        <tr>
            <td colspan="7">目前没有制作合同。</td>
        </tr>
    </script>
    
    <script id="makeContractTmpl" type="text/html">
        {{each mclist as mc idx}}
        <tr>
            <td>{{task.maker.name}}</td>
            <td>{{task.contract.code}}</td>
            <td>{{task.timePerSection}} 分钟</td>
            <td>{{task.showTypeText}}</td>
            <td>{{task.makeTime}} 天</td>
            <td>{{task.stateText}}</td>
            <td><a>查看</a></td>
        </tr>
        {{/each}}
    </script>
    
    <!-- template -->
    <script id="categoryTmpl" type="text/html">
        {{each cglist as cg idx}}
           <option value="{{cg.id}}" title="{{cg.desc}}">{{cg.name}}</option>
        {{/each}}
    </script>
    
    <!-- page script -->
    <script>
      var table;
    
      $(document).ready(function(){
          loadEvaluations();
          loadCopyrightFiles();
          loadUsers();
          loadCategories();
          //loadCopyrightContracts();
          //loadMakeTasks();
          //loadMakeContracts();
          
          var state = '${product.state}';
          if(state == 4) {
              loadFinalEvaludation();
          }else{
              <c:choose>
              <c:when test="${fn:indexOf(sessionScope.__SESSION__USER__.role, '03') > -1}">
              populateNonFinalEvaPanel();
              calPrice();
              </c:when>
              <c:otherwise>
              $('#finalEvaBody').html("尚未完成评价。");
              </c:otherwise>
              </c:choose>
          }
          
          $('#importCopyrightFile').fileupload({
              url: '<idp:url value="/uploadDoc"/>',
              dataType: 'json',
              done: function (e, data) {
                     var fileUrl = data['result']['data'][0]['fileUrl'];
                     var fileName = data['result']['data'][0]['fileName'];
                     $('#uploadedCopyrightFile').html('<li>'+fileName+'</li>');
                     $('#inputCopyrightFile').val(fileUrl);
              }
          });
          
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
      
      function loadFinalEvaludation() {
          $.get(
              '<idp:url value="/evaluation/finalEvaluation"/>?productId=${product.id}',
              {},
              function(json){
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var data = result.data;
                      var html = template('finalEvaTmpl', {fe: data});
                      $('#finalEvaBody').html(html);
                      
                      $('#pricePanel').text(data.refPrice);
                  }
              }
          );
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
      
      function populateNonFinalEvaPanel() {
          var html = template('nonFinalEvaTmpl' ,{});
          $('#finalEvaBody').html(html);
      }
      
      function calPrice() {
          var productEva = $('input[name=productEva]:checked').val();
          var authorEva = $('input[name=authorEva]:checked').val();
          var makeAudioEdit = $('input[name=makeAudioEdit]:checked').val();
          var storyLevel = $('input[name=storyLevel]:checked').val();
          var onlyWeb = $('#onlyWebCast').prop('checked');
          var ishot = $('#hotSubject').prop('checked');
          
          var basePrice = 0;
          var wordCount = ${product.wordCount};
          var publishYear = '${product.publishYear}';
          if(publishYear == '') {
              publishYear = '${product.finishYear}';
          }

          if(productEva == 0 && authorEva == 0) {
              if(storyLevel == 1) {
                  basePrice = 1000;
              }else if(storyLevel == 2) {
                  basePrice = 1500;
              }else if(storyLevel == 3) {
                  basePrice = 2000;
              }
              
              basePrice = basePrice * (wordCount / 10);
              
              if(basePrice > 5000) {
                  basePrice = 5000;
              }
          }else if(authorEva > 0){
              if(ishot) {
                  basePrice = 20000;
              }else{
                  if(authorEva == 2) {
                      basePrice = 10000;
                  }else{
                      if(productEva == 1) {
                          basePrice = 8000;
                      }else{
                          basePrice = 6000;
                      }
                  } 
              }
              
              if(wordCount > 10) {
                  basePrice = basePrice * 1.2;
              }else if(wordCount < 1) {
                  basePrice = basePrice * 0.8;
              }else{
                  basePrice = basePrice * 1;
              }
          }
          
          var priceRabio = 1;
          var curDate = new Date();
          var curYear = curDate.getFullYear();
          if(curYear - publishYear <=2 ) {
              priceRabio = priceRabio + 0.2;
          }else if(curYear - publishYear > 4){
              priceRabio = priceRabio - 0.2;
          }
          
          if(makeAudioEdit == 3) {
              priceRabio = priceRabio - 0.2;
          }else if(makeAudioEdit == 1) {
              priceRabio = priceRabio + 0.2;
          }else{
              priceRabio = priceRabio + 0;
          }
          
          if(onlyWeb) {
              priceRabio = priceRabio - 0.2;
          }
          
          var price = basePrice * priceRabio;
          $('#pricePanel').text(price);
      }
      
      function loadEvaluations() {
          $.get(
              '<idp:url value="/evaluation/"/>${product.id}/evaluations',
              {},
              function(json){
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var evaluations = result.data;
                      if(evaluations.length == 0) {
                          var headerHtml = template('nonEvaHeaderTmpl', {"evaluation": null});
                          var storyHtml = template('nonEvaStoryTmpl', {"evaluation": null});
                          var makeHtml = template('nonEvaMakeTmpl', {"evaluation": null});
                      
                          $('#evaTblHeader').append(headerHtml);
                          $('#evaTblStory').append(storyHtml);
                          $('#evaTblMake').append(makeHtml);
                      }else{
                          for(var i=0; i<evaluations.length; i++) {
                              var eva = evaluations[i];
                              var headerHtml = template('evaHeaderTmpl', {"evaluation": eva});
                              var storyHtml = template('evaStoryTmpl', {"evaluation": eva});
                              var makeHtml = template('evaMakeTmpl', {"evaluation": eva});
                              
                              $('#evaTblHeader').append(headerHtml);
                              $('#evaTblStory').append(storyHtml);
                              $('#evaTblMake').append(makeHtml);
                          }
                      }
                  }
              }
          );
      }
      
      function loadCopyrightContracts() {
          $.get(
              '<idp:url value="/copyright/productContracts"/>?productId=${product.id}',
              {},
              function(json){
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var ccs = result.data;
                      if(ccs.length == 0) {
                          var copyrightHtml = template('nonCopyrightTmpl', {});
                          $('#copyrightTbl tbody').html(copyrightHtml);
                      }else{
                          var copyrightHtml = template('copyrightTmpl', {cclist: ccs});
                          $('#copyrightTbl tbody').html(copyrightHtml);
                      }
                  }
              }
          );
      }
      
      function loadCopyrightFiles() {
          $.get(
              '<idp:url value="/evaluation/productCopyrightFiles"/>?productId=${product.id}',
              {},
              function(json){
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var cfs = result.data;
                      if(cfs.length == 0) {
                          var copyrightFileHtml = template('nonCopyrightFileTmpl', {});
                          $('#copyrightFileTbl tbody').html(copyrightFileHtml);
                      }else{
                          var copyrightFileHtml = template('copyrightFileTmpl', {cflist: cfs});
                          $('#copyrightFileTbl tbody').html(copyrightFileHtml);
                      }
                  }
              }
          );
      }
      
      function loadMakeTasks() {
          $.get(
              '<idp:url value="/make/makeTasks"/>?productId=${product.id}',
              {},
              function(json){
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var tasks = result.data;
                      if(tasks.length == 0) {
                          var makeTaskHtml = template('nonMakeTaskTmpl', {});
                          $('#makeTaskTbl tbody').html(makeTaskHtml);
                      }else{
                          var makeTaskHtml = template('makeTaskTmpl', {tasklist: tasks});
                          $('#makeTaskTbl tbody').html(makeTaskHtml);
                      }
                  }
              }
          );
      }
      
      function loadMakeContracts() {
          $.get(
              '<idp:url value="/make/contractDetail"/>?productId=${product.id}',
              {},
              function(json){
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var mcs = result.data;
                      if(tasks.length == 0) {
                          var makeContractHtml = template('nonMakeContractTmpl', {});
                          $('#makeContractTbl tbody').html(makeContractHtml);
                      }else{
                          var makeContractHtml = template('makeContractTmpl', {mclist: mcs});
                          $('#makeContractTbl tbody').html(makeContractHtml);
                      }
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
                              $('#productModal').modal('hide');
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
                              $('#productModal').modal('hide');
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
      
      function popAuditProduct(name) {
          $('#auditProductName').text(name);
          
          $('#auditModal').modal('show');
      }
      
      function closeAuditModal() {
          clearAuditModal();
          $('#auditModal').modal('hide');
      }
      
      function clearAuditModal() {
          $('#auditProductName').text('');
      }
      
      function passProduct(prodId) {
          var prodId = $('#auditProductId').val();
          $.post(
              '<idp:url value="/evaluation/passProduct"/>',
              {id: prodId},
              function(data) {
                  alert('审核成功');
                  closeAuditModal();
                  window.location.reload();
              }
          );
      }
      
      function rejectProduct(prodId) {
          var prodId = $('#auditProductId').val();
          $.post(
              '<idp:url value="/evaluation/rejectProduct"/>',
              {id: prodId},
              function(data) {
                  alert('审核成功');
                  closeAuditModal();
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
      
      function clearProductModal() {
          $('#inputId').val('');
          $('#inputName').val('');
      }
      
      function deleteCopyrightFile(id) {
          var r = window.confirm("您确定要删除这个权属文件吗？");
          if(!r) {
              return ;
          }else{
              $.post(
                  '<idp:url value="/evaluation/deleteCopyrightFile"/>',
                  {
                      "id": id,
                      "_method": "delete"
                  },
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('删除成功');
                          window.location.reload();
                      }else{
                          alert('删除失败，请联系管理员。');
                      }
                  }
              );
          }
      }
      
      function popUploadCopyrightFile() {
          clearCopyrightFileModal();
          $('#copyrightFileModal').modal('show');
      }
      
      function clearCopyrightFileModal() {
          $('#inputFile').val('');
          $('#inputDoc').val('');
          $('#uploadedFile').empty();
      }
      
      function closeCopyrightFileModal() {
          clearCopyrightFileModal();
          $('#copyrightFileModal').modal('hide');
      }
      
      function uploadCopyrightFile() {
          var fileUrl = $('#inputCopyrightFile').val();
          
          $.post(
              '<idp:url value="/product/uploadCopyrightFile"/>',
              {
                  "productId": '${product.id}',
                  "fileUrl": fileUrl
              },
              function(json) {
                  alert('保存成功');
                  window.location.reload();
              }
          );
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
                      if(prod.author) {
                          $('#inputAuthorName').val(prod.author.name);
                          $('#inputAuthorPseudonym').val(prod.author.pseudonym);
                      }else{
                          $('#inputAuthorName').val('');
                          $('#inputAuthorPseudonym').val('');
                      }
                      $('#inputWordCount').val(prod.wordCount);
                      var subj = $('#inputSubject').find('option[value=' + prod.subject.id + ']').index();
                      $('#inputSubject')[0].selectedIndex = subj;
                      var pubState = $('#inputPublishState').find('option[value=' + prod.publishState + ']').index();
                      $('#inputPublishState')[0].selectedIndex = pubState;
                      
                      if(prod.publishState == 0) {
                          var pubYear = $('#inputPublishYear').find('option[value=' + prod.publishYear + ']').index;
                          $('#inputPublishYear')[0].selectedIndex = pubYear;
                          $('#inputPress').val(prod.press);
                          $('#inputIsbn').val(prod.isbn);
                      }else{
                          $('#publishYearDiv').hide();
                          $('#pressDiv').hide();
                          $('#isbnDiv').hide();
                          var finishYear = $('#inputFinishYear').find('option[value=' + prod.finishYear + ']').index();
                          $('#inputFinishYear')[0].selectedIndex = finishYear;
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
                          $('#inputSamples').val(prod.samples[0].fileUrl);
                      }
                      
                      if(prod.hasAudio == '1') {
                          $('#hasAudio').attr('checked', true);
                          $('#inputAudioCopyright').find('option[value=' + prod.audioCopyright + ']').prop('selected', true);
                          $('#inputAudioDesc').val(prod.audioDesc);
                          $('#audioCopyrightDiv').show();
                          $('#audioDescDiv').show();
                      }else{
                          $('#noAudio').prop('checked', true);
                          $('#inputAudioDesc').val('');
                          $('#audioCopyrightDiv').hide();
                          $('#audioDescDiv').hide();
                      }
                      
                      $('#productModal').modal('show');
                  }
              }
          );
      }
      
      function submitProduct(submit) {
          var r = false;
          if(submit == '0') {
              r = validateName();
          }else{
              r = validateName()
                    && validateAuthorName()
                    && validateWordCount()
                    && validatePress()
                    && validateIsbn()
                    && validateWebsite()
                    && validateSummary()
                    && validateSamples()
                    && validateAudioDesc();
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
                          window.location.reload();
                      }else if(result.type == 'exception') {
                          if(result.code == 'EMARM-EVA-00002') {
                              var inputNameEle = $('#inputName');
                              var formGroup = inputNameEle.parents('.form-group');
                              if(!formGroup.hasClass('has-error')) {
                                  inputNameEle.parents('.form-group').addClass('has-error');
                                  inputNameEle.next('.feedback-tip').find('span').text(result.msg);
                                  inputNameEle.next('.feedback-tip').show();
                              }
                          }else if(result.code == 'EMARM-EVA-00003') {
                              var inputIsbnEle = $('#inputIsbn');
                              var formGroup = inputIsbnEle.parents('.form-group');
                              if(!formGroup.hasClass('has-error')) {
                                  inputIsbnEle.parents('.form-group').addClass('has-error');
                                  inputIsbnEle.next('.feedback-tip').find('span').text(result.msg);
                                  inputIsbnEle.next('.feedback-tip').show();
                              }
                          }
                      }
                  }
              );       
          }
      }
      
      function clearProductModal() {
          $('#inputId').val('');
          $('#inputName').val('');
          $('#inputAuthorName').val('');
          $('#inputAuthorPseudonym').val('');
          $('#inputWordCount').val('');
          $('#inputSubject')[0].selectedIndex = 0;
          $('#inputPublishState')[0].selectedIndex = 0;
          $('#inputPublishYear')[0].selectedIndex = 0;
          $('#inputPress').val('');
          $('#inputFinishYear')[0].selectedIndex = 0;
          $('#inputWebsite').val('');
          $('#inputSummary').val('');
          $('#hasAudio').prop('checked', true);
          $('#inputIsbn').val('');
          $('#inputAudioCopyright')[0].selectedIndex = 0;
          $('#inputAudioDesc').val('');
          
          $('#inputSamples').val('');
          $('#uploadedFile').empty();
          $('#samplesShowDiv').hide();
          
          $('#inputCopyrights').val('');
          $('#uploadedCopyrightFiles').empty();
          $('#copyrightsShowDiv').hide();
          
          $('#productModal .has-error').removeClass('has-error');
          $('#productModal .feedback-tip').hide();
      }
      
      //================= Product Validator ===========
      function validateName() {
          var inputNameEle = $('#inputName');
          var authorName = inputNameEle.val();
          
          if($('.prodTip').css('display') != 'none') {
              $('.prodTip').hide();
          }
          
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
      
      function validatePress() {
          var publishState = $('#inputPublishState').val();
          var inputPressEle = $('#inputPress');
          if(publishState == '0') {
              var press = inputPressEle.val();
              if(!press || $.trim(press).length == 0) {
                  var formGroup = inputPressEle.parents('.form-group');
                  if(!formGroup.hasClass('has-error')) {
                      inputPressEle.parents('.form-group').addClass('has-error');
                      inputPressEle.next('.feedback-tip').find('span').text('出版社不能为空');
                      inputPressEle.next('.feedback-tip').show();
                  }
                  return false;
              }else{
                  inputPressEle.parents('.form-group').removeClass('has-error');
                  inputPressEle.next('.feedback-tip').find('span').text('');
                  inputPressEle.next('.feedback-tip').hide();
                  return true;
              }
          }else{
              inputPressEle.parents('.form-group').removeClass('has-error');
              inputPressEle.next('.feedback-tip').find('span').text('');
              inputPressEle.next('.feedback-tip').hide();
              return true;
          }
      }
      
      function validateIsbn() {
          var publishState = $('#inputPublishState').val();
          var inputIsbnEle = $('#inputIsbn');
          if(publishState == '0') {
              var isbn = inputIsbnEle.val();
              if(!isbn || $.trim(isbn).length == 0) {
                  var formGroup = inputIsbnEle.parents('.form-group');
                  if(!formGroup.hasClass('has-error')) {
                      inputIsbnEle.parents('.form-group').addClass('has-error');
                      inputIsbnEle.next('.feedback-tip').find('span').text('ISBN号不能为空');
                      inputIsbnEle.next('.feedback-tip').show();
                  }
                  return false;
              }else{
                  inputIsbnEle.parents('.form-group').removeClass('has-error');
                  inputIsbnEle.next('.feedback-tip').find('span').text('');
                  inputIsbnEle.next('.feedback-tip').hide();
                  return true;
              }
          }else{
              inputIsbnEle.parents('.form-group').removeClass('has-error');
              inputIsbnEle.next('.feedback-tip').find('span').text('');
              inputIsbnEle.next('.feedback-tip').hide();
              return true;
          }
      }
      
      function validateWebsite() {
          var publishState = $('#inputPublishState').val();
          var inputWebsiteEle = $('#inputWebsite');
          if(publishState == '1') {
              var website = inputWebsiteEle.val();
              if(!website || $.trim(website).length == 0) {
                  var formGroup = inputWebsiteEle.parents('.form-group');
                  if(!formGroup.hasClass('has-error')) {
                      inputWebsiteEle.parents('.form-group').addClass('has-error');
                      inputWebsiteEle.next('.feedback-tip').find('span').text('签约网站不能为空');
                      inputWebsiteEle.next('.feedback-tip').show();
                  }
                  return false;
              }else{
                  inputWebsiteEle.parents('.form-group').removeClass('has-error');
                  inputWebsiteEle.next('.feedback-tip').find('span').text('');
                  inputWebsiteEle.next('.feedback-tip').hide();
                  return true;
              }
          }else{
              inputWebsiteEle.parents('.form-group').removeClass('has-error');
              inputWebsiteEle.next('.feedback-tip').find('span').text('');
              inputWebsiteEle.next('.feedback-tip').hide();
              return true;
          }
      }
      
      function validateSummary() {
          var inputSummaryEle = $('#inputSummary');
          var summary = inputSummaryEle.val();
          if(!summary || $.trim(summary).length == 0) {
              var formGroup = inputSummaryEle.parents('.form-group');
              if(!formGroup.hasClass('has-error')) {
                  inputSummaryEle.parents('.form-group').addClass('has-error');
                  inputSummaryEle.next('.feedback-tip').find('span').text('内容简介不能为空');
                  inputSummaryEle.next('.feedback-tip').show();
              }
              return false;
          }else{
              inputSummaryEle.parents('.form-group').removeClass('has-error');
              inputSummaryEle.next('.feedback-tip').find('span').text('');
              inputSummaryEle.next('.feedback-tip').hide();
              return true;
          }
      }
      
      function validateSamples() {
          var inputSamplesEle = $('#inputSamples');
          var samples = inputSamplesEle.val();
          if(!samples || $.trim(samples).length == 0) {
              var formGroup = inputSamplesEle.parents('.form-group');
              if(!formGroup.hasClass('has-error')) {
                  inputSamplesEle.parents('.form-group').addClass('has-error');
                  inputSamplesEle.next('.feedback-tip').find('span').text('样章不能为空');
                  inputSamplesEle.next('.feedback-tip').show();
              }
              return false;
          }else{
              inputSamplesEle.parents('.form-group').removeClass('has-error');
              inputSamplesEle.next('.feedback-tip').find('span').text('');
              inputSamplesEle.next('.feedback-tip').hide();
              return true;
          }
      }
      
      function validateCopyrights() {
          var inputCopyrightsEle = $('#inputCopyrights');
          var copyrights = inputCopyrightsEle.val();
          if(!copyrights || $.trim(copyrights).length == 0) {
              var formGroup = inputCopyrightsEle.parents('.form-group');
              if(!formGroup.hasClass('has-error')) {
                  inputCopyrightsEle.parents('.form-group').addClass('has-error');
                  inputCopyrightsEle.next('.feedback-tip').find('span').text('权属文件不能为空');
                  inputCopyrightsEle.next('.feedback-tip').show();
              }
              return false;
          }else{
              inputCopyrightsEle.parents('.form-group').removeClass('has-error');
              inputCopyrightsEle.next('.feedback-tip').find('span').text('');
              inputCopyrightsEle.next('.feedback-tip').hide();
              return true;
          }
      }
      
      function validateAudioDesc() {
          var checked = $('#hasAudio').prop('checked');
          var inputAudioDescEle = $('#inputAudioDesc');
          if(checked) {
              var audioDesc = inputAudioDescEle.val();
              if(!audioDesc || $.trim(audioDesc).length == 0) {
                  var formGroup = inputAudioDescEle.parents('.form-group');
                  if(!formGroup.hasClass('has-error')) {
                      inputAudioDescEle.parents('.form-group').addClass('has-error');
                      inputAudioDescEle.next('.feedback-tip').find('span').text('音频备注不能为空');
                      inputAudioDescEle.next('.feedback-tip').show();
                  }
                  return false;
              }else{
                  inputAudioDescEle.parents('.form-group').removeClass('has-error');
                  inputAudioDescEle.next('.feedback-tip').find('span').text('');
                  inputAudioDescEle.next('.feedback-tip').hide();
                  return true;
              }
          }else{
              inputAudioDescEle.parents('.form-group').removeClass('has-error');
              inputAudioDescEle.next('.feedback-tip').find('span').text('');
              inputAudioDescEle.next('.feedback-tip').hide();
              return true;
          }
      }
    </script>
  </body>
</html>