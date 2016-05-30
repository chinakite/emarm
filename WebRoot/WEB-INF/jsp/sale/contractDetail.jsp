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
            <h1 class="detailTitle col-xs-4">合同编号：${contract.code}</h1>
            <c:if test="${contract.state != '10'}">
                <c:if test="${contract.state == '0' || fn:indexOf(sessionScope.__SESSION__USER__.role, '99') != '-1' || fn:indexOf(sessionScope.__SESSION__USER__.role, '32') != '-1' || fn:indexOf(sessionScope.__SESSION__USER__.role, '31') != '-1'}">
                    <button class="btn btn-default pull-right ml10" onclick="deleteContract();"><i class="fa fa-remove"></i> 删除</button>
                    <button class="btn btn-default pull-right ml10" onclick="popEditContract();"><i class="fa fa-edit"></i> 编辑</button>
                    <button class="btn btn-default pull-right ml10" onclick="selectContractProduct('${contract.id}');"><i class="fa fa-plus"></i> 增加作品</button>
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

    <div id="contractModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">新建销售合同</h4>
          </div>
          <div class="modal-body">
              <form class="form-horizontal">
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputOwner" class="col-md-2 control-label">甲方</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputOwner" placeholder="授权方" value="${contract.owner}">
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
                              <input type="text" class="form-control" id="inputOwnerContact" placeholder="授权方联系人" value="${contract.ownerContact}">
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
                              <input type="text" class="form-control" id="inputOwnerContactPhone" placeholder="授权方联系电话" value="${contract.ownerContactPhone}">
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
                              <input type="text" class="form-control" id="inputOwnerContactAddress" placeholder="授权方联系地址" value="${contract.ownerContactAddress}">
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
                              <input type="text" class="form-control" id="inputOwnerContactEmail" placeholder="授权方电子邮箱" value="${contract.ownerContactEmail}">
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
                              <input type="text" class="form-control" id="inputBuyer" placeholder="被授权方" value="${contract.buyer}">
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
                              <input type="text" class="form-control" id="inputBuyerContact" placeholder="被授权方联系人" value="${contract.buyerContact}">
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
                              <input type="text" class="form-control" id="inputBuyerContactPhone" placeholder="被授权方联系电话" value="${contract.buyerContactPhone}">
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
                              <input type="text" class="form-control" id="inputBuyerContactAddress" placeholder="被授权方联系地址" value="${contract.buyerContactAddress}">
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
                              <input type="text" class="form-control" id="inputBuyerContactEmail" placeholder="被授权方电子邮箱" value="${contract.buyerContactEmail}">
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
                                  <label for="audioEditPrg"><input id="audioEditPrg" name="inputPrivileges" type="checkbox" value="01" <c:if test="${fn:contains(contract.privileges, '01')}">checked</c:if>/>音频改编权</label>
                              </div>
                              <div class="col-md-4 checkbox">
                                  <label for="broadcastPrg"><input id="broadcastPrg" name="inputPrivileges" type="checkbox" value="02" <c:if test="${fn:contains(contract.privileges, '02')}">checked</c:if>/>广播权</label>
                              </div>
                              <div class="col-md-4 checkbox">
                                  <label for="netcastPrg"><input id="netcastPrg" name="inputPrivileges" type="checkbox" value="03" <c:if test="${fn:contains(contract.privileges, '03')}">checked</c:if>/>信息网络传播权</label>
                              </div>
                              <div class="col-md-4 checkbox">
                                  <label for="grantPrg"><input id="grantPrg" name="inputPrivileges" type="checkbox" value="04" <c:if test="${fn:contains(contract.privileges, '04')}">checked</c:if>/>再许可授权</label>
                              </div>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputPrivilegeType" class="col-md-2 control-label">授权方式</label>
                          <div class="col-md-10">
                              <select id="inputPrivilegeType" class="form-control">
                                  <option value="0" <c:if test="${contract.privilegeRange == '0'}">selected</c:if>>专有许可使用</option>
                                  <option value="1" <c:if test="${contract.privilegeRange == '1'}">selected</c:if>>非专有许可使用</option>
                              </select>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputPrivilegeRange" class="col-md-2 control-label">授权范围</label>
                          <div class="col-md-10">
                              <select id="inputPrivilegeRange" class="form-control">
                                  <option value="0" <c:if test="${privilegeRange == '0'}">selected</c:if>>中国大陆地区</option>
                                  <option value="1" <c:if test="${privilegeRange == '1'}">selected</c:if>>中国大陆及港澳台地区</option>
                                  <option value="2" <c:if test="${privilegeRange == '2'}">selected</c:if>>全球</option>
                              </select>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputPrivilegeDeadline" class="col-md-2 control-label">授权期限</label>
                          <div class="col-md-4">
                              <select id="inputPrivilegeDeadline" class="form-control">
                                  <option value="1" <c:if test="${privilegeRange == '1'}">selected</c:if>>一年</option>
                                  <option value="2" <c:if test="${privilegeRange == '2'}">selected</c:if>>二年</option>
                                  <option value="3" <c:if test="${privilegeRange == '3'}">selected</c:if>>三年</option>
                                  <option value="4" <c:if test="${privilegeRange == '4'}">selected</c:if>>四年</option>
                                  <option value="5" <c:if test="${privilegeRange == '5'}">selected</c:if>>五年</option>
                                  <option value="6" <c:if test="${privilegeRange == '6'}">selected</c:if>>六年</option>
                                  <option value="7" <c:if test="${privilegeRange == '7'}">selected</c:if>>七年</option>
                                  <option value="8" <c:if test="${privilegeRange == '8'}">selected</c:if>>八年</option>
                                  <option value="9" <c:if test="${privilegeRange == '9'}">selected</c:if>>九年</option>
                                  <option value="10" <c:if test="${privilegeRange == '10'}">selected</c:if>>十年</option>
                              </select>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-12">
                      <div class="form-group required">
                          <label for="inputBankAccountName" class="col-md-2 control-label">账户名称</label>
                          <div class="col-md-10">
                              <input type="text" class="form-control" id="inputBankAccountName" placeholder="收款方账户名称" value="${contract.bankAccountName}">
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
                              <input type="text" class="form-control" id="inputBank" placeholder="收款方开户银行" value="${contract.bank}">
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
                              <input type="text" class="form-control" id="inputAccountNo" placeholder="收款账号" value="${contract.bankAccountNo}">
                              <div class="feedback-tip">
                                <label class="control-label" for="inputAccountNo"><i class="fa fa-times-circle-o"></i> <span>Input with error</span></label>
                              </div>
                          </div>
                      </div><!-- /.form-group -->
                  </div>
              </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="submitSaleContract();">确定</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

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
    
    <div id="selectProductModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog" style="width:800px;">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">选择作品</h4>
          </div>
          <div class="modal-body">
              <div class="col-xs-12">
                  <div class="col-xs-6">
                      <form>
                          <div class="form-group col-sm-12">
                              <div class="form-group">
                                  <label for="inputFile" class="col-sm-3 control-label">名称</label>
                                  <div id="searchNameDiv" class="col-sm-9">
                                      <input id="inputSearchName" type="text" class="form-control"/>
                                  </div>
                              </div>
                          </div>
                          <div class="form-group col-sm-12">
                              <div class="form-group">
                                  <label for="inputFile" class="col-sm-3 control-label">ISBN</label>
                                  <div id="searchNameDiv" class="col-sm-9">
                                      <input id="inputSearchIsbn" type="text" class="form-control"/>
                                  </div>
                              </div>
                          </div>
                          <div class="form-group" style="text-align: center;">
                              <button type="button" class="btn btn-emarm pull-center" onclick="searchProducts();"><i class="fa fa-search"></i>&nbsp;查询</button>
                              <button type="button" class="btn btn-default pull-center" style="margin-left: 20px;" onclick="resetSearch();"><i class="fa fa-rotate-left"></i>&nbsp;重置</button>
                          </div>
                      </form>
                      <table id="selectProductTbl" class="table table-bordered table-hover">
                        <thead>
                          <tr>
                            <th>名称</th>
                            <th>ISBN</th>
                            <th style="width: 50px;">操作</th>
                          </tr>
                        </thead>
                      </table>
                  </div>
                  <div class="col-xs-6">
                      <table id="selectedProductTbl" class="table table-bordered table-hover">
                        <thead>
                          <tr>
                            <th>名称</th>
                            <th style="width:50%;">单价</th>
                            <th style="width: 50px;">操作</th>
                          </tr>
                        </thead>
                        <tbody>
                        </tbody>
                      </table>
                  </div>
              </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeSelectModal();">关闭</button>
            <button type="button" class="btn btn-emarm" onclick="addProductToContract();">确定</button>
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
              <td><a href="javascript:void(0);" onclick="deleteContractProduct('{{prod.id}}', '{{prod.name}}');">删除</a></td>
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
              <td><a href="<idp:ctx/>{{doc.fileUrl}}">下载</a> | <a href="javascript:void(0);" onclick="deleteContractDoc('{{doc.id}}');">删除</a></td>
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
          
          initProductTbl();
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
      
      function deleteContract() {
          var r = confirm("您真的要删除此合同吗？");
          if(r) {
              $.post(
                  '<idp:url value="/sale/saleContract/"/>${contract.id}',
                  {'_method': "delete"},
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('删除成功');
                          window.close();
                      }else{
                          alert('删除失败,请联系管理员查找失败原因.');
                      }
                  }
              );
          }
      }
      
      function popEditContract() {
          $('#contractModal').modal('show');
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
      
      function submitSaleContract() {
          var contractId = '${contract.id}';
          
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
              '<idp:url value="/sale/saleContract"/>',
              {
                  'contractId': contractId,
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
                      alert('更新成功');
                      window.location.reload();
                  }else{
                      alert('保存失败，请重试或联系管理员');
                  }
              }
          );
      }
      
      function deleteContractProduct(prodId, prodName) {
          var r = confirm("您确定要从此合同中删除作品["+prodName+"]吗？");
          if(!r) {
              return;
          }else{
              $.post(
                  '<idp:url value="/sale/deleteContractProduct"/>',
                  {
                      contractId: '${contract.id}',
                      productId: prodId
                  },
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('删除成功');
                          window.location.reload();
                      }else{
                          alert('删除失败，请重试或联系管理员');
                      }
                  }
              );
          }
      }
      
      function selectContractProduct() {
          $('#selectProductModal').modal('show');
      }
      
      var table;
      
      function initProductTbl() {
          table = $('#selectProductTbl').DataTable({
              "processing": true,
              "paging": true,
              "lengthChange": false,
              "searching": false,
              "ordering": false,
              "info": false,
              "autoWidth": false,
              "serverSide": true,
              "ajax": {url: '<idp:url value="/sale/dtProducts"/>',
                  "data": function(d) {
                      var productName = $('#inputSearchName').val();
                      if(productName && $.trim(productName).length > 0) {
                          d.productName = productName;
                      }
                      var isbn = $('#inputSearchIsbn').val();
                      if(isbn && $.trim(isbn).length > 0) {
                          d.isbn = isbn;
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
                {},
                {},
                {}
              ],
              "columnDefs": [
                  {
                      "targets": [0],
                      "render": function(data, type, full) {
                          return full.name;
                      }
                  },
                  {
                      "targets": [1],
                      "render": function(data, type, full) {
                          return full.isbn;
                      }
                  },
                  {
                      "targets": [2],
                      "render": function(data, type, full) {
                          var html = '<a href=\'javascript:void(0);\' onclick="selectProduct(\'' + full.id + '\', this)">选择</a> ';
                          return html;
                      }
                  }
              ]
          });
      }
      
      function searchProducts() {
          table.ajax.reload();
      }
      
      var selectedProductIds;
      function selectProduct(prodId, obj) {
          if(selectedProductIds) {
              if(selectedProductIds.indexOf(prodId) >= 0) {
                  alert("已经选择过了,不能再选择了.");
                  return;
              }
              selectedProductIds += ("," + prodId);
          }else{
              selectedProductIds = prodId;
          }
          
          var nameTd = $(obj).parent().prev().prev();
          var prodName = nameTd.text();
          
          var html = '<tr><td>' + prodName + '</td><td><div class="input-group"><input type="text" class="form-control" name="inputPrice" placeholder="单价"><span class="input-group-addon">元</span></div></td><td><a href="javascript:void(0);" onclick="deleteFromSelectedProductTbl(\'' + prodId + '\', this);">取消</a></td>';
          $('#selectedProductTbl tbody').append(html);
      }
      
      function deleteFromSelectedProductTbl(prodId, obj) {
          if(!selectedProductIds) {
              return;
          }else{
              if(selectedProductIds.indexOf(prodId) == 0) {
                  if(selectedProductIds.indexOf(",") > 0) {
                      selectedProductIds = selectedProductIds.replace(prodId+",", "");
                  }else{
                      selectedProductIds = "";
                  }
              }else{
                  selectedProductIds = selectedProductIds.replace("," + prodId, "");;
              }
          }
          
          $(obj).parent().parent().remove();
      }
      
      function closeSelectModal() {
          selectedProductIds = "";
          $('#selectedProductTbl tbody').empty();
          $('#selectProductModal').modal('hide');
      }
      
      function addProductToContract() {
          var prices = [];
          $('input[name=inputPrice]').each(
              function(){
                  prices.push($(this).val());
              }          
          );
          prices = prices.join(',');
          
          if(!selectedProductIds || !prices) {
              return;
          }else{
              $.post(
                  '<idp:url value="/sale/addProductToContract"/>',
                  {
                      productIds : selectedProductIds,
                      prices: prices,
                      contractId: '${contract.id}'
                  },
                  function(json){
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('添加作品成功');
                          window.location.reload();
                      }else{
                          alert('添加作品失败，请重试或联系管理员');
                      }
                  }
              );
          }
      }
      
      function deleteContractDoc(docId) {
          var r = confirm("您确定要从此合同中删除此文件吗？");
          if(!r) {
              return;
          }else{
              $.post(
                  '<idp:url value="/sale/deleteContractDoc"/>',
                  {
                      "contractId": '${contract.id}',
                      "docId": docId
                  },
                  function(json) {
                      var result = IDEA.parseJSON(json);
                      if(result.type == 'success') {
                          alert('删除成功');
                          window.location.reload();
                      }else{
                          alert('删除失败，请重试或联系管理员');
                      }
                  }
              );
          }
      }
    </script>
  </body>
</html>