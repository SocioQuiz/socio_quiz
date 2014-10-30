class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    change_column :users, :uid, :string
  end
end
