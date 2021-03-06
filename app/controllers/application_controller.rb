class ApplicationController < ActionController::Base
  # applicationHelperの呼び出し
  # include ApplicationHelper
  
  protect_from_forgery with: :exception
  
  add_flash_types :success, :info, :warning, :danger
  
  # viewでもcontrollerのメソッドを使えるようにする
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
   
  def logged_in?
    !current_user.nil?
  end
end