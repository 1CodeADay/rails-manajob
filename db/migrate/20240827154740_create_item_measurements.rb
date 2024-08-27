class CreateItemMeasurements < ActiveRecord::Migration[7.1]
  def change
    create_table :item_measurements do |t|
      t.string :title
      t.float :dimensions

      t.timestamps
    end
  end
end
