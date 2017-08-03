class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def authenticate_user!
    if user_signed_in?
      super
    else
      store_location_for :user, request.url
      redirect_to user_session_path
    end
  end
end
