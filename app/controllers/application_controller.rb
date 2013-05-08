class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :login_user,
                :current_user

  def login_user(user)
    # TODO: Refactor this to encrypted uid
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def require_user
    redirect_to root_url if !current_user
  end
end
