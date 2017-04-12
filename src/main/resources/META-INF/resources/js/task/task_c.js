$(document).ready(function(v,m) {
	
	return function() {
	    
	    $(document).on('click', '#taskOrder', function(event){
	    	$(this).toggleClass('on');
	    	var href = $(this).attr('href');
	    	var soonseo = $(this).data('order');
	    	
	    	if(soonseo == 'desc') {
	    		href=href.replace('order=desc', 'order=asc');
	    	}
	    	else {
	    		soonseo = 'desc';
	    		href=href.replace('order=asc', 'order=desc');
	    	}
	    	
	    	$(this).attr('href', href);
	    });
	    
	}
}(
	common.view,
	common.model
));