class ItemCartsController < ApplicationController
  def index
    @item_carts = ItemCart.all
  end

  def new
    @item_cart = ItemCart.new
  end

  def create
    @item_cart = ItemCart.new(item_cart_params)
    if @item_cart.save
      redirect_to item_cart_path(@item_cart), :notice => "Successfully created item cart."
    else
      render :action => 'new'
    end
  end

  def show
    @item_cart = ItemCart.find(params[:id])
  end

  def edit
    @item_cart = ItemCart.find(params[:id])
  end

  def update
    @item_cart = ItemCart.find(params[:id])
    if @item_cart.update(item_cart_params)
      redirect_to item_cart_path(@item_cart), :notice  => "Successfully updated item cart."
    else
      render :action => 'edit'
    end
  end

  private

  def item_cart_params
    param.require(:item_cart).permit(:item_id, :client_id)
  end
  
end
