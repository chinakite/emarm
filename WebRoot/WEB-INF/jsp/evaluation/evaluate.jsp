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
            <div class="navbar-header" style="width:900px;">
              <span class="emarm_title_text">数字音频版权云平台</span>
              <!--
              <img style="margin-top: 4px;" src='<idp:url value="/img/logo.png"/>' height="40"/>
              -->
              <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                  <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <img src="/emarm/img/user2-160x160.jpg" class="user-image" alt="User Image">
                      <span class="hidden-xs">评价管理员</span>
                    </a>
                  </li>
                  <!-- Control Sidebar Toggle Button -->
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-gears"></i></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="/emarm/user/toChangePwd"><i class="fa fa-cog"></i>修改密码</a>
                        </li>
                        <li>
                            <a href="/emarm/evalogout"><i class="fa fa-power-off"></i>退出</a>
                        </li>
                    </ul>
                  </li>
                </ul>
              </div>
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
                                  <span>样章：</span><a href='<idp:url value=""/>${product.samples[0].fileUrl}' class="label bg-gray">下载</a>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-xs-12">
                              <h5>内容评价</h5>
                              <form class="form-horizontal">
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">情节架构</label>
                                      <div class="col-sm-10">
                                          <div class="col-sm-2 radio">
                                              <label for="story_perfect"><input id="story_perfect" name="storyframe" type="radio" value="5"/>优秀</label>
                                          </div>
                                          <div class="col-sm-2 radio">
                                              <label for="story_good"><input id="story_good" name="storyframe" type="radio" value="4"/>良好</label>
                                          </div>
                                          <div class="col-sm-2 radio">
                                              <label for="story_normal"><input id="story_normal" name="storyframe" type="radio" value="3" checked/>一般</label>
                                          </div>
                                          <div class="col-sm-2 radio">
                                              <label for="story_bad"><input id="story_bad" name="storyframe" type="radio" value="2"/>比较差</label>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">文字水平</label>
                                      <div class="col-sm-10">
                                          <div class="col-sm-2 radio">
                                              <label for="storytext_perfect"><input id="storytext_perfect" name="storytext" type="radio" value="5"/>优秀</label>
                                          </div>
                                          <div class="col-sm-2 radio">
                                              <label for="storytext_good"><input id="storytext_good" name="storytext" type="radio" value="4"/>良好</label>
                                          </div>
                                          <div class="col-sm-2 radio">
                                              <label for="storytext_normal"><input id="storytext_normal" name="storytext" type="radio" value="3" checked/>一般</label>
                                          </div>
                                          <div class="col-sm-2 radio">
                                              <label for="storytext_bad"><input id="storytext_bad" name="storytext" type="radio" value="2"/>比较差</label>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">人物塑造</label>
                                      <div class="col-sm-10">
                                          <div class="col-sm-2 radio">
                                              <label for="storyrole_perfect"><input id="storyrole_perfect" name="storyrole" type="radio" value="5"/>优秀</label>
                                          </div>
                                          <div class="col-sm-2 radio">
                                              <label for="storyrole_good"><input id="storyrole_good" name="storyrole" type="radio" value="4"/>良好</label>
                                          </div>
                                          <div class="col-sm-2 radio">
                                              <label for="storyrole_normal"><input id="storyrole_normal" name="storyrole" type="radio" value="3" checked/>一般</label>
                                          </div>
                                          <div class="col-sm-2 radio">
                                              <label for="storyrole_bad"><input id="storyrole_bad" name="storyrole" type="radio" value="2"/>比较差</label>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="storyTarget" class="col-sm-2 control-label">受众人群</label>
                                      <div class="col-sm-10">
                                          <textarea id="storyTarget" class="form-control" rows="3" placeholder="受众人群 ..."></textarea>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="storySuggest" class="col-sm-2 control-label">其他意见</label>
                                      <div class="col-sm-10">
                                        <textarea id="storySuggest" class="form-control" rows="3" placeholder="其他意见 ..."></textarea>
                                      </div>
                                  </div>
                              </form>
                          </div>
                      </div>
                      <hr/>
                      <div class="row">
                          <div class="col-xs-12">
                              <h5>制作评价</h5>
                              <form class="form-horizontal">
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">音频改编难度</label>
                                      <div class="col-sm-10">
                                          <div class="col-sm-3 radio">
                                              <label for="normalRole"><input id="normalRole" name="audioEdit" type="radio" value="1"/>容易</label>
                                          </div>
                                          <div class="col-sm-3 radio">
                                              <label for="superRole"><input id="superRole" name="audioEdit" type="radio" value="2" checked/>一般</label>
                                          </div>
                                          <div class="col-sm-3 radio">
                                              <label for="evaluateRole"><input id="evaluateRole" name="audioEdit" type="radio" value="3"/>难</label>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">演播形式建议</label>
                                      <div class="col-sm-10">
                                          <div class="col-sm-3 checkbox">
                                              <label for="male"><input id="male" name="playType" type="checkbox" value="1"/>男声</label>
                                          </div>
                                          <div class="col-sm-3 checkbox">
                                              <label for="female"><input id="female" name="playType" type="checkbox" value="2" checked/>女声</label>
                                          </div>
                                          <div class="col-sm-3 checkbox">
                                              <label for="pair"><input id="pair" name="playType" type="checkbox" value="3"/>对播</label>
                                          </div>
                                          <div class="col-sm-3 checkbox">
                                              <label for="single"><input id="single" name="playType" type="checkbox" value="4"/>单播</label>
                                          </div>
                                          <div class="col-sm-3 checkbox">
                                              <label for="radioplay"><input id="radioplay" name="playType" type="checkbox" value="5"/>广播剧</label>
                                          </div>
                                          <div class="col-sm-3 checkbox">
                                              <label for="novelplay"><input id="novelplay" name="playType" type="checkbox" value="6"/>小说剧</label>
                                          </div>
                                          <div class="col-sm-3 checkbox">
                                              <label for="fmplay"><input id="fmplay" name="playType" type="checkbox" value="7"/>适合电台播出</label>
                                          </div>
                                          <div class="col-sm-3 checkbox">
                                              <label for="webplay"><input id="webplay" name="playType" type="checkbox" value="8"/>适合网络播出</label>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">演员风格建议</label>
                                      <div class="col-sm-10">
                                          <div class="col-sm-3 checkbox">
                                              <label for="sweet"><input id="sweet" name="playstyle" type="checkbox" value="1"/>甜美</label>
                                          </div>
                                          <div class="col-sm-3 checkbox">
                                              <label for="sunshine"><input id="sunshine" name="playstyle" type="checkbox" value="2" checked/>阳光</label>
                                          </div>
                                          <div class="col-sm-3 checkbox">
                                              <label for="warm"><input id="warm" name="playstyle" type="checkbox" value="3"/>温暖</label>
                                          </div>
                                          <div class="col-sm-3 checkbox">
                                              <label for="artis"><input id="artis" name="playstyle" type="checkbox" value="4"/>文艺</label>
                                          </div>
                                          <div class="col-sm-3 checkbox">
                                              <label for="stone"><input id="stone" name="playstyle" type="checkbox" value="5"/>厚重</label>
                                          </div>
                                          <div class="col-sm-6 checkbox">
                                              <label for="otherstyle"><input id="otherstyle" name="playstyle" type="checkbox" value="6"/>其他</label>
                                              <input id="otherstyleText" name="otherstyleText" type="text" style="width:80%;" disabled/>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="makeSuggest" class="col-sm-2 control-label">其他意见</label>
                                      <div class="col-sm-10">
                                        <textarea id="makeSuggest" class="form-control" rows="3" placeholder="其他意见 ..."></textarea>
                                      </div>
                                  </div>
                              </form>
                          </div>
                      </div>
                  </div>
                  <div class="box-footer text-center">
                      <button type="button" class="btn btn-emarm" onclick="submitEvaluation();">提交</button>
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
      
      function submitEvaluation() {
          var storyFrame = $('input[name=storyframe]:checked').val();
          var storyText = $('input[name=storytext]:checked').val();
          var storyRole = $('input[name=storyrole]:checked').val();
          var target = $('#storyTarget').val();
          var storySuggest = $('#storySuggest').val();
          var audioEdit = $('input[name=audioEdit]:checked').val();
          var playTypeEle = $('input[name=playType]:checked');
          var otherStyle = $('#otherstyleText').val();
          var playtype = '';
          for(var i=0; i<playTypeEle.length; i++) {
              if(i>0) {
                  playtype += ',';
              }
              playtype += $(playTypeEle[i]).val();
          }
          var playStyleEle = $('input[name=playstyle]:checked');
          var playstyle = '';
          for(var i=0; i<playStyleEle.length; i++) {
              if(i>0) {
                  playstyle += ',';
              }
              playstyle += $(playStyleEle[i]).val();
          }
      
          var makeSuggest = $('#makeSuggest').val();
          $.post(
              '<idp:url value="/evaluation/evaluate"/>',
              {
                  'productId': '${product.id}',
                  'storyFrame': storyFrame ,
                  'storyText': storyText ,
                  'storyRole': storyRole ,
                  'storyTarget': target ,
                  'storySuggest': storySuggest,
                  'audioEdit': audioEdit ,
                  'playType': playtype ,
                  'playStyle': playstyle ,
                  'otherStyle': otherStyle,
                  'makeSuggest': makeSuggest
              },
              function(json) {
                  var result = IDEA.parseJSON(json);
                  if(result.type == 'success') {
                      alert('提交成功，请关闭页面');
                      window.opener = null;
					  window.open(' ', '_self');
					  window.close();
                  }else{
                      alert('您已经评价过此作品，不能再评价了。');
                  }
              }
          );       
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
    </script>
  </body>
</html>