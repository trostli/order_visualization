class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :hub
      t.float :latitude
      t.float :longitude
      t.integer :number_of_items

      t.timestamps
    end
  end
end
