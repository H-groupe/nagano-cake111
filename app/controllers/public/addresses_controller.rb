class Public::AddressesController < ApplicationController

  def index
    @address= Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end


  private
  def addresses_params
    params.require(:address).permit(:postal_code,
                                    :address,
                                    :name)
  end

end
