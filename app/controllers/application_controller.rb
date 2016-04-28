class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorized?

  private

    def current_user
      # if no current user, find the user through the session if the session contains a user_id
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorized?
      redirect_to login_path if !logged_in?
    end

    def logged_in?
      !!current_user
    end

    helper_method :current_user, :logged_in?

end
