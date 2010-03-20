// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


jQuery.fn.extend({
  fadeAllOut:function(){
    $('#third_sub_tags').fadeOut('slow');
    $('#second_sub_tags').fadeOut('slow');
    $('#first_sub_tags').fadeOut('slow');
  },
  fadeLastTwoOut:function(){
    $('#third_sub_tags').fadeOut('slow');
    $('#second_sub_tags').fadeOut('slow');
  },
  fadeLastOut:function(){
    $('#third_sub_tags').fadeOut('slow');
  },
  hideAll:function(){
    $('#third_sub_tags').hide();
    $('#second_sub_tags').hide();
    $('#first_sub_tags').hide();
  },
  hideLastTwo:function(){
    $('#third_sub_tags').fadeOut('slow');
    $('#second_sub_tags').fadeOut('slow');
  },
  hideLast:function(){
    $('#third_sub_tags').fadeOut('slow');
  },
  fadeThisIn:function(){
    $(this).fadeIn('slow');
    $(this).html('<img src="/images/ajax-loader.gif"/>');
  },
});

// ready when document has loaded
$(document).ready(function() {
  
  //remove non-js section if js is enabled
  $('#edit_user_tags_no_js').remove();
  $('#edit_instrument_tags_no_js').remove();
  $('.number').css('display', 'none');
  //set js section visible if js ist enabled
  $('#edit_user_tags').css('display', 'block');
  $('#edit_instrument_tags').css('display', 'block');
  
  
  
  //!!!add tag to user the ajax way!!!
  $('.add_tag_root').live('click', function() {
    $(this).hideAll();
    $('#root_tags').find('.tag_left').fadeThisIn();
    $('#root_tags').find('.tag_right').fadeThisIn();
    $.getScript(this.href);
    return false;
  });
  
  $('.add_tag_first').live('click', function() {
    $(this).hideLastTwo();
    $('#first_sub_tags').find('.tag_left').fadeThisIn();
    $('#first_sub_tags').find('.tag_right').fadeThisIn();
    $.getScript(this.href);
    return false;
  });
  
  $('.add_tag_second').live('click', function() {
    $(this).hideLast();
    $('#second_sub_tags').find('.tag_left').fadeThisIn();
    $('#second_sub_tags').find('.tag_right').fadeThisIn();
    $.getScript(this.href);
    return false;
  });
  
  $('.add_tag_third').live('click', function() {
    $('#third_sub_tags').find('.tag_left').fadeThisIn();
    $('#third_sub_tags').find('.tag_right').fadeThisIn();
    $.getScript(this.href);
    return false;
  });
  
  
  //!!!remove ajax calls!!
  $('.remove_tag_root').live('click', function() {
    $(this).hideAll();
    $('#root_tags').find('.tag_left').fadeThisIn();
    $('#root_tags').find('.tag_right').fadeThisIn();
    $.getScript(this.href);
    return false;
  });
  
  
  $('.remove_tag_first').live('click', function() {
    $(this).hideLastTwo();
    $('#first_sub_tags').find('.tag_left').fadeThisIn();
    $('#first_sub_tags').find('.tag_right').fadeThisIn();
    $.getScript(this.href);
    return false;
  });
  
  $('.remove_tag_second').live('click', function() {
    $(this).hideLast();
    $('#second_sub_tags').find('.tag_left').fadeThisIn();
    $('#second_sub_tags').find('.tag_right').fadeThisIn();
    $.getScript(this.href);
    return false;
  });
  
  $('.remove_tag_third').live('click', function() {
    $('#third_sub_tags').find('.tag_left').fadeThisIn();
    $('#third_sub_tags').find('.tag_right').fadeThisIn();
    $.getScript(this.href);
    return false;
  });
    
  //!!!edit ajax calls!!!
  $('.edit_tag_first').live('click', function() {
    $(this).hideAll();
    $('#edit_specific_user_tags').css('display', 'block');
    $('#first_sub_tags').fadeThisIn();
    $.getScript(this.href);
    return false;
  });
  
  $('.edit_tag_second').live('click', function() {
    $(this).hideLastTwo();
    $('#second_sub_tags').fadeThisIn();
    $.getScript(this.href);
    return false;
  });
  
  $('.edit_tag_third').live('click', function() {
    $('#third_sub_tags').fadeThisIn();
    $.getScript(this.href);
    return false;
  });
  
  
  //!!!hide_call!!
  $('.hide_tag_first').live('click', function() {
    $(this).fadeAllOut();
    return false;
  });
  
  $('.hide_tag_second').live('click', function() {
    $(this).fadeLastTwoOut();
    return false;
  });
  
  $('.hide_tag_third').live('click', function() {
    $(this).fadeLastOut();
    return false;
  });
  
  $('.instrument_tag_js').live('mouseover', function(){
    $(this).find('.edit_tag_links').css('display', 'block');
  }).live('mouseout', function(){
    $(this).find('.edit_tag_links').css('display', 'none');
  });
  
  $('#instrument_tag_without_children a, #instrument_tag_with_children a, #available_instrument_tags_js a').live('click', function(){
    if($(this).attr('rel') == 'edit'){
      $(this).parent().parent().removeClass('visible').addClass('hidden');
      $(this).parent().parent().parent().find('#instrument_tag_edit').removeClass('hidden').addClass('visible');
      return false;
    }else if($(this).attr('rel') == 'close'){
      $(this).parent().parent().removeClass('visible').addClass('hidden');
      $(this).parent().parent().parent().find('#instrument_tag_show').removeClass('hidden').addClass('visible');
      return false;
    }else{
      $(this).html('<img src="/images/ajax-loader.gif"/>');
      $.getScript(this.href);
      return false;
    }  
    
  });
  
  $('#instrument_tag_edit form, #instrument_tag_show form').live('submit', function(){
    $.post($(this).attr("action"), $(this).serialize(), null, 'script');
    return false;
  });


});