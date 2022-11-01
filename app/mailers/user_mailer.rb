class UserMailer < ApplicationMailer
  default from: 'daniel.sobit@student.moringaschool.com'

  def welcome_email
    @user = params[:user]
    @url = 'http://127.0.0.1:3000/login'
    mail(to: @user.email_address, subject: 'Welcome to Send-it!')
  end
end
