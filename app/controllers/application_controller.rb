class ApplicationController < ActionController::Base
  helper ApplicationHelper
  # before_action :authenticate_customer!, except: [:top, :about]←全体に影響を及ぼす。本来ならこの記述をregistrationなどに入力しないといけない。

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_action :authenticate_any!
  
  def authenticate_any!

    if request.path.match(/\/admin(\/)?/) #url判定(adminですかー？って聞いてる！urlにadminを含んでいるか)
     #正規化表現・・・本来そんなに使わない。

     authenticate_admin! #adminログイン制限

    elsif controller_name == 'items' || action_name == 'top' || action_name == 'about'
      #itemsコントローラーかtopアクションまたはaboutアクションが読み込まれるとき
      return # 処理を抜ける
    else

      authenticate_customer! # customerログイン制限（例外になりますよー！）

    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_root_path
    else
      customer_session_path
    end
  end

  #def after_sign_up_path_for(resource)
    #customers_path
  #end
  
  #def after_sign_in_path_for(resource)
    #root_path
  #end

  def after_sign_out_path_for(resource)
    admin_session_path
  end
  
 private
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_root_path
    else
      customer_session_path
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :address, :postal_code, :telephone_number])
  end

end
