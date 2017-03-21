<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="../../../resources/code_assist/bootstrap.css" />

<div class="table-responsive ">
	<table class="table">
		<tr>
			<th>IP</th>
			<th>PATH</th>
			<th>PARAMS</th>
			<th>REFERER</th>
			<th>USER_AGENT</th>
			<th>ACCESS_TIME</th>
		</tr>
		<c:forEach var="log" items="${logs}" varStatus="status">
		<tr>
			<td>${log.ip}</td>
			<td>${log.path}</td>
			<td>${log.params}</td>
			<td>${log.referer}</td>
			<td>${log.userAgent}</td>
			<td>${log.accessTime}</td>
		</tr>
		</c:forEach>
	</table>
</div>