<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" 	 uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>새일감</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script type="text/javascript" src="/resources/plugin/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/task/task_new.js"></script>
</head>
<content tag="item">
		<div class="container">
		<div class="row">
		<div class="well">
		<div class="panel panel-primary">
			<div class="panel-heading" style="padding:10px;">새 일감만들기</div>
			<div class="panel-body">
			<form:form cssClass="form-horizontal" modelAttribute="taskForm" method="POST" action="/project/details/task/new">
				<div class="form-group row required">
			    	<label for="typeNum" class="col-md-2 col-form-label">유형</label>
			    	<div class="col-md-8 <c:out value='${idErrCls}' />">
			    		<form:select path="typeNum" cssClass="form-control">
			    		<c:forEach var="taskType" items="${taskTypes}">
			    			<option value="${taskType.NUM}">${taskType.NAME}</option>
			    		</c:forEach>	
			    		</form:select>
			    		<form:errors path="typeNum" cssClass="form-err"/>
			      	</div>
			    </div>
			    <div class="form-group row">
			    	<label for="title" class="col-md-2 col-form-label">제목</label>
			    	<div class="col-md-10 <c:out value='${pwErrCls}' />">
			    		<form:input path="title" cssClass="form-control"/>
			    		<form:errors path="title" cssClass="form-err"/>
			      	</div>
			    </div>
			    <div class="form-group row required">
			    	<label for="description" class="col-md-2 col-form-label">설명</label>
			    	<div class="col-md-10">
			        	<form:textarea path="description" cssClass="ckeditor"/>
			      	</div>
			    </div>
			   	<div class="form-group row required">
			    	<label for="statusNum" class="col-md-2 col-form-label">상태</label>
			    	<div class="col-md-4">
						<form:select path="statusNum" cssClass="form-control">
						<c:forEach var="taskStatus" items="${taskStatuses}">
							<option value="${taskStatus.NUM}">${taskStatus.NAME}</option>
						</c:forEach>
						</form:select>
			      	</div>
			      	<label for="priorityNum" class="col-md-2 col-form-label">우선순위</label>
			    	<div class="col-md-4">
						<form:select path="priorityNum" cssClass="form-control">
						<c:forEach var="taskPriority" items="${taskPriorities}">
							<option value="${taskPriority.NUM}">${taskPriority.NAME}</option>
						</c:forEach> 
						</form:select>
			      	</div>
			    </div>
			   	<div class="form-group row required">
			    	<label for="responsibilityNum" class="col-md-2 col-form-label">담당자</label>
			    	<div class="col-md-4">
			    		<form:select path="responsibilityNum" cssClass="form-control">
						<c:forEach var="taskResponsibility" items="${taskResponsibilities}">
							<option value="${taskResponsibility.NUM}">${taskResponsibility.F_NAME}${taskResponsibility.S_NAME}(${taskResponsibility.ID})</option>
						</c:forEach> 
						</form:select>
			      	</div>
			      	<label for="progress" class="col-md-2 col-form-label">진척도</label>
			    	<div class="col-md-4">
						<form:select path="progress" cssClass="form-control">
							<option value="0">0%</option>
							<option value="10">10%</option>
							<option value="20">20%</option>
							<option value="30">30%</option>
							<option value="40">40%</option>
							<option value="50">50%</option>
							<option value="60">60%</option>
							<option value="70">70%</option>
							<option value="80">80%</option>
							<option value="90">90%</option>
							<option value="100">100%</option>
						</form:select>
			      	</div>
			    </div>
			    <div class="form-group row required">
			    	<label for="startDate" class="col-md-2 col-form-label">시작일</label>
			    	<div class="col-md-4">
						<form:input path="startDate" cssClass="form-control" />
						<form:errors path="startDate" />
			      	</div>
			      	<label for="endDate" class="col-md-2 col-form-label">종료일</label>
			    	<div class="col-md-4">
						<form:input path="endDate" cssClass="form-control" />
						<form:errors path="endDate" />
			      	</div>
			    </div>
			   	<div class="form-group row">
			    	<div class="offset-sm-2 col-md-10">
			        	<button type="submit" class="btn btn-primary">만들기</button>
			 		</div>
			    </div>
 			    <input type="hidden" name="projectNum" value="${pnum}" /> 
 			    <input type="hidden" name="projectName" value="${pname}" />
			</form:form>
			</div>
		</div>
		</div>
		</div>
		</div>
</content> 
</html>