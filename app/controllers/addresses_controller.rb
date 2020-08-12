class AddressesController < ApplicationController
  def index
  end

  def new
    @addresses = PurchaseAddresse.new
  end

  def create
    @addresses = PurchaseAddresse.new(addresses_params)
  end

  private

  def addresses_param
    params.require(:purchase_addresse).permit(:postal, :prefectures, :area, :address, :building)
  end
end
