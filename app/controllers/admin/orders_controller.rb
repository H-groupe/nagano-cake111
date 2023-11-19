class Admin::OrdersController < ApplicationController
  def show
    @order = current_customer.orders
  end
end
