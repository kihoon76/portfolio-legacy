<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div class="container">
<div class="row">
<div class="well">
<div class="panel panel-primary">
	<div class="panel-heading">내계정</div>
	<div class="panel-body">
		 <div class="row">
            <div class="col-md-7" style="border-right:solid 1px red;">
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
				</form>
            </div>
            <div class="col-md-5">col2</div>
        </div> 

  	</div>
</div>
</div>
</div>
</div>
</div>