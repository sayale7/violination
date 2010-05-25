class ViolinationMailer < ActionMailer::Base
  def request_confirmation(request)
    recipients    request.email
    from          "requests@violination.com"
    subject       "t(mailer.request)"
    sent_on       Time.now
    body          {:request => request}
  end
end
