class ApplicationController < ActionController::Base
include SessionsHelper
before_filter :signed_in_user
helper_method :current_user
helper_method :whos_signed_in


def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def whos_signed_in
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def signed_in_user
  redirect_to log_in_url, notice: "Please sign in" unless signed_in?
end


end