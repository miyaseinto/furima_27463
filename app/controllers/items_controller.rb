class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :detail_category, :detail_status, :delivery_burden, :delivery_area, :delivery_days, :selling_price)
  end
end
