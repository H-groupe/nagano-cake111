class SearchesController < ApplicationController
  
  def search
    @genres = Genre.all
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id)
  end
  
end
