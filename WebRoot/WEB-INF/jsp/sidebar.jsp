<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../include.jsp"%> 
          
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">主菜单</li>
            <li id="menu_home">
              <a href='<idp:url value="/home"/>'>
                <i class="fa fa-home"></i> <span>首页</span> 
              </a>
            </li>
            <li id="menu_evaluation">
              <a href='#'>
                <i class="fa fa-tag"></i>
                <span>评价管理</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li id="menu_eva_myproduct"><a href='<idp:url value="/evaluation/myProductPage"/>'><i class="fa fa-angle-double-right f10"></i> 我的作品</a></li>
                <c:if test="${fn:indexOf(sessionScope.__SESSION__USER__.role, '99') > -1 || fn:indexOf(sessionScope.__SESSION__USER__.role, '03') > -1}">
                <li id="menu_eva_prodmgr"><a href='<idp:url value="/evaluation/productPage"/>'><i class="fa fa-angle-double-right f10"></i> 评价 & 审核</a></li>
                </c:if>
              </ul>
            </li>
            <li id="menu_copyright">
              <a href='#'>
                <i class="fa fa-book"></i> <span>版权管理</span><i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li id="menu_cc_product"><a href='<idp:url value="/copyright/productPage"/>'><i class="fa fa-angle-double-right f10"></i> 作品维度</a></li>
                <li id="menu_cc_contract">
                    <a href='<idp:url value="/copyright/contractPage"/>'><i class="fa fa-angle-double-right f10"></i> 合同维度<i class="fa fa-angle-left pull-right"></i></a>
                    <ul class="treeview-menu">
                        <li id="menu_cc_mycontract"><a href='<idp:url value="/copyright/myContractPage"/>'><i class="fa fa-angle-double-right f10"></i> 我的合同</a></li>
                        <li id="menu_cc_auditcontract"><a href='<idp:url value="/copyright/auditContractPage"/>'><i class="fa fa-angle-double-right f10"></i> 合同审批</a></li>
                        <li id="menu_eva_prodmgr"><a href='<idp:url value="/copyright/contractPage"/>'><i class="fa fa-angle-double-right f10"></i> 合同管理</a></li>
                    </ul>
                </li>
              </ul>
            </li>
            <li id="menu_mediares">
              <a href='#'>
                <i class="fa fa-th"></i> <span>媒资管理</span><i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li id="menu_mr_product"><a href='<idp:url value="/mediares/productPage"/>'><i class="fa fa-angle-double-right f10"></i> 作品维度</a></li>
                <li id="menu_cc_contract">
                    <a href='<idp:url value="/copyright/contractPage"/>'><i class="fa fa-angle-double-right f10"></i> 合同维度<i class="fa fa-angle-left pull-right"></i></a>
                    <ul class="treeview-menu">
                        <li id="menu_cc_mycontract"><a href='<idp:url value="/copyright/myContractPage"/>'><i class="fa fa-angle-double-right f10"></i> 我的合同</a></li>
                        <li id="menu_cc_auditcontract"><a href='<idp:url value="/copyright/auditContractPage"/>'><i class="fa fa-angle-double-right f10"></i> 合同审批</a></li>
                        <li id="menu_eva_prodmgr"><a href='<idp:url value="/copyright/contractPage"/>'><i class="fa fa-angle-double-right f10"></i> 合同管理</a></li>
                    </ul>
                </li>
              </ul>
            </li>
            <li id="menu_make" class="treeview">
              <a href="#">
                <i class="fa fa-magic"></i>
                <span>制作管理</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li id="menu_mk_task"><a href='<idp:url value="/make/taskProductPage"/>'><i class="fa fa-tasks"></i> 制作任务</a></li>
                <li id="menu_mk_contract"><a href='<idp:url value="/make/contractProductPage"/>'><i class="fa fa-archive"></i> 制作合同</a></li>
              </ul>
            </li>
            <li id="menu_sale" class="treeview">
              <a href="#">
                <i class="fa fa-rocket"></i> <span>运营管理</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li id="menu_sale_prod"><a href='<idp:url value="/sale/productPage"/>'><i class="fa fa-cubes"></i> 作品维度</a></li>
                <li id="menu_sale_contract"><a href='<idp:url value="/sale/contractPage"/>'><i class="fa fa-file-text"></i> 合同维度</a></li>
                <li id="menu_sale_report"><a href='<idp:url value="/sale/productPage"/>'><i class="fa fa-file-text"></i> 统计分析</a></li>
              </ul>
            </li>
            <li id="menu_system" class="treeview">
              <a href="#">
                <i class="fa fa-cog"></i> <span>系统管理</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li id="menu_subject"><a href='<idp:url value="/system/subjectPage"/>'><i class="fa fa-list"></i> 作品题材管理</a></li>
                <li id="menu_author"><a href='<idp:url value="/system/authorPage"/>'><i class="fa fa-list"></i> 作者管理</a></li>
                <li id="menu_user"><a href='<idp:url value="/system/userPage"/>'><i class="fa fa-users"></i> 用户管理</a></li>
                <li><a href='<idp:url value="/comingsoon"/>'><i class="fa fa-envelope-o"></i> 邮件服务设置</a></li>
              </ul>
            </li>
          </ul>
        </section>
        <!-- /.sidebar -->