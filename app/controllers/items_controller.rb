class ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :fabric, :specifications, :item_type, :price, :deposit, :balance)
  end
end
