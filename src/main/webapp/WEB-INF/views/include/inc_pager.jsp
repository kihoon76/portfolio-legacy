<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="pagination">
	<c:set var="doneLoop" value="false" />
	<c:if test="${requestScope.page.currentPage gt requestScope.page.blockPage}">
	<li><a href="/admin/mgmt/users?currentPage=${requestScope.page.startPage - 1}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
	</c:if>
	<c:forEach var="i" begin="${requestScope.page.startPage}" end="${requestScope.page.endPage}" step="1">
		<c:choose>
		<c:when test="${i > requestScope.page.totalPage}">
			<c:set var="doneLoop" value="true" />
		</c:when>
		<c:when test="${i eq requestScope.page.currentPage}">
		<li class="active"><a href="#">${i}</a></li>
		</c:when>
		<c:when test="${i ne requestScope.page.currentPage}">
		<li><a href="/admin/mgmt/users?currentPage=${i}">${i}</a></li>
		</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${requestScope.page.totalPage - requestScope.page.startPage >= requestScope.page.blockPage}">
	<li><a href="/admin/mgmt/users?currentPage=${requestScope.page.endPage + 1}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
	</c:if>
</ul>