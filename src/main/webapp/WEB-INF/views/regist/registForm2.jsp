<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <div class="panel-body">
 <div class="container">
 <form method="post" action="/regist">
 	<div class="form-group row">
    	<label for="id" class="col-sm-2 col-form-label">아이디</label>
    	<div class="col-sm-8">
        	<input type="text" class="form-control" id="id" name="id" placeholder="아이디">
      	</div>
      	<div class="col-sm-2">
      		<button id="btnCheckDup" class="btn btn-primary">아이디 중복확인</button>
      	</div>
    </div>
    
    <div class="form-group row">
    	<label for="pw" class="col-sm-2 col-form-label">비밀번호</label>
    	<div class="col-sm-10">
        	<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
      	</div>
    </div>
    
    <div class="form-group row">
    	<label for="pwConfirm" class="col-sm-2 col-form-label">비밀번호 확인</label>
    	<div class="col-sm-10">
        	<input type="password" class="form-control" id="pwConfirm" placeholder="비밀번호 확인">
      	</div>
    </div>
    
    <div class="form-group row">
    	<label for="secondName" class="col-sm-2 col-form-label">이름</label>
    	<div class="col-sm-10">
        	<input type="text" class="form-control" id="secondName" name="sName" placeholder="이름">
      	</div>
    </div>
    
    <div class="form-group row">
    	<label for="firstName" class="col-sm-2 col-form-label">성</label>
    	<div class="col-sm-10">
        	<input type="text" class="form-control" id="firstName" name="fName" placeholder="성">
      	</div>
    </div>
    
    <div class="form-group row">
    	<label for="email" class="col-sm-2 col-form-label">이메일</label>
    	<div class="col-sm-10">
        	<input type="text" class="form-control" id="email" name="email" placeholder="이메일">
      	</div>
    </div>
    
   	<div class="form-group row">
    	<div class="offset-sm-2 col-sm-10">
        	<button type="submit" class="btn btn-primary">확인</button>
 		</div>
    </div>
</form>
</div>
</div>
