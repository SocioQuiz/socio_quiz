class AddPermissionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :permission, :string
  end
end
