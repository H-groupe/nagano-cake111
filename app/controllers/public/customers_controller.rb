class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!


  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
       flash[:notice]= "会員情報が更新されました。"
       redirect_to customers_show_path
    else
       render 'edit'
    end
  end
  
  def withdraw
    @customer = current_customer
    if @customer.update(is_membership_status: false)
      sign_out(@customer)
       flash[:notice]= "退会が完了しました。"
       redirect_to root_path
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name,
                                     :first_name,
                                     :family_name_kana,
                                     :first_name_kana,
                                     :postal_code,
                                     :address,
                                     :telephone_number,
                                     :email
                                     )
  end
  
  
end