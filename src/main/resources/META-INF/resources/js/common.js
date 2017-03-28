/**
 * 
 */
var common = function(){
	
	function Enum() {}
	Enum.HttpMethod = {GET: 'GET', POST: 'POST', PUT: 'PUT', DELETE: 'DELETE'};
	Enum.PATH = 'http://localhost:8088/';
	Enum.SecurityError = {ID: 'ID', PW: 'PW', AUTH: 'AUTH', ETC: 'ETC'}
	
	return {
		model: {
			ajax: function(params) {
				$.ajax(params.url, {
					async: (params.async == null)? true : params.async,
					beforeSend: function(xhr) {
						if(common.view.isActiveMask()) common.view.showMask();
						
						if(params.beforeSend && typeof params.beforeSend === 'function') {
							params.beforeSend();
						}
					},
					contentType: params.contentType || 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType: params.dataType || 'json',
					method: params.method || common.model.Enum.HttpMethod.POST,
					complete: function() {
						console.log("###### Ajax Completed ######");
						if(common.view.isActiveMask()) common.view.hideMask();
					},
					context: params.context || document.body,
					data: params.data,
					statusCode: {
						404: function() {
							console.log('Page not found');
						}
					},
					success: function(data, textStatus, jqXHR) {
						if(!params.success || typeof params.success !== 'function') {
							throw new Error('success function not defined');
						}
						
						params.success(data, textStatus, jqXHR);
					},
					error: function(jqXHR, textStatus, e) {
						if(!params.error || typeof params.error !== 'function') {
							//Default 동작
						}
						else {
							params.error(jqXHR, textStatus, e);
						}
					},
					timeout: params.timeout || 2000
				});
			},
			Enum: Enum,
		},
		view: function(){
			var emailMode = 'select';
			var loadmask = false;
			var $body = null;
			
			return {
				selectDirectEmailInit: function() {
					//selectbox class에 EMAIL 추가
					//input text class에 EMAIL 추가
					$(document).on('change', 'select.EMAIL', function(event) {
						console.log("##### 직접입력 선택 #####");
						var email = $(this).val();
						var $selParent;
						var $txtParent;
						
						//직접선택이면
						if(email == 'direct') {
							$selParent = $(this).parent();
							//if($.nodeName($selParent, 'div')) {
							$selParent.toggle();
							//}
							
							$txtParent = $('input.EMAIL').parent();
							//if($.nodeName($txtParent, 'div')) {
							$txtParent.toggle();
							//}
							emailMode = 'input';
						}
						else {
							emailMode = 'select';
						}
					});
				
					$(document).on('click', 'button.EMAIL', function(event){
						var $inputEmail = $('input.EMAIL');
						$inputEmail.parent().toggle();
						$inputEmail.val('');
						
						var $selEmail = $('select.EMAIL');
						$selEmail.val('google.com');
						$selEmail.parent().toggle();
						
						emailMode = 'select';
					});
				},
				isActiveMask: function() {
					return loadmask;
				},
				enableLoadMask: function() {
					loadmask = true;
					$body = $('body');
				},
				showMask: function() {
					if(loadmask) {
						$body.showLoading();
					}
				},
				hideMask: function() {
					if(loadmask) {
						$body.hideLoading();
					}
				},
				getEmailMode: function() {
					return emailMode;
				},
			}
		}(),
		controller: {},
		err:		{}
	}
}();