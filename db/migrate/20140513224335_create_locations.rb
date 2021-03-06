class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float   :longitude
      t.float   :latitude
      t.string  :city

      t.boolean :indy, default: false

      t.timestamps
    end
  end
end
