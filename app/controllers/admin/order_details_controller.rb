class Admin::OrderDetailsController < ApplicationController
  def show
    @order = Order.find(params[:id]) #<=views/admin/homes/topの遷移するpathがorder.idを使っているためOrderDetailsからidを取ってくるのではなくてOrderから取ってくる。
    @customer = @order.customer
    @orders = @customer.orders.page(params[:page])
  end


  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
    is_updated = true
    if @order_detail.update(order_detail_params)
       @order.update(status:"in_production")if @order_detail.making_status == "start"
       flash[:notice] = "情報が更新されました"
       is_updated = @order_details.all? { |order_detail| order_detail.making_status == "finish" }
       #下記の内容が上でやっている処理の中身
       #@order_details.each do |order_detail|
           #if order_detail.making_status !="finish"
               #is_updated = false
           #end
        #end
        @order.update(status:"preparing")if is_updated
    end
    redirect_to admin_order_path(@order_detail.order), notice:"製作ステータスを更新しました"
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
