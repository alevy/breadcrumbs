class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :website
      t.string :comment, :null => false
      t.references :post, :null => false

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
