class Admin::BaseAdminController < ApplicationController
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery

  layout "admin/base"

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit :username
    end
  end
end
