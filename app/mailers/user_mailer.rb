class UserMailer < ApplicationMailer
  def welcome_email(user)
    # user= params[:user]
    @url='http://localhost:3000/users/sign_in'
    mail(to: user, subject:"Welcome to blog app")
  end

   def reset_password_email(user) 
    @user=user
    mail(to: user.email, subject:"Reset Password")
  end

end
