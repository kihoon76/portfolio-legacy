<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/project/task.css" />
<title>프로젝트 상세</title>
</head>
<content tag="item">
		<div class="row">
			<div class="col-md-9">
				<div>
		       	   <span class="pull-right" style="padding-bottom:5px;">
		               <a href="/project/details/task/new?pnum=${pnum}&pname=${pname}" class="btn btn-sm btn-primary">
		               <span class="glyphicon glyphicon-plus"></span>새일감 생성</a>
		           </span>
		        </div>   
				<div class="right-menu">
					<table class="table table-bordered table-hover">
						<tr>
							<th><input type="checkbox" /></th>	
							<th><a href="" >#▼</a></th>
							<th>유형</th>
							<th>상태</th>
							<th>우선순위</th>
							<th>제목</th>
							<th>담당자</th>
							<th>변경</th>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-3">
			<table class="table">
           		<tr>
           			<th>일감</th>
           		</tr>
           		<tr>
           			<td><a href="#">모든일감 보기</a></td>
           		</tr>
           		<tr>
           			<td><a href="#">요약</a></td>
           		</tr>
           		<tr>
           			<td><a href="#">달력</a></td>
           		</tr>
           		<tr>
           			<td><a href="#">Gantt 차트</a></td>
           		</tr>
           	</table>
			</div>
		</div>
</content> 
</html>