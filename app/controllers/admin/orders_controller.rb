class Admin::OrdersController < ApplicationController

  def index
    @orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
     @order = Order.find(params[:id])
     order_detail.update(order_detail_params)
       flash[:notice] = "情報が更新されました"
  end
end
