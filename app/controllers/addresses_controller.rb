class AddressesController < ApplicationController

  def new
    @addresse = Addresse.new
  end

  def create
    # binding.pry
    @addresse = Addresse.new(addresse_params)
    if @addresse.save
      redirect_to root_path
    else
      render purchasess_index_path(:id)
    end
  end

  private

  def addresse_params
    params.require(:addresse).permit(:postal, :prefectures, :area, :address, :building, :phone)
  end

end
