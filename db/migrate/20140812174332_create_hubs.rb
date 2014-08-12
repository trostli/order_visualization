class CreateHubs < ActiveRecord::Migration
  def change
    create_table :hubs do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
