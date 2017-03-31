<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
<div class="row">
<div class="well">
<div class="panel panel-primary">
	<div class="panel-heading">사용자</div>
	<div class="panel-body">
		 <div class="row">
            <div class="col-md-9" style="border-right:solid 1px #A9A9A9;">
            	<form class="form-horizontal" action="/admin/mgmt/users/search">
            	<div class="form-group">
					<fieldset>
				    	<legend>검색조건</legend>
					    <label class="control-label col-sm-2" for="status">상태 : </label>
					    <div class="col-sm-3">
			    		<select id="selStatus" class="form-control" name="status">
			    			<option value="A" <c:if test="${status eq 'A'}"><c:out value="selected" /></c:if>>모두</option>
			    			<c:if test="${empty map}">
			    			<option value="Y" <c:if test="${status eq 'Y'}"><c:out value="selected" /></c:if>>승인완료(0)</option>
			    			<option value="N" <c:if test="${status eq 'N'}"><c:out value="selected" /></c:if>>승인대기(0)</option>
			    			</c:if>
			    			<c:if test="${not empty map}">
			    			<option value="Y" <c:if test="${status eq 'Y'}"><c:out value="selected" /></c:if>>승인완료(<c:if test="${map.containsKey('Y')}"><c:out value="${map['Y']}" /></c:if><c:if test="${!map.containsKey('Y')}">0</c:if>)
			    			<option value="N" <c:if test="${status eq 'N'}"><c:out value="selected" /></c:if>>승인대기(<c:if test="${map.containsKey('N')}"><c:out value="${map['N']}" /></c:if><c:if test="${!map.containsKey('N')}">0</c:if>)</option>
			    			</c:if>
			    		</select>
			    		</div>
			    		<label class="control-label col-sm-2" for="status">사용자 : </label>
			    		<div class="col-sm-5 input-group ">
			    			<input type="text" class="form-control" id="txtUser" placeholder="사용자 검색" name="username" value="<c:if test='${userName ne null}'><c:out value='${userName}' /></c:if>" >
			    			<span class="input-group-btn">
	        					<button type="button" class="btn btn-default" id="btnSearch"><span class="glyphicon glyphicon-search"></span></button>
	    					</span>
			    		</div>
				  	</fieldset>
			  	</div>
			  	<div class="form-group" style="padding:10px;">
			  		<table class="table table-striped table-bordered">
			  			<tr>
			  				<th class="col-xs-2">이름</th>
			  				<th class="col-xs-1">성</th>
			  				<th class="col-xs-1">관리자</th>
			  				<th class="col-xs-4">이메일</th>
			  				<th class="col-xs-4">#</th>
			  			</tr>
			  			<c:forEach var="user" items="${users}" varStatus="status">
			  			<tr>
			  				<td>${user.sName}</td>
			  				<td>${user.fName}</td>
			  				<td><c:if test="${user.admin eq true}"><span class="glyphicon glyphicon-ok" style="color:green;"></span></c:if></td>
			  				<td>${user.email}</td>
			  				<td><c:if test="${user.authorized eq true}"><span class="glyphicon glyphicon-ok-circle">활성화됨</span></c:if><c:if test="${user.authorized eq false}"><span class="glyphicon glyphicon-ban-circle" style="color:red;">비활성화</span><button type="button" class="btn btn-xs btn-primary" id="btnClear">해제</button></c:if></td>
			  			</tr>
			  			</c:forEach>
			  		</table>
			  	</div>
			  	<div class="form-group" style="padding-left:10px;">
			  		<ul class="pagination pagination-sm">
					  <li><a href="#">1</a></li>
					  <li><a href="#">2</a></li>
					  <li><a href="#">3</a></li>
					  <li class="disabled"><a href="#">4</a></li>
					  <li><a href="#">5</a></li>
					</ul>
			  	</div>
				</form>
            </div>
            <div class="col-md-3">
            	<table class="table">
            		<tr>
            			<th><button class="btn btn-default btn-xs">프로젝트</button></th>
            		</tr>
            		<tr>
            			<td><button class="btn btn-danger btn-xs">사용자</button></td>
            		</tr>
            		<tr>
            			<td><button class="btn btn-default btn-xs">일감유형</button></td>
            		</tr>
            	</table>
            	<%--
            	<jsp:include page="file.jsp" >
				  <jsp:param name="firstname" value="Chaitanya" />
				  <jsp:param name="middlename" value="Pratap" />
				  <jsp:param name="lastname" value="Singh" />
				</jsp:include>
				
				${param.firstname}<br>
				${param.middlename}<br>
				${param.lastname}
            	 --%>
            </div>
        </div> 

  	</div>
</div>
</div>
</div>
</div>
</div>