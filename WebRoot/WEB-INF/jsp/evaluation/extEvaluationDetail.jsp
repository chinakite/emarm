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
              {{if evaluation.audioEdit > 2}}
              <span class="evaItemText">难</span>
              {{else if evaluation.audioEdit > 1}}
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
              <span class="evaItemText">其他</span>
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
    
    <!-- page script -->
    <script>
      var table;
    
      $(document).ready(function(){
          loadEvaluations();
      });
      
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
    </script>
  </body>
</html>