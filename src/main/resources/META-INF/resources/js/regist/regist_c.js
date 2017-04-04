/**
 * 
 */
$(document).ready(function(v,m){
	var ROOT_PATH = m.Enum.PATH,
		HTTP_METHOD = m.Enum.HttpMethod;
	
	return function() {
		v.viewEmailInit();
		v.enableLoadMask({el:$('form'), msg:'아이디 중복확인 중입니다.'});
		m.makeEmailData();
		v.enableModal();
		
		$(document).on('click', '#btnCheckDup', function(event) {
			event.preventDefault();
			var $id = $('#id');
			
			m.ajax({
				url: ROOT_PATH + 'regist/checkId/' + $id.val(),
				method: HTTP_METHOD.GET,
				dataType: 'text',
				success: function(data, textStatus, jqXHR) {
					
					if(data == 'valid') {
						v.openModal('사용 가능한 아이디 입니다 ');
					}
					else {
						v.openModal('사용 중인 아이디 입니다.');
						$id.val('');
					}
				},
				error: function() {
					
				}
			});
		});
		
		$(document).on('click', '#btnConfirm', function(event) {
			m.makeEmailData();
			$('form').submit();
			v.enableLoadMask({el:$('body'), msg:'등록중입니다.'});
			v.showMask();
		});
	}
	
}(
	common.view,
	common.model
));