class Admin::OrdersController < ApplicationController
  def show
    @orders = current_customer.orders
  end
end
