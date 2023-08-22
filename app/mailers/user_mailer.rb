class UserMailer < ApplicationMailer
  def welcome_email(user)
    # user= params[:user]
    @url='http://localhost:3000/users/sign_in'
    byebug
    mail(to: user, subject:"Welcome to blog app")
  end
end
