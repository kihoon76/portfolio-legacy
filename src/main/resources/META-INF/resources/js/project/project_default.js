$(document).ready(function(v,m){
	var ROOT_PATH   = m.Enum.PATH,
		HTTP_METHOD = m.Enum.HttpMethod;
	
	return function() {
		var url = ROOT_PATH + 'project/details/';
		
		$(document).on('click', '.nav-tabs a', function(event) {
			
			var detail = $(this).data('projectDetails');
			window.location.href = url + detail;
		});
	}
}(
	common.view,
	common.model
));