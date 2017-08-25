class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def authenticate_user!(options={})
    if user_signed_in?
      super(options)
    else
      store_location_for :user, request.url
      redirect_to user_session_path
    end
  end

  def new_session_path *args
    user_session_path
  end
end
