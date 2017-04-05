$(document).ready(function(v,m) {
	
	jQuery.browser = {};
	
	return function() {
		
		//ckeditor init
		CKEDITOR.config.width = 'auto'; 	// 넓이
		CKEDITOR.config.height = 500; 		// 높이 // 퍼센트로 가능합니다.
		CKEDITOR.config.language = 'ko'; 	//일본어 // 영어 en
	    CKEDITOR.replace( 'description' , {
	        filebrowserImageUploadUrl: "ckeditor/plugins/imgupload.php"
	    });
	    
		/*jQuery.browser() removed

		The jQuery.browser() method has been deprecated since jQuery 1.3 and is removed in 1.9.
		If needed, it is available as part of the jQuery Migrate plugin.
		We recommend using feature detection with a library such as Modernizr.
		*/
	    jQuery.browser.msie = false;
	    jQuery.browser.version = 0;
	    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
	        jQuery.browser.msie = true;
	        jQuery.browser.version = RegExp.$1;
	    }
	    
	    $.datepicker.setDefaults({
	        dateFormat: 'yy-mm-dd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: 'Year'
	    });
	    
	    $("#startDate").datepicker();
	    $("#endDate").datepicker();
	    
	    $(document).on('click', '#thePublic', function(event) {
	    	console.log('etertertert');
	    	console.log($(this).is(':checked'));
	    });
	}
}(
	common.view,
	common.model
));