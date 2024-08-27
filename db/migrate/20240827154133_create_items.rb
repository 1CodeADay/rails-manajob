class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :fabric
      t.text :specifications
      t.string :type
      t.float :price
      t.float :deposit
      t.float :balance

      t.timestamps
    end
  end
end
