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
    if request.url.to_s.include?('www.') or request.subdomains.first.to_s.eql?('')
        if request.url.to_s.include?('.com')
          redirect_to "http://de.#{request.url}"
        end
    end
    unless I18n.locale.to_s.eql?(request.subdomains.first.to_s)
      I18n.locale = request.subdomains.first.to_s
    end
  end
  
  def english
    #I18n.default_locale = 'en'
    redirect_to "http://en.#{request.url}"
  end
  
  def german
    #I18n.default_locale = 'de'
    redirect_to "http://de.#{request.url}"
  end
  
  def set_default_url_for_mails
    if request.subdomains.first != nil
      ActionMailer::Base.default_url_options[:host] = request.subdomains.first + ".violination.com"
    end
  end
  
  def set_locale_by_hand
    I18n.default_locale = params[:option]
    redirect_to root_url
  end
  
  private
  
  def get_locale
    if request.url.to_s.include?('.com')
      I18n.locale
    else
      I18n.default_locale
    end
  end
  
end
