/**
 * 
 */
$(document).ready(function(v,m){
	var ROOT_PATH = m.Enum.PATH,
		HTTP_METHOD = m.Enum.HttpMethod,
		SECURITY_ERROR = m.Enum.SecurityError,
		ALERT = m.Enum.Alert;
	
	return function(){
		//div message
		v.alertMsgInit();
		//loadmask 활성화
		v.enableLoadMask({el:$('body'), msg:'로그인 중입니다'});
		
		$(document).on('click', '#btnAjaxSubmit', function(event) {
			event.preventDefault();
			var $form = $('form input');
			
			m.ajax({
				url: ROOT_PATH + 'login',
				method: HTTP_METHOD.POST,
				hideMask: false,
				dataType: 'json',
				data: $form.serialize(),
				success: function(data, textStatus, jqXHR) {
					console.log(data);
					if(data.success) {
						window.location.href = ROOT_PATH + 'main';
					}
					else {
						var type = data.datas[0].type;
						var msg = '';
						
						switch(type) {
						case SECURITY_ERROR.ID:
							msg = '존재하지 않는 ID 입니다.';
							break;
						case SECURITY_ERROR.PW:
							msg = '비밀번호가 일치하지 않습니다.';
							break;
						case SECURITY_ERROR.AUTH:
							msg = '관리자 인증 대기중입니다.';
							break;
						case SECURITY_ERROR.ETC:
							msg = '기타오류 입니다.';
							break;
						default:
							break;
						}
						
						v.viewAlertMsg(ALERT.DANGER, msg);
						v.hideMask();
					}
				},
				error: function() {
					
				}
			});
		});
	}
}(
	common.view,
	common.model
));