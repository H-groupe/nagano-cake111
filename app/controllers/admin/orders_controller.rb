class Admin::OrdersController < ApplicationController

  def index
    @orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def update

  end
end
