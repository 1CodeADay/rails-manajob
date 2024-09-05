class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.all

    # The `geocoded` scope filters only flats with coordinates
    @markers = @clients.geocoded.map do |client|
      {
        lat: client.latitude,
        lng: client.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {client: client}),
        marker_html: render_to_string(partial: "marker", locals: {client: client})

      }
    end
  end

  def create
    @client = Client.new(client_params)
    if @client.save!
      redirect_to clients_path(@client)
    end
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def show
    @client = Client.find(params[:id])
    # client measurements
    @measurements = ItemMeasurement.where(client_id: @client.id)
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
    params.require(:client).permit(:first_name, :last_name, :phone_number, :address, :photo)
  end

  def set_client
    @client = Client.find(params[:id])
  end
end
