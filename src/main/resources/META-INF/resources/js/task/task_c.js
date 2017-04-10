$(document).ready(function(v,m) {
	
	return function() {
	    v.initCkeditor({
	    	target: 'description',
	    	options: {
	    		filebrowserImageUploadUrl: "ckeditor/plugins/imgupload.php"
	    	}
	    })
	    
	    v.initDatePicker({
	    	targets: ['startDate','endDate']
	    })
	    
	}
}(
	common.view,
	common.model
));