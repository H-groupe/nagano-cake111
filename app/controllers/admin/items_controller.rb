class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
     if @item.save
      redirect_to item_path
     else
      @items = Item.all
      render :index
     end
  end
  
  def index
    @items = Item.all
    
  end

  def show
    
  end

  def edit
    
  end

 
end
