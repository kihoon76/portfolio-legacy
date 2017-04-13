$(document).ready(function(v, m) {
	
	//https://fullcalendar.io/docs/
	//http://www.jqueryscript.net/other/Animated-jQuery-Content-Hover-Effect-Plugin-Content-Hover.html
	return function() {
		var str = $('#calendarData').val();
		var tooltip;
		
		var calendarData = jQuery.parseJSON(str);
		$('#calendar').fullCalendar({
			defaultDate: $(this).data('today'),//'2017-04-12',
			editable: false,
			eventLimit: true, // allow "more" link when too many events
			events:calendarData,
			eventMouseover: function(event, jsEvent, view) {
				tooltip.setContent(event.title);
		    }
		});
		
		tooltip = new jBox('Tooltip', {
		  attach: 'span.fc-title',
		  width: 280,
		  closeOnMouseleave: true,
		  animation: 'zoomIn',
		  content: 'I won\'t close when you move your mouse over me'
		});
		
		console.log(tooltip.options.content);
	}
}(
	common.view,
	common.model
));