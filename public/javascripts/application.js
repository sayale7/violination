// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// ready when document has loaded
$(document).ready(function() {


  /* This is basic - uses default settings */

  $("a.single_image").fancybox({
    'transitionIn'	:	'elastic',
    'transitionOut'	:	'elastic',
    'speedIn'		:	400, 
    'speedOut'		:	200, 
    'overlayShow'	:	true,
    'overlayOpacity' : 0.7,
    'titlePosition': 'over',
    'autoScale': true
  });

  /* Using custom settings */

  $("a#inline").fancybox({
    'transitionIn'	:	'elastic',
    'transitionOut'	:	'elastic',
    'speedIn'		:	400, 
    'speedOut'		:	200, 
    'overlayShow'	:	true,
    'overlayOpacity' : 0.7,
    'hideOnContentClick': false,
    'titleShow': false
  });

  /* Apply fancybox to multiple items */

  $("a.group").fancybox({
    'transitionIn'	:	'elastic',
    'transitionOut'	:	'elastic',
    'speedIn'		:	400, 
    'speedOut'		:	200, 
    'overlayShow'	:	true,
    'overlayOpacity' : 0.7,
    'titlePosition': 'over',
    'autoScale': true
  });
  

  //hide edit link if js is enabled (show instrument)
   $('.edit_instrument').remove();
  // $('a.new_instrument').show();
  // $('.instrument_kind').hide();
  // 
  // $('a.new_instrument').click(function(){
  //   $('.instrument_kind').show();
  // });
  


	
	
	// hide and workshop_description
  $('#workshop_description_form').hide();
  
  //toggle workshop description    
  $("#workshop_description_open_link").live('click', function () { 
   $(this).fadeOut(200);
   $('#workshop_description_form').show(500).fadeIn(100);
   return false
  });
  $("#workshop_description_cancel_link").live('click', function () { 
   $('#workshop_description_form').hide(800).fadeOut(500);
   $("#workshop_description_open_link").fadeIn(500);
   return false
  });
	
	// toggle photo_upload
  $('.new_image_upload_form, #thumbnails, .close img').hide();
  
	$('.photo_upload h2').toggle(function() {
    $('.open img').fadeOut('slow', function(){
	    $(".close img").fadeIn('slow');
	  });
		$('.new_image_upload_form, #thumbnails').show(500).fadeIn(100);
  }, function() {
    $('.close img').fadeOut('slow', function(){
	    $(".open img").fadeIn('slow');
	  });
		$('.new_image_upload_form, #thumbnails').hide(800).fadeOut(500);
  });


  //hide and toggle workshop tags
  $('.show_workshop_tags_item .row').hide();
  
  $('.show_workshop_tags_item h2').toggle(function() {
    var the_div = $(this).parent();
    the_div.find('.open img').fadeOut('fast', function(){
      the_div.find(".close img").fadeIn('fast');
    });
    the_div.find('.row').show(100).fadeIn(50);
  }, function() {
    var the_div = $(this).parent();
    the_div.find('.close img').fadeOut('fast', function(){
      the_div.find(".open img").fadeIn('fast');
    });
    the_div.find('.row').hide(100).fadeOut(50);
  });


  // delete images
  $('a.delete_photo').live('click', function(){
		$.getScript(this.href);
		$(this).parent().parent().html('<img src="/images/ajax-loader.gif"/>');
		return false;
	});
	
	//update images
	$('.edit_photo').live('submit', function(e){
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
		$('.popupContact').fadeOut('slow');
		return false;
	});

  // for toggle edit links 
  $('.instance_tag_js').live('mouseover', function(){
    $(this).find('.edit_tag_links').css('display', 'block');
  }).live('mouseout', function(){
    $(this).find('.edit_tag_links').css('display', 'none');
  });
  
  $('#instance_tag_without_children a, #instance_tag_with_children a, #available_instance_tags_js a').live('click', function(){
    if($(this).attr('rel') == 'edit'){
      $('.instance_tag_edit').hide();
      $('.instance_tag_show').show();
      $(this).parent().parent().hide();
      $(this).parent().parent().parent().find('.instance_tag_edit').fadeIn('slow'); 
      return false;
    }
    else if($(this).attr('rel') == 'close'){
      $(this).parent().parent().hide();
      $(this).parent().parent().parent().find('.instance_tag_show').fadeIn('slow');
      return false;
    }


    else if($(this).attr('rel') == 'edit_workshop_tags'){
      $('#available_instance_tags_js').html('<img src="/images/ajax-loader.gif"/>');
      $('#added_instance_tags ').html('<img src="/images/ajax-loader.gif"/>');
      $.getScript(this.href);
      return false;
    }
    else{
      $(this).parent().parent().html('<img src="/images/ajax-loader.gif"/>');
      $.getScript(this.href);
      return false;
    }
  });

  $('.instance_tag_edit form, .instance_tag_show form').live('submit', function(){
    if($(this).find('#price_number').attr('id') == 'price_number'){
      if($(this).find('#price_number').val().toString().match(/^[1-9]{1}\d*\,\d{2}$/)){
        $.post($(this).attr("action"), $(this).serialize(), null, 'script');
        $(this).html('<img src="/images/ajax-loader.gif"/>');
      }
      else{
        $('.error').show();
      }
    }else{
      $.post($(this).attr("action"), $(this).serialize(), null, 'script');
      $(this).html('<img src="/images/ajax-loader.gif"/>');
    }
    return false;
  });
  
  //ajax user search
  $('.user_search').keyup(function(e){
    $('.user_ajax_search').html('<div class="ajax_center_wide"><center>loading... </center></div>');
    $.post($(this).attr("action"), $(this).serialize(), null, 'script');
		return false;
	});

  //ajax item search
  $('.item_search').keyup(function(e){
    $('.item_ajax_search').html('<div class="ajax_center_wide"><center>loading... </center></div>');
    $.post($(this).attr("action"), $(this).serialize(), null, 'script');
		return false;
	});

});