# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def get_tagging_type
    if request.url.to_s.include?('users')
      return 'User'
    else
      return 'Instrumnet'
    end
  end
  
  def get_added_tags_for_menu(taggable_id) 
    user = User.find(taggable_id)
    return user.tags.find_all_by_parent_id(nil)
  end
  
end
