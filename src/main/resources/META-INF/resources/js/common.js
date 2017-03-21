/**
 * 
 */
var common = function(){
	
	function Enum() {}
	Enum.HttpMethod = {GET: 'GET', POST: 'POST', PUT: 'PUT', DELETE: 'DELETE'};
	Enum.PATH = 'http://localhost:8088/';
	
	return {
		model: {
			ajax: function(params) {
				$.ajax(params.url, {
					async: (params.async == null)? true : params.async,
					beforeSend: function(xhr) {
						if(params.beforeSend && typeof params.beforeSend === 'function') {
							params.beforeSend();
						}
					},
					contentType: params.contentType || 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType: params.dataType || 'json',
					method: params.method || common.model.Enum.HttpMethod.POST,
					complete: function() {
						console.log("###### Ajax Completed ######")
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
		view:		{},
		controller: {},
		err:		{}
	}
}();