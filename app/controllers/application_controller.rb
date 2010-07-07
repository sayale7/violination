# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :set_locale

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  helper :all
  helper_method :get_locale
  
  def set_locale
    # if this is nil then I18n.default_locale will be used
    if request.url.to_s.include?('www.')
      redirect_to "http://violination.com"
    end
  
    unless session[:locale].nil?
      I18n.default_locale = session[:locale].to_s 
    else
      I18n.default_locale = 'de'
    end
  end
  
  def english
    #I18n.default_locale = 'en'
    session[:locale] = "en"
    redirect_to :back
  end
  
  def german
    #I18n.default_locale = 'de'
    session[:locale] = "de"
    redirect_to :back
  end
  
  def set_default_url_for_mails
    if request.subdomains.first != nil
      ActionMailer::Base.default_url_options[:host] = request.subdomains.first + ".violination.com"
    end
  end
  
  private
  
  def get_locale
    unless session[:locale].nil?
      return session[:locale].to_s 
    else
      return 'de'
    end
  end
  
end
