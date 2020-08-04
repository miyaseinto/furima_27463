class PurchasessController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @purchases = PurchasesAddresse.new
  end

  def new
  end

  def create
    @purchases = PurchasesAddresse.new(purchases_params)
    if @purchases.valid?
      @purchases.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchases_params
    params.require(:purchases_addresse).permit(:postal, :prefectures, :area, :address, :building, :phone, :item_id).merge(user_id: current_user.id)
  end

end
