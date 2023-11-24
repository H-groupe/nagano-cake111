class Admin::OrdersController < ApplicationController

  def index
    @order = Order
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
     @order = Order.find(params[:id])
     @order.update(order_params)
       flash[:notice] = "情報が更新されました"
  end
end
