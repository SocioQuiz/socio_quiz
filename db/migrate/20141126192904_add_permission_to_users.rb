class AddPermissionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :permission, :string, :null => false, :default => 'general'
  end
end
