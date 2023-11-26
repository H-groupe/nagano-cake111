class Public::SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    @word = params[:word]
    
    if @range == "item"
      @items = Item.where("name LIKE?","%#{@word}%").page(params[:page]).per(8)
      render 'search_result'
    end
  end
  
end
