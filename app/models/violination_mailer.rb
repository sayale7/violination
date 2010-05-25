class ViolinationMailer < ActionMailer::Base
  def request_confirmation(request)
    recipients    request.email
    from          "requests@violination.com"
    subject       t(mailer.request)
    sent_on       Time.now
    content_type  "text/html"
    body          :request => request
  end
  
  def request_to_admin(request)
    recipients    "thomas.kohler@gmx.at"
    from          "requests@violination.com"
    subject       t(mailer.request)
    sent_on       Time.now
    content_type  "text/html"
    body          :request => request
    template "/violination_mailer/request_confirmation"
  end
end
