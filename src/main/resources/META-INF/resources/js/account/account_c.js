/**
 * 
 */
$(document).ready(function(m,v){
	var ROOT_PATH = m.Enum.PATH,
		HTTP_METHOD = m.Enum.HttpMethod,
		ALERT = m.Enum.Alert;
	
	function makeEmailData() {
		var emailAccount = $('#emailAccount').val();
		var emailVender = '';
		
		if(v.isEmailDirect()) {
			emailVender = $('#txtEmailVender').val();
		}
		else {
			emailVender = $('#selEmailVender').val();
		}
		
		$('#hdnEmail').val(emailAccount + '@' + emailVender);
	}
	
	return function() {
		v.viewEmailInit('m');
		v.alertMsgInit();
		
		$(document).on('click', '#btnSave', function(event){
			var $form = $('form');
			makeEmailData();
			console.log($form.serialize());
			return;
			m.ajax({
				url: ROOT_PATH + 'my/account/modify',
				method: HTTP_METHOD.POST,
				dataType: 'json',
				data: $form.serialize(),
				success: function(data, textStatus, jqXHR) {
					
					if(data.success) {
						v.viewAlertMsg(ALERT.SUCCESS, '사용자 정보가 성공적으로 변경되었습니다.');
					}
					else {
						v.viewAlertMsg(ALERT.DANGER, '');
					}
				},
				error: function() {
					
				}
			});
		});
	}
	
}(
	common.model,
	common.view
));