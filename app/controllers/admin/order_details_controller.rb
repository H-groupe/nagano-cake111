class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
     order_detail.update(order_detail_params)
       flash[:notice] = "情報が更新されました"
      
      
     end
  end
end
