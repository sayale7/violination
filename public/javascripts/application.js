// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// jQuery.fn.extend({
//   setDivDisabled:function(){ 
//     $(this).append('<div class="disabled"/>');
//     $('.disabled').css('width', $(this).css('width'));
//     $('.disabled').css('height', $(this).css('height'));
//   },
//   setDivEnabled:function(){
//     
//   },
// });

// ready when document has loaded
$(document).ready(function() {
  
  //remove non-js section if js is enabled
  $('#edit_user_tags_no_js').remove();
  //set js section visible if js ist enabled
  $('#edit_user_tags').css('display', 'block');
  
  
  //!!!add tag to user the ajax way!!!
  $('.add_tag_root').live('click', function() {
    $('#third_sub_tags').fadeOut('slow');
    $('#second_sub_tags').fadeOut('slow');
    $('#first_sub_tags').fadeOut('slow');
    $.getScript(this.href);
    return false;
  });
  
  $('.add_tag_first').live('click', function() {
    $('#third_sub_tags').fadeOut('slow');
    $('#second_sub_tags').fadeOut('slow');
    $.getScript(this.href);
    return false;
  });
  
  $('.add_tag_second').live('click', function() {
    $('#third_sub_tags').fadeOut('slow');
    $.getScript(this.href);
    return false;
  });
  
  $('.add_tag_third').live('click', function() {
    $.getScript(this.href);
    return false;
  });
    
  //!!!edit ajax calls!!!
  $('.edit_tag_first').live('click', function() {
    $('#edit_specific_user_tags').css('display', 'block');
    $('#third_sub_tags').fadeOut('fast');
    $('#second_sub_tags').fadeOut('fast');
    $('#first_sub_tags').fadeIn('slow');
    $('#first_sub_tags').html('<img src="/images/ajax-loader.gif"/>');
    $.getScript(this.href);
    return false;
  });
  
  $('.edit_tag_second').live('click', function() {
    $('#third_sub_tags').fadeOut('fast');
    $('#second_sub_tags').fadeIn('slow');
    $('#second_sub_tags').html('<img src="/images/ajax-loader.gif"/>');
    $.getScript(this.href);
    return false;
  });
  
  $('.edit_tag_third').live('click', function() {
    $('#third_sub_tags').fadeIn('slow');
    $('#third_sub_tags').html('<img src="/images/ajax-loader.gif"/>');
    $.getScript(this.href);
    return false;
  });
  
  
  //!!!hide_call!!
  $('.hide_tag_first').live('click', function() {
    $('#first_sub_tags').fadeOut('slow');
    $('#second_sub_tags').fadeOut('slow');
    $('#third_sub_tags').fadeOut('slow');
    return false;
  });
  
  $('.hide_tag_second').live('click', function() {
    $('#second_sub_tags').fadeOut('slow');
    $('#third_sub_tags').fadeOut('slow');
    return false;
  });
  
  $('.hide_tag_third').live('click', function() {
    $('#third_sub_tags').fadeOut('slow');
    return false;
  });
  
  //!!!remove ajax calls!!
  $('.remove_tag_root').live('click', function() {
    $('#third_sub_tags').fadeOut('slow');
    $('#second_sub_tags').fadeOut('slow');
    $('#first_sub_tags').fadeOut('slow');
    $('#edit_specific_user_tags').fadeOut('slow');
    $.getScript(this.href);
    return false;
  });
  
  
  $('.remove_tag_first').live('click', function() {
    $('#third_sub_tags').fadeOut('slow');
    $('#second_sub_tags').fadeOut('slow');
    $.getScript(this.href);
    return false;
  });
  
  $('.remove_tag_second').live('click', function() {
    $('#third_sub_tags').fadeOut('slow');
    $.getScript(this.href);
    return false;
  });
  
  $('.remove_tag_third').live('click', function() {
    $.getScript(this.href);
    return false;
  });

});