class NotificationMailer < ActionMailer::Base
  default from: "no-reply@thecityspots.com"

  def comment_added(comment)
    @spot = comment.spot
    @spot_owner = @spot.user

    mail(to: @spot_owner.email,
         subject: "A comment has been added to #{@spot.name}")
  end
end
