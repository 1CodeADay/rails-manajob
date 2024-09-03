class AddCoordinatesToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :latitude, :float
    add_column :clients, :longitude, :float
  end
end
