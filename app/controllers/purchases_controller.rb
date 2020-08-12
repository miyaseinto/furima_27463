class PurchasesController < ApplicationController
  before_action :move_to_index, only: :index

  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddresse.new
    @item.selling_price
  end

  def new
  end

  def create
    @purchase = PurchaseAddresse.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_addresse).permit(:postal, :prefectures, :area, :address, :building, :phone, :item_id).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
