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
            	<form class="form-horizontal" method="post" action="/login">
            	<div class="form-group">
					<fieldset>
				    	<legend>검색조건</legend>
					    <label class="control-label col-sm-2" for="status">상태 : </label>
					    <div class="col-sm-3">
			    		<select id="status" class="form-control">
			    			<option selected>모두</option>
			    			<c:if test="${empty map}">
			    			<option>승인완료(0)</option>
			    			<option>승인대기(0)</option>
			    			</c:if>
			    			<c:if test="${not empty map}">
			    			<option>승인완료(<c:if test="${map.containsKey('Y')}"><c:out value="${map['Y']}" /></c:if><c:if test="${!map.containsKey('Y')}">0</c:if>)</option>
			    			<option>승인대기(<c:if test="${map.containsKey('N')}"><c:out value="${map['N']}" /></c:if><c:if test="${!map.containsKey('N')}">0</c:if>)</option>
			    			</c:if>
			    		</select>
			    		</div>
			    		<label class="control-label col-sm-2" for="status">사용자 : </label>
			    		<div class="col-sm-5 input-group ">
			    			<input type="text" class="form-control" id="user" placeholder="사용자 검색" />
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
			  				<td>${user.admin}</td>
			  				<td>${user.email}</td>
			  				<td>test</td>
			  			</tr>
			  			</c:forEach>
			  		</table>
			  	</div>
				</form>
            </div>
            <div class="col-md-3">
            	<table class="table">
            		<tr>
            			<th>내 계정</th>
            		</tr>
            		<tr>
            			<td>로그인</td>
            		</tr>
            		<tr>
            			<td>등록</td>
            		</tr>
            		<tr>
            			<td>마지막 로그인 날짜</td>
            		</tr>
            		<tr>
            			<td>마지막 접속 IP</td>
            		</tr>
            	</table>
            </div>
        </div> 

  	</div>
</div>
</div>
</div>
</div>
</div>