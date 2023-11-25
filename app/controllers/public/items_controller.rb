class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  
  def index
    @items,@sort = get_items(params)
    @items = Item.page(params[:page])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
    @genres = Genre.all
  end
  
  def genre_search
    @genres = Genre.all
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id)
  end
  
  def search
    @genres = Genre.all
    @items = Item.where(genre_id: params[:format]).page(params[:page]).per(8) # パラメーターで渡ってきたジャンルidを元に、Item内のgenre_idと完全一致する商品情報を取得している。
    render 'index' # renderを使用してviewファイルを表示したときにはactionを呼び出し処理をしているわけではないため、上記のように必要な変数を用意しておく必要がある、
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
  
  # ジャンル検索機能

end
