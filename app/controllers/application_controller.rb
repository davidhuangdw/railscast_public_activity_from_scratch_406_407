class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= session[:user_id].try{|id| User.find(id)}
  end

  helper_method :current_user

  def track_activity(trackable, user:current_user, action:params[:action])
    user.activities.create! action:action, user:user, trackable:trackable
  end

  def require_login
    redirect_to login_path, alert:'Log in first.' unless current_user
  end
end
