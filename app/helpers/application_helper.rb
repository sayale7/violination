# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def get_tagging_type
    if request.url.to_s.include?('users')
      return 'User'
    else
      return 'Instrumnet'
    end
  end
  
end
