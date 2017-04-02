$(document).ready(function(m, v) {
	var ROOT_PATH = m.Enum.PATH;
	
	return function() {
		var $form = $('form');
		
		$(document).on('change', '#selStatus', function(event) {
			$form.submit();
		});
		
		$(document).on('click', '#btnSearch', function(event) {
			$form.submit();
		});
		
		$(document).on('keypress', '#txtUser', function(event) {
			if(event.which == 13) {
				$form.submit();
			}
		});
		
		$(document).on('click', '#btnClean', function(event){
			var queryStr = $('form').serialize();
			var num = $(this).data('userNum');
			queryStr += '&userNum=' + num;
			
			window.location.href = ROOT_PATH + 'admin/mgmt/users/clean/?' + queryStr;
		});
	}
}(
	common.model,
	common.view
));