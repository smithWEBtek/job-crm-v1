class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :user_signed_in?
  
  def self.user_signed_in?
    !!current_user
  end
end
