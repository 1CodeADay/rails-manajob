class CreateItemMeasurements < ActiveRecord::Migration[7.1]
  def change
    create_table :item_measurements do |t|
      t.string :title
      t.string :dimensions
      t.string :item_type
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
