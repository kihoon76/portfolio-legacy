<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
				<div class="form-group">
            		<label class="control-label col-sm-2" for="email">이메일:</label>
            		<div class="col-sm-5">
            			<input type="text" class="form-control" id="email1" placeholder="이메일">
            		</div>
            		<div class="col-sm-5">
			            <select class="form-control EMAIL">
			                <option value="google.com" selected>google.com</option>
			                <option value="naver.com">naver.com</option>
			                <option value="direct">직접입력</option>
			            </select>
		            </div>
		            <div class="col-sm-5 input-group input-group-sm" style="display:none;">
		            	<input type="text" class="form-control EMAIL" placeholder="직접입력" style="height:34px">
		            	<span class="input-group-btn">
        					<button type="button" class="btn btn-default EMAIL" style="height:34px">GO</button>
    					</span>
		            </div>
		        </div>
		        
		        <div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="btn btn-primary" id="btnSave">저장</button>
					</div>
				</div>
				</form>
            </div>
            <div class="col-md-5">
            	<table>
            		<tr>
            			<td>내 계정</td>
            		</tr>
            		<tr>
            			<td>로그인:${user.id}</td>
            		</tr>
            		<tr>
            			<td>등록: ${user.regDate}</td>
            		</tr>
            		<tr>
            			<td>마지막 로그인 날짜:${user.lastLoginDate}</td>
            		</tr>
            		<tr>
            			<td>마지막 접속 IP :${user.loginIP}</td>
            		</tr>
            		<tr>
            			<td>나의 계정삭제</td>
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