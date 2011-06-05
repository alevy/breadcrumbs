class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city, :null => false
      t.string :administrative_zone
      t.string :country, :null => false
      t.string :region, :null => false

      t.timestamps
    end
  end
end
