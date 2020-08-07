class AddressesController < ApplicationController

  def index
  end

  def new
    @addresses = PurchasesAddresse.new
  end

  def create
    @addresses = PurchasesAddresse.new(addresses_params)
  end


  private
  def addresses_params
    params.require(:purchases_addresse).permit(:postal, :prefectures, :area, :address, :building)
  end

end

