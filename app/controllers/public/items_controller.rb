class Public::ItemsController < ApplicationController
  def index
    @items,@sort = get_items(params)
  end

  def show
    @item = Item.find(params[:id])
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

end
