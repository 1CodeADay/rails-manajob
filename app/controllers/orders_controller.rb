class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def new
    @order = Order.new
    client_ids = Order.where(user_id: current_user.id).pluck(:client_id).uniq
    no_orders_client_ids = Client.where.not(id: Order.pluck(:client_id).uniq).pluck(:id)
    @clients = Client.where(id: client_ids + no_orders_client_ids)
  end

  def show
  end

  def edit

  end

  def create
  end

  def update
    @order.update(order_params)
    redirect_to order_path(@order)
  end

  def destroy
    @order.destroy
    redirect_to orders_path, status: :see_other
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
