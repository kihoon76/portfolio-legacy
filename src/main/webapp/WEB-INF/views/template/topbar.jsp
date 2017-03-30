<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-default" id="topbar">
	<div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <!-- <a class="navbar-brand" href="#">초기화면</a>-->
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <!--<li class="active"><a href="#">내페이지</a></li>-->
        <li><a href="/main"><span class="glyphicon glyphicon-th-list">초기화면</span></a></li>
        <li><a href="#"><span class="glyphicon glyphicon-home">내페이지</span></a></li>
        <li><a href="#"><span class="glyphicon glyphicon-list-alt">프로젝트</span></a></li>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        <li><a href="/admin/mgmt"><span class="glyphicon glyphicon-cog">관리</span></a></li>
       	</sec:authorize>
        <li><a href="#"><span class="glyphicon glyphicon-question-sign">도움말</span></a></li>
        <!-- <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>-->
      </ul>
      <!-- <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>-->
      <ul class="nav navbar-nav navbar-right">
      	<sec:authorize access="isAuthenticated()">
      	<li><a href="/my/account"><span class="glyphicon glyphicon-user">내계정</span></a></li>
       	<li><a href="/logout"><span class="glyphicon glyphicon-log-out">로그아웃</span></a></li>
      	</sec:authorize>
      	<sec:authorize access="isAnonymous()">
        <li><a href="/signin"><span class="glyphicon glyphicon-log-in">로그인</span></a></li>
       	<li><a href="/regist"><span class="glyphicon glyphicon-edit">등록</span></a></li>
       	</sec:authorize>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>