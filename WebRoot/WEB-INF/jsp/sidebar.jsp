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
              <a href='<idp:url value="/evaluation/productPage"/>'>
                <i class="fa fa-tag"></i>
                <span>评价管理</span>
              </a>
            </li>
            <li>
              <a href='<idp:url value="/comingsoon"/>'>
                <i class="fa fa-book"></i> <span>版权管理</span>
              </a>
            </li>
            <li>
              <a href='<idp:url value="/comingsoon"/>'>
                <i class="fa fa-th"></i>
                <span>媒资管理</span>
              </a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-magic"></i>
                <span>制作管理</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href='<idp:url value="/comingsoon"/>'><i class="fa fa-tasks"></i> 制作任务</a></li>
                <li><a href='<idp:url value="/comingsoon"/>'><i class="fa fa-archive"></i> 制作合同</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-rocket"></i> <span>运营管理</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href='<idp:url value="/comingsoon"/>'><i class="fa fa-cubes"></i> 作品维度</a></li>
                <li><a href='<idp:url value="/comingsoon"/>'><i class="fa fa-file-text"></i> 合同维度</a></li>
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
                <li><a href='<idp:url value="/comingsoon"/>'>><i class="fa fa-envelope-o"></i> 邮件服务设置</a></li>
              </ul>
            </li>
          </ul>
        </section>
        <!-- /.sidebar -->