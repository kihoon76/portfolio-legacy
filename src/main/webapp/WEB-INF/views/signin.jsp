<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!-- <div id="tooltip" data-toggle="tooltip" data-placement="right" data-html="true" title="test"></div> -->
<div class="msg-alert">
	<div class="alert alert-danger collapse" id="dvMsg">
	<a href="#" class="close" data-dismiss="alert">&times;</a>
	<strong>Error!</strong><span id="msgDetail"></span>
	</div>
</div>
<div class="container">
<div class="row">
<div class="col-lg-6 col-lg-offset-3">
<div class="well">
<div class="panel panel-primary">
	<div class="panel-heading">로그인</div>
	<div class="panel-body">
		<form class="form-horizontal" method="post" action="/login">
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">이 름:</label>
				<div class="col-sm-10">
	     			<input type="text" class="form-control" id="id" name="id" placeholder="Enter name">
	   			</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">비 번:</label>
				<div class="col-sm-10">
			    	<input type="password" class="form-control" id="pw" name="pw" placeholder="Enter password">
			    </div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
			    		<label><input type="checkbox"> id 저장</label>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default" id="btnSubmit">전송</button>
					<button type="button" class="btn btn-default" id="btnAjaxSubmit">Ajax전송</button>
				</div>
			</div>
		</form>
	</div>
</div>
</div>
</div>
</div>
</div>
