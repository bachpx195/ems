class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :current_domain, only: [:new]

  # GET /resource/registrations
  # def new
  #   super
  # end

  # POST /resource/registrations
  # def create
  #   super
  # end

  protected
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :domain])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :intro, :avatar, :avatar_cache])
  end

  def after_update_path_for(resource)
    user_path(current_user.id)
  end

  def current_domain
    @host = request.protocol + request.host_with_port
  end
end
