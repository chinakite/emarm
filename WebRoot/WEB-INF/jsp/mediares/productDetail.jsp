<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数字音频版权云平台 | 作品详情</title>
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

    <link rel="stylesheet" href='<idp:url value="/css/blueimp-gallery.css"/>'>
    <link rel="stylesheet" href='<idp:url value="/css/blueimp-gallery-indicator.css"/>'/>

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
                <button class="btn btn-default pull-right ml10" onclick="popAuditProduct('${product.id}', '${product.name}');"><i class="fa fa-edit"></i> 编辑</button>
            </c:if>
            <c:if test="${product.state == '2' || product.state == '3'}">
                <button class="btn btn-default pull-right ml10" onclick="popAuditProduct('${product.id}', '${product.name}');"><i class="fa fa-tag"></i> 邀请评价</button>
            </c:if>
            <c:if test="${product.state == '1'}">
                <button class="btn btn-default pull-right ml10" onclick="popAuditProduct('${product.name}');"><i class="fa fa-star-half-empty"></i> 审核</button>
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
                              <p class="col-xs-7 detailInfo-light">出版年份：${product.publishYear}</p>
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
                              <c:if test="${fn:indexOf(sessionScope.__SESSION__USER__.role, '99') > -1 || fn:indexOf(sessionScope.__SESSION__USER__.role, '40') > -1 || fn:indexOf(sessionScope.__SESSION__USER__.role, '11') > -1 || fn:indexOf(sessionScope.__SESSION__USER__.role, '12') > -1 || fn:indexOf(sessionScope.__SESSION__USER__.role, '13') > -1}">
                              <li><a href="#copyrightInfo" data-toggle="tab">版权信息</a></li>
                              </c:if>
                              <c:if test="${fn:indexOf(sessionScope.__SESSION__USER__.role, '99') > -1 || fn:indexOf(sessionScope.__SESSION__USER__.role, '40') > -1 || fn:indexOf(sessionScope.__SESSION__USER__.role, '21') > -1 || fn:indexOf(sessionScope.__SESSION__USER__.role, '22') > -1}">
                              <li><a href="#makeInfo" data-toggle="tab">制作信息</a></li>
                              </c:if>
                              <c:if test="${fn:indexOf(sessionScope.__SESSION__USER__.role, '99') > -1 || fn:indexOf(sessionScope.__SESSION__USER__.role, '40') > -1 || fn:indexOf(sessionScope.__SESSION__USER__.role, '31') > -1 || fn:indexOf(sessionScope.__SESSION__USER__.role, '32') > -1}">
                              <li><a href="#saleInfo" data-toggle="tab">运营信息</a></li>
                              </c:if>
                              <c:if test="${fn:indexOf(sessionScope.__SESSION__USER__.role, '99') > -1 || fn:indexOf(sessionScope.__SESSION__USER__.role, '40') > -1 || fn:indexOf(sessionScope.__SESSION__USER__.role, '31') > -1 || fn:indexOf(sessionScope.__SESSION__USER__.role, '32') > -1}">
                              <li><a href="#gallery" data-toggle="tab">相册</a></li>
                              <li><a href="#audioes" data-toggle="tab">音频</a></li>
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
                                  <h5>权属文件</h5>
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
                                              <th>甲方联系人</th>
                                              <th>乙方联系人</th>
                                              <th>乙方联系方式</th>
                                              <th>总集数</th>
                                              <th>总价</th>
                                              <th></th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                      
                                      </tbody>
                                  </table>  
                              </div><!-- /.tab-pane -->
                              <div class="tab-pane" id="saleInfo">
                                  <h5>运营合同</h5>
                                  <table id="saleContractTbl" class="table table-bordered table-hover">
                                      <thead>
                                          <tr>
                                              <th>合同编号</th>
                                              <th>乙方</th>
                                              <th>乙方联系人</th>
                                              <th>乙方联系方式</th>
                                              <th>签约时间</th>
                                              <th></th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                      
                                      </tbody>
                                  </table>  
                              </div><!-- /.tab-pane -->
                              <div class="tab-pane col-md-12" id="gallery">
                                  <div class="row">
                                      <button class="btn btn-default pull-right" onclick="popImgModal();"><i class="fa fa-star-half-empty"></i> 上传图片</button>
                                  </div>
                                  <div id="imgList">
                                  
                                  </div>
                              </div><!-- /.tab-pane -->
                              <div class="tab-pane" id="audioes">
                                  <div class="row">
                                      <button class="btn btn-default pull-right ml10" onclick="popAudioModal();"><i class="fa fa-star-half-empty"></i> 打包下载</button>
                                      <button class="btn btn-default pull-right" onclick="popAudioModal();"><i class="fa fa-star-half-empty"></i> 上传音频</button>
                                  </div>
                                  <ul id="audioList" class="row col-md-12 list-group mt20">
                                  </ul>
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

    <div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
        <div class="slides"></div>
        <h3 class="title"></h3>
        <a class="prev">‹</a>
        <a class="next">›</a>
        <a class="close">×</a>
        <a class="play-pause"></a>
        <ol class="indicator"></ol>
    </div>

    <div id="imgModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">上传图片</h4>
          </div>
          <div class="modal-body">
              <form class="form-horizontal">
                  <div class="col-xs-12">
                      <div class="form-group required">
                          <label for="inputImgName" class="col-xs-2 control-label">图片名称</label>
                          <div class="col-xs-10">
                              <input id="inputImgName" type="text" class="form-control"/>
                          </div>
                      </div>
                      <div class="form-group required">
                          <label for="inputImgFile" class="col-xs-2 control-label">图片文件</label>
                          <div id="docUploadDiv" class="col-xs-10">
                              <input id="importImgFile" name="importFile" type="file" class="form-control"/>
                              <ul id="uploadedImgFile"></ul>
                              <input type="hidden" id="inputImg"/>
                          </div>
                      </div>
                      <div class="form-group required">
                          <label for="inputImgDesc" class="col-xs-2 control-label">图片描述</label>
                          <div class="col-xs-10">
                              <textarea id="inputImgDesc" class="form-control col-xs-10"></textarea>
                          </div>
                      </div>
                  </div>
              </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeImgModal();">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="uploadProductImg();">确定</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <div id="audioModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">上传音频</h4>
          </div>
          <div class="modal-body">
              <form class="form-horizontal">
                  <div class="col-xs-12">
                      <div class="form-group required">
                          <label for="inputAudioName" class="col-xs-2 control-label">音频名称</label>
                          <div class="col-xs-10">
                              <input id="inputAudioName" type="text" class="form-control"/>
                          </div>
                      </div>
                      <div class="form-group required">
                          <label for="inputAudioFile" class="col-xs-2 control-label">音频文件</label>
                          <div id="docUploadDiv" class="col-xs-10">
                              <input id="inputAudioFile" name="importFile" type="file" class="form-control"/>
                              <ul id="uploadedAudioFile"></ul>
                              <input type="hidden" id="inputAudio"/>
                          </div>
                      </div>
                  </div>
              </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeAudioModal();">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="uploadProductAudio();">确定</button>
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
    
    <script src='<idp:url value="/js/jquery.blueimp-gallery.min.js"/>'></script>
    
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
              {{if evaluation.storyFrame > 0}}
              <i class="fa fa-star text-yellow"></i>
              {{else}}
              <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if evaluation.storyFrame > 1}}
              <i class="fa fa-star text-yellow"></i>
              {{else}}
              <i class="fa fa-star text-gray"></i>
              {{/if}}
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
              {{if evaluation.storyFrame > 3}}
              <span class="evaItemText">优秀</span>
              {{else if evaluation.storyFrame > 2}}
              <span class="evaItemText">良好</span>
              {{else if evaluation.storyFrame > 3}}
              <span class="evaItemText">一般</span>
              {{else}}
              <span class="evaItemText">比较差</span>
              {{/if}}
           </div>
           <div class="evaItem">
              <p class="evaItemTitle pull-left txt-indent">文字水平</p>
              {{if evaluation.storyText > 0}}
              <i class="fa fa-star text-yellow"></i>
              {{else}}
              <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if evaluation.storyText > 1}}
              <i class="fa fa-star text-yellow"></i>
              {{else}}
              <i class="fa fa-star text-gray"></i>
              {{/if}}
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
              {{if evaluation.storyText > 3}}
              <span class="evaItemText">优秀</span>
              {{else if evaluation.storyText > 2}}
              <span class="evaItemText">良好</span>
              {{else if evaluation.storyText > 1}}
              <span class="evaItemText">一般</span>
              {{else}}
              <span class="evaItemText">比较差</span>
              {{/if}}
           </div>
           <div class="evaItem">
              <p class="evaItemTitle pull-left txt-indent">人物塑造</p>
              {{if evaluation.storyRole > 0}}
              <i class="fa fa-star text-yellow"></i>
              {{else}}
              <i class="fa fa-star text-gray"></i>
              {{/if}}
              {{if evaluation.storyRole > 1}}
              <i class="fa fa-star text-yellow"></i>
              {{else}}
              <i class="fa fa-star text-gray"></i>
              {{/if}}
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
              {{if evaluation.storyRole > 3}}
              <span class="evaItemText">优秀</span>
              {{else if evaluation.storyRole > 2}}
              <span class="evaItemText">良好</span>
              {{else if evaluation.storyRole > 1}}
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
              <span class="evaItemText">男声</span>
              <span class="evaItemText">单播</span>
              <span class="evaItemText">小说剧</span>
              <span class="evaItemText">适合网络播出</span>
           </div>
           <div class="evaItem">
              <span class="evaItemTitle">演员风格建议</span>
              <span class="evaItemText">厚重</span>
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
            <td><a href='<idp:url value="/copyright/contractDetail"/>?id={{cc.id}}' target="_blank">查看</a></td>
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
            <td><a href="<idp:ctx/>{{cf.fileUrl}}">下载</a></td>
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
            <td><a href='<idp:url value="/make/taskDetail"/>?id={{task.id}}' target="_blank">查看</a></td>
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
            <td>{{mc.ownerContact}}</td>
            <td>{{mc.worker}}</td>
            <td>{{mc.workerContact}}</td>
            <td>{{mc.workerContactPhone}}</td>
            <td>{{mc.totalSection}} 分钟</td>
            <td>{{mc.totalPrice}} 元</td>
            <td><a href='<idp:url value="/make/contractDetail"/>?productId={{mc.productId}}' target="_blank">查看</a></td>
        </tr>
        {{/each}}
    </script>
    
    <script id="nonSaleContractTmpl" type="text/html">
        <tr>
            <td colspan="7">目前没有运营合同。</td>
        </tr>
    </script>
    
    <script id="saleContractTmpl" type="text/html">
        {{each sclist as sc idx}}
        <tr>
            <td>{{sc.code}}</td>
            <td>{{sc.buyer}}</td>
            <td>{{sc.buyerContact}}</td>
            <td>{{sc.buyerContactPhone}}</td>
            <td>{{sc.createTime}}</td>
            <td><a href='<idp:url value="/sale/contractDetail"/>?id={{sc.id}}' target="_blank">查看</a></td>
        </tr>
        {{/each}}
    </script>
    
    <script id="imageListTmpl" type="text/html">
        <div class="row mt20">
            {{each imglist as img index}}
            <div class="col-md-3">
                <a href="<idp:ctx/>{{img.fileUrl}}" title="{{img.name}}" data-gallery>
                    <img src="<idp:ctx/>{{img.fileUrl}}" alt="{{img.name}}" width="100%">
                </a>
                <div class="gallery-img-title"><strong>{{img.name}}</strong></div>
                <div class="text-muted">{{img.desc}}</div>
            </div>
            {{/each}}
        </div>
    </script>
    
    <script id="audioListTmpl" type="text/html">
        {{each audiolist as au}}
            <li class="col-md-4 list-group-item"><strong>{{au.name}}</strong><a href="<idp:ctx/>{{au.fileUrl}}" class="label pull-right bg-green ml10">下载</a><a class="label pull-right bg-red" onclick="deleteProductAudio('{{au.id}}')">删除</a></li>
        {{/each}}
    </script>
    
    <!-- page script -->
    <script>
      var table;
    
      $(document).ready(function(){
          loadEvaluations();
          loadFinalEvaludation();
          loadCopyrightFiles();
          loadCopyrightContracts();
          loadMakeTasks();
          loadMakeContracts();
          loadSaleContracts();
          listProductImages();
          listProductAudioes();
          $('#importImgFile').fileupload({
              url: '<idp:url value="/uploadDoc"/>',
              dataType: 'json',
              done: function (e, data) {
                     var fileUrl = data['result']['data'][0]['fileUrl'];
                     var fileName = data['result']['data'][0]['fileName'];
                     $('#uploadedImgFile').html('<li>'+fileName+'</li>');
                     $('#inputImg').val(fileUrl);
              }
          });
          $('#inputAudioFile').fileupload({
              url: '<idp:url value="/uploadAudio"/>',
              dataType: 'json',
              done: function (e, data) {
                     var fileUrl = data['result']['data'][0]['fileUrl'];
                     var fileName = data['result']['data'][0]['fileName'];
                     $('#uploadedAudioFile').html('<li>'+fileName+'</li>');
                     $('#inputAudio').val(fileUrl);
              }
          });
      });
      
      function loadFinalEvaludation() {
          $.get(
              '<idp:url value="/evaluation/finalEvaluation"/>?productId=${product.id}',
              {},
              function(json){
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var data = result.data;
                      if(data) {
                          var html = template('finalEvaTmpl', {fe: data});
                          $('#finalEvaBody').html(html);
                      }else{
                          var html = template('nonEvaMakeTmpl', {});
                          $('#finalEvaBody').html(html);
                      }
                      
                      $('#pricePanel').text(data.refPrice);
                  }
              }
          );
      }
      
      function populateNonFinalEvaPanel() {
          var html = template('nonFinalEvaTmpl' ,{});
          $('#finalEvaBody').html(html);
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
              '<idp:url value="/make/productMakeContracts"/>?productId=${product.id}',
              {},
              function(json){
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var mcs = result.data;
                      if(mcs.length == 0) {
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
      
      function loadSaleContracts() {
          $.get(
              '<idp:url value="/sale/productContracts"/>?productId=${product.id}',
              {},
              function(json){
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var scs = result.data;
                      if(scs.length == 0) {
                          var saleContractHtml = template('nonSaleContractTmpl', {});
                          $('#saleContractTbl tbody').html(saleContractHtml);
                      }else{
                          var saleContractHtml = template('saleContractTmpl', {sclist: scs});
                          $('#saleContractTbl tbody').html(saleContractHtml);
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
      
      function listProductImages() {
          $.get(
              '<idp:url value="/mediares/productImages"/>?productId=${product.id}',
              {},
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var data = result.data;
                      var t = data.length;
                      if(t%4 != 0) {
                          t = data.length/4;
                      }
                      for(var i=0; i<t; i++) {
                          var tmplist = [];
                          for(var j=0; j<4; j++) {
                              if( (i+j) < data.length) {
                                  tmplist.push(data[i+j]);
                              }
                          }
                          var html = template('imageListTmpl', {imglist: tmplist});
                          $('#imgList').append(html);
                      }
                  }
              }
          );
      }
      
      function popImgModal() {
          $('#imgModal').modal('show');
      }
      
      function closeImgModal() {
          clearImgModal();
          $('#imgModal').modal('hide');
      }
      
      function clearImgModal() {
          
      }
      
      function uploadProductImg() {
          var name = $('#inputImgName').val();
          var desc = $('#inputImgDesc').val();
          var fileUrl = $('#inputImg').val();
      
          $.post(
              '<idp:url value="/mediares/productImage"/>',
              {
                  productId: '${product.id}',
                  "name": name,
                  "desc": desc,
                  "fileUrl": fileUrl
              },
              function(json) {
                  alert('保存成功');
                  window.location.reload();
              }
          );
      }
      
      function popAudioModal() {
          $('#audioModal').modal('show');
      }
      
      function closeAudioModal() {
          clearAudioModal();
          $('#audioModal').modal('hide');
      }
      
      function uploadProductAudio() {
          var name = $('#inputAudioName').val();
          var fileUrl = $('#inputAudio').val();
      
          $.post(
              '<idp:url value="/mediares/productAudio"/>',
              {
                  productId: '${product.id}',
                  "name": name,
                  "fileUrl": fileUrl
              },
              function(json) {
                  alert('保存成功');
                  window.location.reload();
              }
          );
      }
      
      function listProductAudioes() {
          $.get(
              '<idp:url value="/mediares/productAudioes"/>?productId=${product.id}',
              {},
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      var data = result.data;
                      var html = template('audioListTmpl', {audiolist: data});
                      $('#audioList').html(html);
                  }
              }
          );
      }
    </script>
  </body>
</html>