module WelcomeHelper
  def get_subdomain
    if request.subdomains.first.to_s.eql?('de')
      return 'de'
    elsif request.subdomains.first.to_s.eql?('en')
      return 'en'
    else
      return 'no'
    end
  end
end
