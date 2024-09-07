class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @clients = Client.all

    # The `geocoded` scope filters only flats with coordinates
    @markers = @clients.geocoded.map do |client|
      {
        lat: client.latitude,
        lng: client.longitude,
        info_window_html: render_to_string(partial: "clients/info_window", locals: {client: client}),
        marker_html: render_to_string(partial: "clients/marker", locals: {client: client})

      }
    end
  end

  def catalogue
    @clients = Client.all
  end
end
