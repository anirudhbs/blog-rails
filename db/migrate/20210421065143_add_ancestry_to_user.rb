class AddAncestryToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :manager_id, :string
    add_index :users, :manager_id
  end
end
