$(document).ready(function(v, m) {

	return function() {
		var str = $('#calendarData').val();
		var calendarData = jQuery.parseJSON(str);
		$('#calendar').fullCalendar({
			defaultDate: $(this).data('today'),//'2017-04-12',
			editable: false,
			eventLimit: true, // allow "more" link when too many events
//			events: [
//				{
//					title: 'All Day Event',
//					start: '2017-04-01',
//					end: '2017-04-01'
//				},
//				{
//					title: 'Long Event',
//					start: '2017-04-07',
//					end: '2017-04-10'
//				},
//				{
//					id: 999,
//					title: 'Repeating Event',
//					start: '2017-04-09T16:00:00'
//				},
//				{
//					id: 999,
//					title: 'Repeating Event',
//					start: '2017-04-16T16:00:00'
//				},
//				{
//					title: 'Conference',
//					start: '2017-04-11',
//					end: '2017-04-13'
//				},
//				{
//					title: 'Meeting',
//					start: '2017-04-12T10:30:00',
//					end: '2017-04-12T12:30:00'
//				},
//				{
//					title: 'Lunch',
//					start: '2017-04-12T12:00:00'
//				},
//				{
//					title: 'Meeting',
//					start: '2017-04-12T14:30:00'
//				},
//				{
//					title: 'Happy Hour',
//					start: '2017-04-12T17:30:00'
//				},
//				{
//					title: 'Dinner',
//					start: '2017-04-12T20:00:00'
//				},
//				{
//					title: 'Birthday Party',
//					start: '2017-04-13T07:00:00'
//				},
//				{
//					title: 'Click for Google',
//					url: 'http://google.com/',
//					start: '2017-04-28'
//				}
//			]
			events:calendarData
			}
		);
	}
}(
	common.view,
	common.model
));