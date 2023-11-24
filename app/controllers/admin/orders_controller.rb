class Admin::OrdersController < ApplicationController
  
  def index
    
  end
  
  def show
  	# 注文内容の情報を取得
  	@order = Order.find(params[:id])
    # 注文内容の商品を取得
  	@order_items = @order.order_items
  end
  
  def update
    
  end
end
