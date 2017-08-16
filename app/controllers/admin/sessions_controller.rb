class Admin::SessionsController < Devise::SessionsController
  layout false
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      user_session_path
    elsif resource_or_scope == :admin
      admin_session_path
    else
      root_path
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
