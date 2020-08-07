class PurchasessController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @purchases = PurchasesAddresse.new
    @item.selling_price
  end

  def new
  end

  def create
    @purchases = PurchasesAddresse.new(purchases_params)
    if @purchases.valid?
      pay_item
      @purchases.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchases_params
    params.permit(:postal, :prefectures, :area, :address, :building, :phone, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: params[:token],
      currency:'jpy'
    )
  end
end
