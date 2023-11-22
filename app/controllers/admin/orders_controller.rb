class Admin::OrdersController < ApplicationController
  
  def index
    @orders
  end
  
  def show
    @orders = current_customer.order
  end
  
  def update
    
  end
end
