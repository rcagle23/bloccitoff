class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_action :authenticate!
  
  def authenticate!
    redirect_to sign_up_path if current_user.nil?
  end
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end
end
