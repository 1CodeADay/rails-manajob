class ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
    # create order and item cart for new item
    # verify if order created or not
    # if order created, create item cart
    # else create new order and item cart and item

    
    if @item.save!
      redirect_to @item
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :fabric, :specifications, :item_type, :price, :deposit, :balance)
  end
end
