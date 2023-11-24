class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
     order_detail.update(order_detail_params)
       flash[:notice] = "情報が更新されました"
  end
  
  
  def order_detail_params
    params.require(:order_detail).permit(:quantity, :making_status, :price_including_tax)
  end
end
