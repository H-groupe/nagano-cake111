class Admin::OrdersController < ApplicationController

  def show
    @member = Customer.find(params[:id])
    @orders = @member.orders
    @order = Order.find(params[:id])
    @order_history = @member.orders.order(created_at: :desc)
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
      flash[:notice] = "情報が更新されました"
  end
end
