class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.references :trip, :null => false
      t.references :location, :null => false
      t.date :arrival_date, :null => false

      t.timestamps
    end
    add_index :checkins, :trip_id
    add_index :checkins, :location_id
    
    add_column :posts, :checkin_id, :integer
    add_column :posts, :trip_id, :integer
    add_index :posts, :checkin_id
    add_index :posts, :trip_id
  end
end