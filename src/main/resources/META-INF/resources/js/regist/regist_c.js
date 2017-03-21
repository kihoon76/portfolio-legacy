/**
 * 
 */
$(document).ready(function(v,m){
	var ROOT_PATH = m.Enum.PATH,
		HTTP_METHOD = m.Enum.HttpMethod;
	
	$(document).on('click', '#btnCheckDup', function(event) {
		event.preventDefault();
		var $id = $('#id');
		
		m.ajax({
			url: ROOT_PATH + 'regist/checkId/' + $id.val(),
			method: HTTP_METHOD.GET,
			dataType: 'text',
			success: function(data, textStatus, jqXHR) {
				if(data == 'valid') {
					alert('사용 가능한 아이디 입니다 ');
				}
				else {
					alert('사용중인 아이디 입니다 ');
					$id.val('');
				}
			},
			error: function() {
				
			}
		});
		
		
	});
	
}(
	common.view,
	common.model
));