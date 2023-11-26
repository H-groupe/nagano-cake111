class Admin::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]
    
    if @range == "item"
      @items = Item.where("name LIKE?","%#{@word}%").page(params[:page]).per(8)
    else
      @customer = Custo.where("name LIKE?","%#{@word}%").page(params[:page])
      render 'search_result'
    end
  end
  
end
