<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
					    <label class="control-label" for="status">상태 : </label>
			    		<select id="status" class="selectpicker">
			    			<option>test</option>
			    		</select>
				  	</fieldset>
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