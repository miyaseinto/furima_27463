class PurchasessController < ApplicationController
  
  def index
  end

  def new
    @purchases = Purchases.new
  end

  def create
    @purchases = Purchases.new(purchases_params)
    if @purchases.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def purchases_params
    params.require(:purchase).permit(:item_id, :user_id)
  end


end
