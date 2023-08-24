class PasswordsController < ApplicationController
  def new
  end

  def create
    @user=User.find_by(email: params[:passwords][:email])
    if @user
      
      @user.reset_password_token = @user.generate_token
      @user.reset_password_sent_at = Time.zone.now
      @user.save
      @user.send_password_reset_instructions
      flash[:info] = 'Email is sent with password reset instructions'

      redirect_to new_user_session_path
    # else
    #   redirect_to new_user_session_path
    end

  end

  def edit
     @user=User.find(params[:id])
  end

  def update
    @user=User.find_by(email: params[:user][:email])
    debugger
    if user_valid?(params["user"]["reset_password_token"]) && @user.token_valid?
      @user.reset_password_token = nil
      @user.reset_password_sent_at = nil
      @user.encrypted_password = params[:user][:password]
      @user.save
      redirect_to new_user_session_path
    else 
      
    end

  end

  private
  def user_valid?(reset_password_token)
    reset_password_token == @user.reset_password_token
  end

end
