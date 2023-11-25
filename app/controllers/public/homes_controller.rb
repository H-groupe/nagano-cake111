class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @new_items = Item.order(created_at: :desc).limit(4)
  end

  def about
  end
  
  def search
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id)
  end
  
end
