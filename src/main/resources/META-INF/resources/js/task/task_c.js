$(document).ready(function(v,m) {
	var orderMark = '#▼';
	return function() {
	    
	    $(document).on('click', '#taskOrder', function(event){
	    	event.preventDefault();
	    	$(this).toggleClass('on');
	    	$(this).html((orderMark == '#▼' ? orderMark='#▲' : orderMark='#▲'));
	    });
	    
	}
}(
	common.view,
	common.model
));