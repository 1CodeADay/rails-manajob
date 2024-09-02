class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.all
  end

  def create
    @client = Client.new(client_params)
    @client.save
    redirect_to clients_path(@client)
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def show
  end

  def update
    @client.update(params[:client])
    redirect_to client_path(@client)
  end

  def destroy
    @client.destroy
    redirect_to clients_path, status: :see_other
  end

private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :phone_number ,:address)
  end

  def set_client
    @client = Client.find(params[:id])
  end
end
