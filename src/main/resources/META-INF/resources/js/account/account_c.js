/**
 * 
 */
$(document).ready(function(m,v){
	var ROOT_PATH = m.Enum.PATH,
		HTTP_METHOD = m.Enum.HttpMethod,
		ALERT = m.Enum.Alert;
	
	return function() {
		v.viewEmailModifyInit();
		v.alertMsgInit();
		
		v.enableLoadMask({el:$('body'), msg:'사용자 정보 수정중입니다 '});
		
		$(document).on('click', '#btnSave', function(event){
			var $form = $('form');
			m.makeEmailData();
			//console.log($form.serialize());
			//return;
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
						v.viewAlertMsg(ALERT.DANGER, '사용자 정보 변경시 오류가 발생했습니다.');
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