<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../../include.jsp"%>  
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src='<idp:ctx/>${sessionScope.__SESSION__USER__.logoUrl}' class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info" style="font-family:宋体;">
              <p>${sessionScope.__SESSION__USER__.name}</p>
              <a class="text-overflow" style="display: inline-block" title="${sessionScope.__SESSION__USER__.roleText}" href="#">${sessionScope.__SESSION__USER__.roleText}</a>
            </div>
          </div>