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
  //set js section visible if js ist enabled
  $('#edit_user_tags').css('display', 'block');
  
  
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
  


});