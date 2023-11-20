class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  
  def index
    @items,@sort = get_items(params)
    @items = Item.all
    
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end
  
  def genre_search
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id)
  end
  
  private
  
  def get_items(params)
    return Item.all, 'default' unless params[:latest] || params[:price_high_to_low] || params[:price_low_to_high]
    
    return Item.latest, 'latest' if params[:latest]
    
    return Item.price_high_to_low, 'price_high_to_low' if params[:price_high_to_low]
    
    return Item.price_low_to_high, 'price_low_to_high' if params[:price_low_to_high]
  end
  
  def item_params
    params.require(:items).permit(:item_image, :name, :price_excluding_tax, :introduction, :is_sales_status)
  end

end
