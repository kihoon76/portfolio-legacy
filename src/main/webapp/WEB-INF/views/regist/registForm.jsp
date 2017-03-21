<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <div class="panel-body">
 <div class="container">
 <form:form modelAttribute="userForm" method="POST">
 	<div class="form-group row">
    	<label for="id" class="col-sm-2 col-form-label">아이디</label>
    	<div class="col-sm-8">
    		<form:input path="id" cssClass="form-control" placeholder="아이디"/>
    		<form:errors path="id" cssClass=""/>
      	</div>
      	<div class="col-sm-2">
      		<button id="btnCheckDup" class="btn btn-primary">아이디 중복확인</button>
      	</div>
    </div>
    
    <div class="form-group row">
    	<label for="pw" class="col-sm-2 col-form-label">비밀번호</label>
    	<div class="col-sm-10">
    		<form:password path="pw" cssClass="form-control" placeholder="비밀번호"/>
    		<form:errors path="pw"/>
      	</div>
    </div>
    
    <div class="form-group row">
    	<label for="pwConfirm" class="col-sm-2 col-form-label">비밀번호 확인</label>
    	<div class="col-sm-10">
        	<input type="password" class="form-control" id="pwConfirm" placeholder="비밀번호 확인">
      	</div>
    </div>
    
    <div class="form-group row">
    	<label for="sName" class="col-sm-2 col-form-label">이름</label>
    	<div class="col-sm-10">
    		<form:input path="sName" cssClass="form-control" placeholder="이름" />
    		<form:errors path="sName" />
      	</div>
    </div>
    
    <div class="form-group row">
    	<label for="fName" class="col-sm-2 col-form-label">성</label>
    	<div class="col-sm-10">
    		<form:input path="fName" cssClass="form-control" placeholder="성" />
    		<form:errors path="fName" />
      	</div>
    </div>
    
    <div class="form-group row">
    	<label for="email" class="col-sm-2 col-form-label">이메일</label>
    	<div class="col-sm-10">
    		<form:input path="email" cssClass="form-control" placeholder="이메일" />
    		<form:errors path="email" />
      	</div>
    </div>
    
   	<div class="form-group row">
    	<div class="offset-sm-2 col-sm-10">
        	<button type="submit" class="btn btn-primary">확인</button>
 		</div>
    </div>
</form:form>
</div>
</div>
