<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../../include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>悦库时光音频资源管理系统 | 评价管理</title>
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
              <img style="margin-top: 4px;" src='<idp:url value="/img/logo.png"/>' height="40"/>
            </div>
          </div><!-- /.container-fluid -->
        </nav>
    </header>
    <div class="wrapper detailBody">
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper detailContent">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1 class="detailTitle">${product.name}</h1>
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
                                  <span>样章：</span><a class="label bg-gray">1</a><a class="label bg-gray ml10">2</a><a class="label bg-gray ml10">3</a>
                              </div>
                          </div>
                      </div>
                      <div class="row mt30">
                          <div class="col-xs-12">
                          <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                              <li class="active"><a href="#evaluationInfo" data-toggle="tab">评价信息</a></li>
                              <li><a href="#timeline" data-toggle="tab">版权信息</a></li>
                              <li><a href="#settings" data-toggle="tab">制作信息</a></li>
                              <li><a href="#settings" data-toggle="tab">运营信息</a></li>
                              <li><a href="#settings" data-toggle="tab">相册</a></li>
                            </ul>
                            <div class="tab-content">
                              <div class="active tab-pane" id="evaluationInfo">
                                <table class="table table-bordered">
                                   <thead>
                                       <tr style="background-color: #f4f4f4;">
                                           <th class="text-center" width="150" style="font-weight:normal;">评价人</th>
                                           <th class="text-center" style="font-weight:normal;">测试账号</th>
                                       </tr>    
                                   </thead>
                                   <tbody>
                                       <tr>
                                           <td width="150" style="vertical-align: middle;"><p class="text-center">内容评价</p></td>
                                           <td>
                                               <div class="evaItem">
                                                  <p class="evaItemTitle pull-left txt-indent">情节架构</p>
                                                  <i class="fa fa-star text-yellow"></i>
                                                  <i class="fa fa-star text-yellow"></i>
                                                  <i class="fa fa-star text-yellow"></i>
                                                  <i class="fa fa-star text-yellow"></i>
                                                  <i class="fa fa-star text-yellow"></i>
                                                  <span class="evaItemText">优秀</span>
                                               </div>
                                               <div class="evaItem">
                                                  <p class="evaItemTitle pull-left txt-indent">文字水平</p>
                                                  <i class="fa fa-star text-yellow"></i>
                                                  <i class="fa fa-star text-yellow"></i>
                                                  <i class="fa fa-star text-yellow"></i>
                                                  <i class="fa fa-star text-yellow"></i>
                                                  <i class="fa fa-star text-gray"></i>
                                                  <span class="evaItemText">良好</span>
                                               </div>
                                               <div class="evaItem">
                                                  <p class="evaItemTitle pull-left txt-indent">人物塑造</p>
                                                  <i class="fa fa-star text-yellow"></i>
                                                  <i class="fa fa-star text-yellow"></i>
                                                  <i class="fa fa-star text-yellow"></i>
                                                  <i class="fa fa-star text-yellow"></i>
                                                  <i class="fa fa-star text-gray"></i>
                                                  <span class="evaItemText">良好</span>
                                               </div>
                                               <div class="evaItem">
                                                  <p class="evaItemTitle pull-left txt-indent">受众人群</p>
                                                  <span class="evaItemText">男性</span>
                                                  <span class="evaItemText">18-26岁</span>
                                                  <span class="evaItemText">公司白领</span>
                                               </div>
                                               <div class="evaItem">
                                                  <p class="evaItemTitle pull-left txt-indent">其他意见</p>
                                                  <span class="evaItemText">挺好的</span>
                                               </div>
                                           </td>
                                       </tr>
                                       <tr>
                                           <td width="150" style="vertical-align: middle;"><p class="text-center">制作评价</p></td>
                                           <td>
                                               <div class="evaItem">
                                                  <span class="evaItemTitle">音频改编难度</span>
                                                  <span class="evaItemText">一般</span>
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
                                                  <span class="evaItemText">做吧</span>
                                               </div>
                                           </td>
                                       </tr>
                                   </tbody>
                                </table>
                              </div><!-- /.tab-pane -->
                              <div class="tab-pane" id="timeline">
                                <!-- The timeline -->
                                <ul class="timeline timeline-inverse">
                                  <!-- timeline time label -->
                                  <li class="time-label">
                                    <span class="bg-red">
                                      10 Feb. 2014
                                    </span>
                                  </li>
                                  <!-- /.timeline-label -->
                                  <!-- timeline item -->
                                  <li>
                                    <i class="fa fa-envelope bg-blue"></i>
                                    <div class="timeline-item">
                                      <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>
                                      <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>
                                      <div class="timeline-body">
                                        Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                                        weebly ning heekya handango imeem plugg dopplr jibjab, movity
                                        jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                                        quora plaxo ideeli hulu weebly balihoo...
                                      </div>
                                      <div class="timeline-footer">
                                        <a class="btn btn-primary btn-xs">Read more</a>
                                        <a class="btn btn-danger btn-xs">Delete</a>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- END timeline item -->
                                  <!-- timeline item -->
                                  <li>
                                    <i class="fa fa-user bg-aqua"></i>
                                    <div class="timeline-item">
                                      <span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>
                                      <h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request</h3>
                                    </div>
                                  </li>
                                  <!-- END timeline item -->
                                  <!-- timeline item -->
                                  <li>
                                    <i class="fa fa-comments bg-yellow"></i>
                                    <div class="timeline-item">
                                      <span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>
                                      <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>
                                      <div class="timeline-body">
                                        Take me to your leader!
                                        Switzerland is small and neutral!
                                        We are more like Germany, ambitious and misunderstood!
                                      </div>
                                      <div class="timeline-footer">
                                        <a class="btn btn-warning btn-flat btn-xs">View comment</a>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- END timeline item -->
                                  <!-- timeline time label -->
                                  <li class="time-label">
                                    <span class="bg-green">
                                      3 Jan. 2014
                                    </span>
                                  </li>
                                  <!-- /.timeline-label -->
                                  <!-- timeline item -->
                                  <li>
                                    <i class="fa fa-camera bg-purple"></i>
                                    <div class="timeline-item">
                                      <span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>
                                      <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>
                                      <div class="timeline-body">
                                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                                      </div>
                                    </div>
                                  </li>
                                  <!-- END timeline item -->
                                  <li>
                                    <i class="fa fa-clock-o bg-gray"></i>
                                  </li>
                                </ul>
                              </div><!-- /.tab-pane -->
            
                              <div class="tab-pane" id="settings">
                                <form class="form-horizontal">
                                  <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">Name</label>
                                    <div class="col-sm-10">
                                      <input type="email" class="form-control" id="inputName" placeholder="Name">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                                    <div class="col-sm-10">
                                      <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">Name</label>
                                    <div class="col-sm-10">
                                      <input type="text" class="form-control" id="inputName" placeholder="Name">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="inputExperience" class="col-sm-2 control-label">Experience</label>
                                    <div class="col-sm-10">
                                      <textarea class="form-control" id="inputExperience" placeholder="Experience"></textarea>
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="inputSkills" class="col-sm-2 control-label">Skills</label>
                                    <div class="col-sm-10">
                                      <input type="text" class="form-control" id="inputSkills" placeholder="Skills">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                      <div class="checkbox">
                                        <label>
                                          <input type="checkbox"> I agree to the <a href="#">terms and conditions</a>
                                        </label>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                      <button type="submit" class="btn btn-danger">Submit</button>
                                    </div>
                                  </div>
                                </form>
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
        <strong style="margin-left: 230px;">Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">北京悦库时光文化传媒有限公司</a>.</strong> All rights reserved.
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
                <div class="form-group">
                  <label for="inputName" class="col-sm-2 control-label"><span class="text-danger">* </span>名称</label>
                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder="名称" onblur="validateName();">
                      <div class="feedback-tip">
                        <label class="control-label" for="inputName"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                      </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputAuthorName" class="col-sm-2 control-label"><span class="text-danger">* </span>作者</label>
                  <div class="col-sm-4">
                      <input type="text" class="form-control" id="inputAuthorName" placeholder="作者" onblur="validateAuthorName();">
                      <div class="feedback-tip">
                        <label class="control-label" for="inputAuthorName"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                      </div>
                  </div>
                  <label for="inputAuthorPseudonym" class="col-sm-2 control-label"><span class="text-danger">* </span>作者笔名</label>
                  <div class="col-sm-4">
                      <input type="text" class="form-control" id="inputAuthorPseudonym" placeholder="作者笔名">
                      <div class="feedback-tip">
                        <label class="control-label" for="inputAuthorPseudonym"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                      </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputWordCount" class="col-sm-2 control-label"><span class="text-danger">* </span>字数</label>
                  <div class="col-sm-4">
                      <input type="text" class="form-control" id="inputWordCount" placeholder="单位：万字" onblur="validateWordCount();">
                      <div class="feedback-tip">
                        <label class="control-label" for="inputWordCount"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                      </div>
                  </div>
                  <label for="inputSubject" class="col-sm-2 control-label"><span class="text-danger">* </span>作品题材</label>
                  <div class="col-sm-4">
                      <select id="inputSubject" class="form-control">
                          <option value="1">穿越</option>
                      </select>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputPublishState" class="col-sm-2 control-label"><span class="text-danger">* </span>出版状态</label>
                  <div class="col-sm-4">
                      <select id="inputPublishState" class="form-control" onchange="changePublishState();">
                          <option value="0">已出版</option>
                          <option value="1">网络签约</option>
                          <option value="2">网络未签约</option>
                          <option value="3">未公开</option>
                      </select>
                  </div>
                  <label id="publishYearLabel" for="inputPublishYear" class="col-sm-2 control-label"><span class="text-danger">* </span>出版年份</label>
                  <div id="publishYearDiv" class="col-sm-4">
                      <select id="inputPublishYear" class="form-control">
                          <option value="2016">2016</option>
                          <option value="2015">2015</option>
                          <option value="2014">2014</option>
                          <option value="2013">2013</option>
                      </select>
                  </div>
                  <label id="finishYearLabel" for="inputFinishYear" class="col-sm-2 control-label" style="display:none;">完结年份</label>
                  <div id="finishYearDiv" class="col-sm-4" style="display:none;">
                      <select id="inputFinishYear" class="form-control">
                          <option value="2016">2016</option>
                          <option value="2015">2015</option>
                          <option value="2014">2014</option>
                          <option value="2013">2013</option>
                      </select>
                  </div>
                </div>
                <div id="pressDiv" class="form-group">
                  <label for="inputPress" class="col-sm-2 control-label"><span class="text-danger">* </span>出版社</label>
                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputPress" placeholder="出版社" onblur="validatePress();">
                      <div class="feedback-tip">
                        <label class="control-label" for="inputPress"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                      </div>
                  </div>
                </div>
                <div class="form-group hide">
                  <label for="inputWebsite" class="col-sm-2 control-label"><span class="text-danger">* </span>签约网站</label>
                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputWebsite" placeholder="出版社" onblur="validateWebsite();">
                      <div class="feedback-tip">
                        <label class="control-label" for="inputWebsite"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                      </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputSummary" class="col-sm-2 control-label"><span class="text-danger">* </span>内容简介</label>
                  <div class="col-sm-10">
                      <textarea id="inputSummary" class="form-control" rows="4" placeholder="内容简介 ..."></textarea>
                      <div class="feedback-tip">
                        <label class="control-label" for="inputSummary"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                      </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputSamples" class="col-sm-2 control-label"><span class="text-danger">* </span>样章</label>
                  <div class="col-sm-10">
                      <input id="inputAudioDesc" type="file" class="form-control"/>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputHasAudio" class="col-sm-2 control-label" style="text-align: left;"><span class="text-danger">* </span>网络音频</label>
                  <div class="col-sm-10">
                      <div class="col-sm-2 radio">
                          <label for="hasAudio"><input id="hasAudio" name="hasAudio" type="radio" value="1" onclick="hasAudioClick();"/>有</label>
                      </div>
                      <div class="col-sm-2 radio">
                          <label for="noAudio"><input id="noAudio" name="hasAudio" type="radio" value="0" checked onclick="noAudioClick();"/>无</label>
                      </div>
                  </div>
                </div>
                <div id="audioCopyrightDiv" class="form-group" style="display: none;">
                  <label for="inputAudioCopyright" class="col-sm-2 control-label">音频情况</label>
                  <div class="col-sm-10">
                      <select id="inputAudioCopyright" class="form-control">
                          <option value="1">有正规授权</option>
                          <option value="1">无正规授权</option>
                      </select>
                  </div>
                </div>
                <div id="audioDescDiv" class="form-group" style="display: none;">
                  <label for="inputAudioDesc" class="col-sm-2 control-label"><span class="text-danger">* </span>音频备注</label>
                  <div class="col-sm-10">
                      <textarea id="inputAudioDesc" class="form-control" rows="2" placeholder="音频备注 ..."></textarea>
                  </div>
                </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearAuthorModal();">关闭</button>
            <button type="button" class="btn btn-primary" onclick="submitAuthor();">保存</button>
            <button type="button" class="btn btn-primary" onclick="submitAuthor();">提交</button>
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
      
      });
      
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
    </script>
  </body>
</html>