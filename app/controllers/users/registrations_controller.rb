class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/registrations
  # def new
  #   super
  # end

  # POST /resource/registrations
  # def create
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :intro])
  end

  # private
  # def configure_sign_in_params
  #   params.require(:user).permit(:email, :name, :intro, :password,
  #                                :password_confirmation, :current_password)
  # end
end