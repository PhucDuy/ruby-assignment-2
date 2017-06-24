class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :require_login, except: [:new,:create]

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  def require_login
    if session.has_key?(:user_id)

    else
      redirect_to new_session_path
    end
  end
end
