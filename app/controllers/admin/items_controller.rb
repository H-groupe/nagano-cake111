class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  def create
    @item = Item.new(items_params)
     if @item.save
      redirect_to admin_items_path
     else
      @items = Item.all
      render :index
     end
  end
  
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    
  end

  def edit
     @item = Item.find(params[:id])
      @genres = Genre.all
  end
  
  def update
     @item = Item.find(params[:id])
     if @item.update(items_params)
      flash[:notice] = "You have created book successfully."
      redirect_to admin_item_path(@item)
    else
       @item = Item.all
      render :edit
    end
  end
  
 private

   def items_params
     params.require(:item).permit(:name, :introduction, :genre_id, :price_excluding_tax, :is_sales_status)
   end
  
end
