class ItemMeasurementsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]


  def create
    item = ItemMeasurement.new(title: params["title"], dimensions: params["dimension"], client_id: params["clientId"])
    respond_to do |format|
      if item.save
        format.json # Follows the classic Rails flow and look for a create.json view
      end
    end
  end
end
