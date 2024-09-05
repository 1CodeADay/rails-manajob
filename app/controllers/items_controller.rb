class ItemsController < ApplicationController

  # POST /items
  #
  # Creates a new Item and associated Order and ItemCart. Redirects to the created item.
  #
  # The order is created with status "pending" and associated with the client and current user.
  # If the order already exists, the last one is picked.
  # The item is associated with the order and item cart.
  #
  # Redirects to the created item with a notice.
  def create
    @item = Item.new(item_params)
    if @item.save!
      if Order.where(client_id: params["client"], status: "pending", user_id: current_user.id).exists?
        ordre = Order.where(client_id: params["client"], status: "pending", user_id: current_user.id).last
      else
        ordre = Order.create!(client_id: params["client"], status: "pending", user_id: current_user.id)
      end
      ItemCart.create!(order_id: ordre.id, item_id: @item.id, deadline: params["deadline"], status: "pending")
      redirect_to item_path(@item), :notice => "Successfully created item."
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :fabric, :specifications, :item_type, :price, :deposit, :balance)
  end
end
