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
			var loadElStr;
			var loadTxt = 'Please wait...';
			var loadEffects = {
					bounce: 'bounce',
					rotateplane: 'rotateplane',
					stretch: 'stretch',
					orbit: 'orbit',
					roundBounce: 'roundBounce',
					win8: 'win8',
					win8_linear: 'win8_linear',
					ios: 'ios',
					facebook: 'facebook',
					rotation: 'rotation',
					timer: 'timer',
					pulse: 'pulse',
					progressBar: 'progressBar',
					bouncePulse: 'bouncePulse'
			};
			
			function run_waitMe(el, num, effect){
				fontSize = '';
				switch (num) {
					case 1:
					maxSize = '';
					textPos = 'vertical';
					break;
					case 2:
					loadTxt = '';
					maxSize = 30;
					textPos = 'vertical';
					break;
					case 3:
					maxSize = 30;
					textPos = 'horizontal';
					fontSize = '18px';
					break;
				}
				
				el.waitMe({
					effect: effect,
					text: loadTxt,
					bg: 'rgba(255,255,255,0.7)',
					color: '#000',
					maxSize: maxSize,
					source: 'img.svg',
					textPos: textPos,
					fontSize: fontSize,
					onClose: function() {}
				});
			}
			
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
				enableLoadMask: function(cfg) {
					loadmask = true;
					loadElStr = cfg.el || 'body';
					loadTxt = cfg.msg || loadTxt; 
				},
				showMask: function() {
					if(loadmask) {
						run_waitMe($(loadElStr), 1, loadEffects.bounce);
					}
				},
				hideMask: function() {
					if(loadmask) {
						$(loadElStr).waitMe('hide');
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