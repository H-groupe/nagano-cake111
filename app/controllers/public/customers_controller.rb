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
        redirect_to customers_show_path
      else
        render 'edit'
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