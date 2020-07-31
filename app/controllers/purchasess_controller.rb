class PurchasessController < ApplicationController
  
  def index
  end

  def create
    Purchasess.create(purchases_params)
  end

  private
  def purchases_params
    params.require(:purchase).permit(:item_id, :user_id)
  end


end
