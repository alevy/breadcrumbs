class AddApprovedToComments < ActiveRecord::Migration
  def change
    add_column :comments, :approved, :boolean, :null => false, :default => false
  end
end
