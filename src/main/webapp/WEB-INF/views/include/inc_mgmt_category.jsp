<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
	<tr>
		<th><button class="btn <c:if test="${param.category eq 'projects'}"><c:out value=" btn-danger " /></c:if><c:if test="${param.category ne 'projects'}"><c:out value=" btn-default " /></c:if> btn-xs">프로젝트</button></th>
	</tr>
	<tr>
		<td><button class="btn <c:if test="${param.category eq 'users'}"><c:out value=" btn-danger " /></c:if><c:if test="${param.category ne 'users'}"><c:out value=" btn-default " /></c:if> btn-xs">사용자</button></td>
	</tr>
	<tr>
		<td><button class="btn <c:if test="${param.category eq 'task_type'}"><c:out value=" btn-danger " /></c:if><c:if test="${param.category ne 'task_type'}"><c:out value=" btn-default " /></c:if> btn-xs"">일감유형</button></td>
	</tr>
</table>
