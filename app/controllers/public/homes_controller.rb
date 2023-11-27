class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @new_items = Item.order(created_at: :desc).limit(4).where(is_sales_status:true)
    @genres = Genre.all
  end

  def about
  end
end
