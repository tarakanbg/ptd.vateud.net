class PtdMailer < ActionMailer::Base
  default from: "no-reply@vateud.net"


  def welcome_mail_pilot(pilot)
    @pilot = pilot
    mail(:to => @pilot.email, :subject => "Welcome to VATEUD training program")
  end

  def welcome_mail_users(pilot)
    @pilot = pilot
    mail(:to => User.email_recipients, :subject => "New pilot enrolled in the VATEUD PTD program")
  end
end
