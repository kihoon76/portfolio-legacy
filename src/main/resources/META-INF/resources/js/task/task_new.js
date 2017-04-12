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
	    
	    $(document).on('click', '#taskOrder', function(event){
	    	console.log('hhhhhhhhhh');
	    	event.preventDefault();
	    	$(this).toggleClass('on');
	    });
	    
	}
}(
	common.view,
	common.model
));