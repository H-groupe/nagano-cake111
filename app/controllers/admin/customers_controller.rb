class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      #byebug
      redirect_to admin_customer_path(@customer), notice: "会員情報を更新しました。"
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, 
                                     :first_name_kana, :postal_code, :address, :telephone_number, 
                                     :email, :is_membership_status)

  end
end
