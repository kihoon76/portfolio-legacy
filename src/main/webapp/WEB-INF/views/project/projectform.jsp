<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트</title>
<link rel="stylesheet" href="/resources/css/validate.css" />
<link rel="stylesheet" href="/resources/css/check_switch.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script type="text/javascript" src="/resources/plugin/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/project/project_c.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
<div class="container">
<div class="row">
<div class="well">
<div class="panel panel-primary">
	<div class="panel-heading">새프로젝트</div>
	<div class="panel-body">
	<form:form cssClass="form-horizontal" modelAttribute="projectForm" method="POST">
		<div class="form-group row required">
	    	<label for="id" class="col-md-2 col-form-label">이름</label>
	    	<div class="col-md-8 <c:out value='${idErrCls}' />">
	    		<form:input path="name" cssClass="form-control" placeholder="이름"/>
	    		<form:errors path="name" cssClass="form-err"/>
	      	</div>
	    </div>
	    <div class="form-group row">
	    	<label for="pw" class="col-md-2 col-form-label">설명</label>
	    	<div class="col-md-10 <c:out value='${pwErrCls}' />">
	    		<form:textarea path="description" cssClass="ckeditor"/>
	      	</div>
	    </div>
	    <div class="form-group row required">
	    	<label for="pwConfirm" class="col-md-2 col-form-label">식별자</label>
	    	<div class="col-md-10">
	        	<form:input path="alias" cssClass="form-control" />
	        	<form:errors path="alias" />
	      	</div>
	    </div>
	   	<div class="form-group row required">
	    	<label for="startDate" class="col-md-2 col-form-label">시작일</label>
	    	<div class="col-md-4">
<!-- 	        	<input type="text" id="startDate"> -->
				<form:input path="startDate" cssClass="form-control" />
				<form:errors path="startDate" />
	      	</div>
	      	<label for="endDate" class="col-md-2 col-form-label">종료일</label>
	    	<div class="col-md-4">
<!-- 	        	<input type="text" id="startDate"> -->
				<form:input path="endDate" cssClass="form-control" />
				<form:errors path="endDate" />
	      	</div>
	    </div>
	   	<div class="form-group row">
	   		<label class="col-md-2 col-form-label">공개</label>
          	<div class="material-switch pull-right col-md-10">
            	<input type="checkbox" id="thePublic" name="thePublic"/>
            	<label for="thePublic" class="label-primary"></label>
          	</div>
	   	</div>
	   	<div class="form-group row">
	    	<div class="offset-sm-2 col-md-10">
	        	<button type="submit" class="btn btn-primary">만들기</button>
	 		</div>
	    </div>
	</form:form>
	</div>
</div>
</div>
</div>
</div>
</body>
</html>