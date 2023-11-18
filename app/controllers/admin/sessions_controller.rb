# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
 
    if resource.admin?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      sign_out(resource_name)
      flash[:alert] = "管理者以外はログインできません。"
      redirect_to new_customers_session_path
    end
  end

  def destroy
    # ログアウトする
    sign_out(resource_name)
    set_flash_message! :notice, :signed_out if signed_in?
  end

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
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
