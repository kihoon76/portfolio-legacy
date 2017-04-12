<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>프로젝트 상세</title>
<link rel="stylesheet" href="/resources/css/project/calendar/fullcalendar.min.css" />
<link rel="stylesheet" href="/resources/css/project/calendar/fullcalendar.print.min.css" media="print" />
<link rel="stylesheet" href="/resources/css/project/calendar.css" />
<script type="text/javascript" src="/resources/js/lib/moment.min.js"></script>
<script type="text/javascript" src="/resources/js/project/calendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="/resources/js/project/calendar_c.js"></script>
</head>
<c:set var="today" value="<%=new java.util.Date() %>" />
<content tag="item">
	<div id="calendar" data-today="<fmt:formatDate pattern='yyyy-MM-dd' value='${today}' />" ></div>
	<input type="hidden" id="calendarData" value='${calendarData}' />
</content> 
</html>