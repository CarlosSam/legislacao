class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # GET /application/home_page
  def home_page
    if user_signed_in?
      redirect_to projects_welcome_path
    elsif admin_signed_in?
      redirect_to politicians_path
    else
      redirect_to projects_welcome_path
    end
  end

end
