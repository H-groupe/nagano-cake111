class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.quantity += params[:cart_item][:quantity].to_i
      cart_item.save
      redirect_to cart_items_path

    elsif @cart_item.save
          @cart_items = current_customer.cart_items.all
          render 'index'
    else
      render 'index'
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    @cart_items = CartItem.all
      render 'index'
  end

  def all_destroy
    cart_items = CartItem.all
    cart_items.destroy_all
      render 'index'
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_back(fallback_location: items_path)
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :price_excluding_tax, :quantity)
    end
end