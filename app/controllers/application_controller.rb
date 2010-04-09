# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  helper :all
  helper_method :get_locale
  
  #Setting the locale through subdomains
  # def set_locale
  #   # if this is nil then I18n.default_locale will be used
  #   if request.url.to_s.include?('www.')
  #     I18n.locale = "de"
  #   else
  #     I18n.locale = request.subdomains.first
  #   end
  # end
  
  private
  
  def get_locale
    return I18n.locale
  end
  
end
