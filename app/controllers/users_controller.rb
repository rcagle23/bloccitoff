class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def index
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      redirect_to root_url, :notice => "Account created! An email has been sent to #{@user.email} to confirm the account."
    else
      flash[:error] = "Something went wrong, please try again."
      render "new"
    end
  end
  
  def confirm_email
    user = User.find_by(confirm_token: params[:confirm_token])
    if user
      user.confirm!
      flash[:notice] = "Your email has been confirmed #{@user}! Please sign in to continue."
      redirect_to log_in_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end
end
