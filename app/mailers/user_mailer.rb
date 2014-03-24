class UserMailer < ActionMailer::Base
  default from: "mosh.system@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "http://mosh.c-mccarthy.com"
    mail(to: @user.email, subject: "Welcome to MOSH!")
  end

end
