//SETTING UP OUR POPUP
//0 means disabled; 1 means enabled;
var popupStatus = 0;
//loading popup with jQuery magic!
function loadPopup(element){
	//loads popup only if it is disabled
	if (popupStatus == 0) {
		$("#popup_background").fadeIn("fast");
		$('#'+ element).fadeIn("fast");
		popupStatus = 1;
	}
}

//disabling popup with jQuery magic!
function disablePopup(element){
	$("#popup_background").fadeOut("slow");
	$('.'+ element).fadeOut("slow");
	popupStatus = 0;
}

//centering popup
function centerPopup(element){
	//request data for centering
	var windowWidth = document.documentElement.clientWidth;
	var windowHeight = document.documentElement.clientHeight;
	var popupHeight = $('#'+ element).height();
	var popupWidth = $('#'+ element).width();
	//centering
	$('#'+ element).css({
		"position": "absolute",
		"top": windowHeight / 2 - popupHeight / 2,
		"left": windowWidth / 2 - popupWidth / 2
	}).fadeIn(500);
	//only need force for IE6

  $("#popup_background").fadeIn("fast");

}

//CONTROLLING EVENTS IN jQuery
$(document).ready(function(){
  
  $("a.request_popup").live('click', function(){
		//centering with cs$('.request_content').html(
		$.getScript(this.href);
		centerPopup($(this).attr('rel'));
		//load popup
		loadPopup($(this).attr('rel'));
		return false;
	});
  
  
	//LOADING POPUP
	//Click the button event!
	$("a.popup").live('click', function(){
		//centering with cs
    //$('.id_of_photo').attr('action', '/photos/'+ $(this).attr("id"));
    //$('.id_of_photo').find('.hidden_id').attr('value', $(this).attr("title"));
    //$('.id_of_photo').find('.hidden_id').attr('value', $(this).attr("title"));
		centerPopup($(this).attr('rel'));
		//load popup
		loadPopup($(this).attr('rel'));
		return false;
	});

	//CLOSING POPUP
	//Click the x event!
	$(".popupContactClose").live('click', function(){
		disablePopup($(this).attr('rel'));
		return false;
	});

});
