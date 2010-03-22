// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// ready when document has loaded
$(document).ready(function() {
  
  //hide edit link if js is enabled (show instrument)
  $('.edit_instrument').remove();
  

  $('.instance_tag_js').live('mouseover', function(){
    $(this).find('.edit_tag_links').css('display', 'block');
  }).live('mouseout', function(){
    $(this).find('.edit_tag_links').css('display', 'none');
  });
  
  $('#instance_tag_without_children a, #instance_tag_with_children a, #available_instance_tags_js a').live('click', function(){
    if($(this).attr('rel') == 'edit'){
      $(this).parent().parent().hide(); //.removeClass('visible').addClass('hidden');
      $(this).parent().parent().parent().find('#instance_tag_edit').fadeIn('slow'); //.removeClass('hidden').addClass('visible');
      return false;
    }else if($(this).attr('rel') == 'close'){
      $(this).parent().parent().hide(); //.removeClass('visible').addClass('hidden');
      $(this).parent().parent().parent().find('#instance_tag_show').fadeIn('slow'); //.removeClass('hidden').addClass('visible');
      return false;
    }else{
      $(this).html('<img src="/images/ajax-loader.gif"/>');
      $.getScript(this.href);
      return false;
    }  
    
  });

  $('#instance_tag_edit form, #instance_tag_show form').live('submit', function(){
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


});