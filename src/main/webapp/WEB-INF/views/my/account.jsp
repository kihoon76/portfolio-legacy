<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="emailAccount" value="${fn:split(user.email, '@')[0]}" />
<c:set var="emailVender" value="${fn:split(user.email, '@')[1]}" />
<c:set var="isEmailDirect" value="${user.emailDirect}" />

<div class="container">
<div class="row">
<div class="well">
<div class="panel panel-primary">
	<div class="panel-heading">내계정</div>
	<div class="panel-body">
		 <div class="row">
            <div class="col-md-7" style="border-right:solid 1px #A9A9A9;">
            	<form class="form-horizontal" method="post" action="/login">
				<div class="form-group">
					<label class="control-label col-sm-2" for="sName">이 름:</label>
					<div class="col-sm-10">
		     			<input type="text" class="form-control" id="sName" name="sName" placeholder="이름" value="${user.sName}">
		   			</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="fName">성:</label>
					<div class="col-sm-10">
				    	<input type="text" class="form-control" id="fName" name="fName" placeholder="성" value="${user.fName}">
				    </div>
				</div>
				<div class="form-group" data-email-direct="${isEmailDirect}" id="dvEmail">
            		<label class="control-label col-sm-2" for="email">이메일:</label>
            		<div class="col-sm-5">
            			<input type="text" class="form-control" id="emailAccount" placeholder="이메일" value='<c:out value="${emailAccount}" />'>
            		</div>
            		<div class="col-sm-4 input-group mb-2 mr-sm-2 mb-sm-0" <c:if test="${isEmailDirect eq true}">style="display:none;"</c:if>>
            			<div class="input-group-addon">@</div>
			            <select class="form-control EMAIL" id="selEmailVender">
			                <option value="google.com" selected>google.com</option>
			                <option value="naver.com">naver.com</option>
			                <option value="direct">직접입력</option>
			            </select>
		            </div>
		            <div class="col-sm-4 input-group input-group-sm" <c:if test="${isEmailDirect ne true}">style="display:none;"</c:if>>
		            	<div class="input-group-addon">@</div>
		            	<input type="text" class="form-control email-direct EMAIL" placeholder="직접입력" value="${emailVender}" id="txtEmailVender">
		            	<span class="input-group-btn">
        					<button type="button" class="btn btn-default email-direct-btn EMAIL"><span class="glyphicon glyphicon-repeat"></span></button>
    					</span>
		            </div>
		        </div>
		        
		        <div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="btn btn-primary" id="btnSave">저장</button>
					</div>
				</div>
				<input type="hidden" id="hdnEmail" name="email" />
				<input type="hidden" id="hdnEmailDirect" name="emailDirect" />
				</form>
            </div>
            <div class="col-md-5">
            	<table>
            		<tr>
            			<th>내 계정</th>
            		</tr>
            		<tr>
            			<td>로그인:${user.id}</td>
            		</tr>
            		<tr>
            			<td>등록: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${user.regDate}"/>   </td>
            		</tr>
            		<tr>
            			<td>마지막 로그인 날짜:<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${user.lastLoginDate}" /></td>
            		</tr>
            		<tr>
            			<td>마지막 접속 IP :${user.loginIP}</td>
            		</tr>
            		<tr>
            			<td><a href="#"><span class="glyphicon glyphicon-trash">나의계정삭제</span></a></td>
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