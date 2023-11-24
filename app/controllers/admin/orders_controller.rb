class Admin::OrdersController < ApplicationController

  def show
    	# 注文内容の情報を取得
  	@order = Order.find(params[:id])
    # 注文内容の商品を取得
    @orders = Order.customer.id
  	@order_items = @order.order_details
    #@member = Customer.find(params[:id])
    #@orders = @member.orders
    #@order = Order.find(params[:id])
    #@order_history = @member.orders.order(created_at: :desc)
  end

  def edit
    @order = Order.find(params[:id])
    @order_items = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
      flash[:notice] = "情報が更新されました"
  end
  
  private

def order_params
  params.require(:order).permit(:address,:postal_code,:name, :total_price, :status, :postage, :payment_method)
end

  
  
end
