class UserMailer < ApplicationMailer
  default from: 'randi.cagle@gmail.com'

  def registration_confirmation(user)
    @user = user
    @url  = 'https://bloccitoff-rcagle23.c9.io/log_in'
    mail(to: @user.email, subject: 'Welcome to Bloccitoff!')
  end
  
  def password_reset(user)
    @user = user
    mail(to: @user.email, subject: "Password Reset")
  end
end
