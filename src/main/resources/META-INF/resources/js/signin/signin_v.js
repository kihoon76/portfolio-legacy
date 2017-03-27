/**
 * 
 */
$(document).ready(function(v) {
	var $msgDetail = null;
	var $msg = null;
	
	v.viewErrorMsg = function(msg) {
		if($msgDetail == null) $msgDetail = $('#msgDetail');
		if($msg == null) $msg = $('#dvMsg');
		
		$msgDetail.html(msg);
		$msg.show();
	}
}(
	common.view
));