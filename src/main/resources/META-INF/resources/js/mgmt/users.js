$(document).ready(function(m, v) {
	
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
	}
}(
	common.model,
	common.view
));