class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?


  private
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_root_path
    else
      customer_session_path
    end
  end

  def after_sign_out_path_for(resource)
    admin_session_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :address, :postal_code, :telephone_number])
  end

end
