class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :hub
      t.belongs_to :driver
      t.float :latitude
      t.float :longitude
      t.integer :num_items
      t.timestamp :created_at
      t.timestamp :started_at
      t.timestamp :completed_at
      t.integer :batched_order_id
    end
  end
end
