<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트</title>
<link rel="stylesheet" href="/resources/css/project/projectlist.css" />
<link rel="stylesheet" href="/resources/css/check_switch.css" />
</head>
<body>
<div class="container">
<div class="row">
<div class="well">
<div class="panel panel-primary">
	<div class="panel-heading">프로젝트</div>
	<div class="panel-body">
		 <div class="row">
		 	<div class="col-md-12 project-topbar bottom-line">
        	   <span class="pull-right" style="padding-bottom:5px;">
                    <a href="/project/new" class="btn btn-sm btn-primary">
                    <span class="glyphicon glyphicon-plus"></span>새프로젝트 생성</a>
                </span>   
			</div>
            <div class="col-md-7 right-menu">
            	<c:if test="${!empty list}">
				<table class="table">
					<c:forEach var="project" items="${list}">
					<tr>
						<td>
						<c:if test="${project.myProject}"><a href="/project/details/outline?pnum=${project.num}&pname=${project.name}"><span class="glyphicon glyphicon-question-sign">${project.name}</span></c:if></a>
						<c:if test="${!project.myProject}"><a href="/project/details/outline?pnum=${project.num}&pname=${project.name}">${project.name}</a></c:if>
						</td>
					</tr>
					</c:forEach>
				</table>
				</c:if>
            </div>
            <div class="col-md-5">
            	<table class="table">
            		<tr>
            			<th>프로젝트</th>
            		</tr>
            		<tr>
            			<td>
            			 닫힌 프로젝트보기
                        <div class="material-switch pull-right">
                            <input id="someSwitchOptionPrimary" name="someSwitchOption001" type="checkbox"/>
                            <label for="someSwitchOptionPrimary" class="label-primary"></label>
                        </div>
            			</td>
            		</tr>
            		<tr>
            			<td><button type="button" class="btn btn-success">적용</button></td>
            		</tr>
            	</table>
            </div>
        </div> 

  	</div>
</div>
</div>
</div>
</div>
</body>
</html>