class Public::SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    
    if @range == "item"
      @items = Item.looks(params[:search],params[:word]).page(params[:page])
      
      render 'search_result'
    end
  end
  
end
