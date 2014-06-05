class NotificationMailer < ActionMailer::Base
  default from: "no-reply@thecityspots.com"

  def comment_added
    mail(to: "taahac@taahac.me",
         subject: "A comment has been added to your place")
  end
end
