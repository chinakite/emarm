<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../include.jsp"%>      
      <header class="main-header">

        <!-- Logo -->
        <a href="index2.html" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><img src='<idp:url value="/img/logo_small.png"/>' height="28"/></span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><img src='<idp:url value="/img/logo.png"/>' height="36"/></span>
        </a>

        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Notifications: style can be found in dropdown.less -->
              <li class="dropdown notifications-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <!--<span class="label label-warning">10</span>-->
                </a>
              </li>
              <!-- Tasks: style can be found in dropdown.less -->
              <li class="dropdown tasks-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-flag-o"></i>
                  <!--<span class="label label-danger">9</span>-->
                </a>
              </li>
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="<idp:ctx/>${sessionScope.__SESSION__USER__.logoUrl}" class="user-image" alt="User Image">
                  <span class="hidden-xs">${sessionScope.__SESSION__USER__.name}</span>
                </a>
              </li>
              <!-- Control Sidebar Toggle Button -->
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-gears"></i></a>
                <ul class="dropdown-menu">
                    <li>
                        <a><i class="fa fa-cog"></i>修改密码</a>
                    </li>
                    <li>
                        <a><i class="fa fa-power-off"></i>退出</a>
                    </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>