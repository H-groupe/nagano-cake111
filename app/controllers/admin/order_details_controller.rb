class Admin::OrderDetailsController < ApplicationController
  def show
    @
  end
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
    is_updated = true
    if @order_detail.update(order_detail_params)
       @order.update(status:"in_production")if @order_detail.making_status == "start"
       flash[:notice] = "情報が更新されました"
       @order_details.each do |order_detail|
       if order_detail.making_status !="finish"
           is_updated = false
       end
    end
    @order.update(status:"prepareing")if is_updated 
    end
    redirect_to admin_order_path(@order_detail.order), notice:"製作ステータスを更新しました"   
  end
  
  
  def order_detail_params
    params.require(:order_detail).permit(:making_status, :status)
  end
end
