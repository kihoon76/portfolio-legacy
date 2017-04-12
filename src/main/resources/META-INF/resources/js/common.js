/**
 * 
 */
var common = function(){
	
	function Enum() {}
	Enum.HttpMethod = {GET: 'GET', POST: 'POST', PUT: 'PUT', DELETE: 'DELETE'};
	Enum.PATH = "http://localhost/"; //'http://192.168.50.29:8088/';
	Enum.SecurityError = {ID: 'ID', PW: 'PW', AUTH: 'AUTH', ETC: 'ETC'}
	Enum.Alert = {SUCCESS: 'success', INFO: 'info', WARNING: 'warning', DANGER: 'danger'}
	
	jQuery.browser = {};
	/*jQuery.browser() removed

	The jQuery.browser() method has been deprecated since jQuery 1.3 and is removed in 1.9.
	If needed, it is available as part of the jQuery Migrate plugin.
	We recommend using feature detection with a library such as Modernizr.
	*/
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
	
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
						var hideMask = (params.hideMask == undefined)?true:params.hideMask;
						
						if(common.view.isActiveMask() && hideMask) common.view.hideMask();
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
			isNull: function($el) {
				return ($el.get(0) == undefined);
			},
			isNotNull: function($el) {
				return !common.model.isNull($el)
			},
			makeEmailData: function() {
				var emailAccount = $('#emailAccount').val();
				var emailVender = '';
				
				if(common.view.isEmailDirect()) {
					emailVender = $('#txtEmailVender').val();
				}
				else {
					emailVender = $('#selEmailVender').val();
				}
				
				$('#email').val(emailAccount + '@' + emailVender);
				$('#emailDirect').val(common.view.isEmailDirect());
			}
		},
		view: function(){
			var emailDirect = false;
			var loadmask = false;
			var modal = false;
			var $loadEl;
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
			
			var isActiveAlertMsg = false;
			
			function run_waitMe(num, effect){
				//https://github.com/vadimsva/waitMe/blob/gh-pages/index.html
				fontSize = '';
				switch (num) {
					case 1:
					maxSize = '';
					textPos = 'vertical';
					fontSize = '25px';
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
				
				$loadEl.waitMe({
					effect: effect,
					text: loadTxt,
					bg: 'rgba(255,255,255,0.9)',
					color: '#000',
					maxSize: maxSize,
					source: 'img.svg',
					textPos: textPos,
					fontSize: fontSize,
					onClose: function() {}
				});
			}
			
			return {
				viewEmailModifyInit: function() {
					common.view.viewEmailInit('modify')
				},
				viewEmailInit: function(m) {
					/* selectbox class에 EMAIL 추가
					 * input text class에 EMAIL 추가
					 * <select class="form-control EMAIL">
					 * <input type="text" class="form-control email-direct EMAIL" />
					 * <div class="form-group" data-email-direct="true/false" id="dvEmail">(수정폼)
					 * */
					
					//수정폼에 있을때
					if(m == 'modify') {
						var $dvEmail = $('#dvEmail');
						if(common.model.isNotNull($dvEmail)) {
							var dataValue = $dvEmail.data('emailDirect'); 
							if(dataValue == undefined) {
								throw new Error('ID가 dvEmail인 div에 data-email-direct="[true|false]가 존재하지 않습니다"');
							};
							
							emailDirect = dataValue;
						}
						else {
							throw new Error('ID가 dvEmail인 요소가 존재하지 않습니다.');
						}
					}
					
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
							emailDirect = true;
						}
						else {
							emailDirect = false;
						}
					});
				
					$(document).on('click', 'button.EMAIL', function(event){
						var $inputEmail = $('input.EMAIL');
						$inputEmail.parent().toggle();
						$inputEmail.val('');
						
						var $selEmail = $('select.EMAIL');
						$selEmail.val('google.com');
						$selEmail.parent().toggle();
						
						emailDirect = false;
					});
				},
				isActiveMask: function() {
					return loadmask;
				},
				enableLoadMask: function(cfg) {
					loadmask = true;
					$loadEl = cfg.el || $('body');
					loadTxt = cfg.msg || loadTxt; 
				},
				showMask: function() {
					if(loadmask) {
						run_waitMe(1, loadEffects.bounce);
					}
				},
				hideMask: function() {
					if(loadmask) {
						$loadEl.waitMe('hide');
					}
				},
				isEmailDirect: function() {
					return emailDirect;
				},
				alertMsgInit: function() {
					var elStr = '<div class="msg-alert">' +
					   			'<div class="alert alert-danger collapse" id="dvMsg">' +
					   			//'<a href="#" class="close" data-dismiss="alert">&times;</a>' +
					   			'<strong id="strongAlert"></strong><span id="msgDetail"></span>' +
					   			'</div>' +
					   			'</div>';
					
					$('nav').after(elStr);
					isActiveAlertMsg = true;
				},
				viewAlertMsg: function(alert, msg) {
					if(isActiveAlertMsg) {
						var alertEnum = common.model.Enum.Alert;
						var $dvMsg = $('#dvMsg');
						switch(alert) {
						case alertEnum.SUCCESS:
							$dvMsg.attr('class', 'alert alert-success collapse');
							$('#strongAlert').html('성공!! ');
							break;
						case alertEnum.DANGER:
							$dvMsg.attr('class', 'alert alert-danger collapse');
							$('#strongAlert').html('실패!! ');
							break;
						case alertEnum.WARNING:
							$dvMsg.attr('class', 'alert alert-warning collapse');
							$('#strongAlert').html('경고!! ');
							break;
						case alertEnum.INFO:
							$dvMsg.attr('class', 'alert alert-info collapse');
							$('#strongAlert').html('알림!! ');
							break;
						default:
							$dvMsg.attr('class', 'alert alert-danger collapse');
							$('#strongAlert').html('실패!! ');
							break;
						}
						
						$('#msgDetail').html(msg);
						$dvMsg.show();
					}
					
				},
				enableModal: function() {
					var modalStr = '<div id="myModal" class="modal fade" role="dialog">' +
					  			   '<div class="modal-dialog">' +
					  			   '<!-- Modal content-->' +
					  			   '<div class="modal-content">' +
					  			   '	<div class="modal-header">' +
					  			   '	<button type="button" class="close" data-dismiss="modal">&times;</button>' +
					  			   '	<h4 class="modal-title">알림</h4>' +
					  			   '</div>' +
					  			   '<div class="modal-body">' +
					  			   '<p id="modalMsg"></p>' +
					  			   '</div>' +
					  			   '<div class="modal-footer">' +
					  			   '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>' +
					  			   '</div>' +
					  			   '</div>' +
					  			   '</div>' +
					  			   '</div>';
					
					modal = true;
					$('body').append(modalStr);
				},
				isActiveModal: function() {
					return modal;
				},
				openModal: function(msg) {
					if(common.view.isActiveModal()) {
						$('#modalMsg').html(msg);
						$('#myModal').modal('toggle');
					}
				},
				initDatePicker: function(cfg) {
	
				    var params = {
				        dateFormat: 'yy-mm-dd',
				        prevText: '이전 달',
				        nextText: '다음 달',
				        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
				        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
				        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				        showMonthAfterYear: true,
				        yearSuffix: '년'
				    };
				    
				    if(cfg) {
				    	params.dateFormat = cfg.dateFormat || params.dateFormat;
				    	$.datepicker.setDefaults(params);
				    	
				    	if(cfg.targets) {
				    		var len = cfg.targets.length;
				    		for(var i=0; i<len; i++) {
				    			$('#' + cfg.targets[i]).datepicker();
				    		}
				    	}
				    }
				},
				initCkeditor: function(cfg) {
					CKEDITOR.config.width = 'auto'; 	// 넓이
					CKEDITOR.config.height = 500; 		// 높이 // 퍼센트로 가능합니다.
					CKEDITOR.config.language = 'ko'; 	//일본어 // 영어 en
				    CKEDITOR.replace( cfg.target ,cfg.options);
				}
			}
		}(),
		controller: {},
		err:		{}
	}
}();