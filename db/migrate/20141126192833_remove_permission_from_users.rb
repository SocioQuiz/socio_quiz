class RemovePermissionFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :permission, :string
  end
end
