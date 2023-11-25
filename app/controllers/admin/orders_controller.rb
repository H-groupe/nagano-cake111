class Admin::OrdersController < ApplicationController

  def show
    	# 注文内容の情報を取得
  	@order = Order.find(params[:id])
    # 注文内容の商品を取得
  	@order_items = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if@order.update(order_params)
      @order_details.update_all(making_status:"wait")if @order.status == "paid_up"
      flash[:notice] = "情報が更新されました"
    end  
    redirect_to admin_order_path(@order.id)
  end
  
  private

  def order_params
    params.require(:order).permit( :status)
  end
end
